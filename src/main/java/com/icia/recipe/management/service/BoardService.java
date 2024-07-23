package com.icia.recipe.management.service;

import com.icia.recipe.management.dao.BoardDao;
import com.icia.recipe.management.dto.BoardDto;
import com.icia.recipe.management.dto.FoodItemDto;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Slf4j
@Service
public class BoardService {

    @Autowired
    private BoardDao bDao;

    public static final int PAGECOUNT = 2;

    // 식자재 대분류 값 가져오기
    public List<BoardDto> getFoodItemBigCg() {
        return bDao.getFoodItemBigCg();
    }

    // 레시피 대분류 값 가져오기
    public List<BoardDto> getRecipeBigCg() {
        return bDao.getRecipeBigCg();
    }

    // 식자재 중분류 값 가져오기
    public List<BoardDto> getFoodItemMidCg(String cg) {

        return bDao.getFoodItemMidCg(cg);
    }

    // 레시피 중분류 값 가져오기
    public List<BoardDto> getRecipeMidCg(String cgNum) {
        return bDao.getRecipeMidCg(cgNum);
    }

    // 식자재 소분류 값 가져오기
    public List<BoardDto> getFoodItemSmCg(String cg) {
        return bDao.getFoodItemSmCg(cg);
    }

    // 레시피 소분류 값 가져오기
    public List<BoardDto> getRecipeSmCg(String cgNum) {
        return bDao.getRecipeSmCg(cgNum);
    }

    public List<?> deleteCategory(String name, String cg) {
        boolean result = bDao.deleteCategory(name, cg);
        log.info(name);
        if (result) {
            return getAllCategory(name, cg);
        } else {
            log.info("[삭제] 서비스 에러");
            return null;
        }
    }
    // 모달 식자재 등록
    public boolean insertFoodItem(MultipartHttpServletRequest request, HttpSession session) throws IOException {
        log.info("[모달] 서비스 진입");
        String fiCode = request.getParameter("fiCode");
        String fiPrice = request.getParameter("fiPrice");
        String fiBigCg = request.getParameter("fiBigCg");
        String fiMidCg = request.getParameter("fiMidCg");
        String fiCounts = request.getParameter("fiCounts");
        String fiExDate = request.getParameter("fiExDate");
        String fiContents = request.getParameter("fiContents");
        String fiTitle = request.getParameter("fiTitle");
        String fiVolume = request.getParameter("fiVolume");
        String fiOrigin = request.getParameter("fiOrigin");
        String fiCal = request.getParameter("fiCal");
        String fiSave = request.getParameter("fiSave");
        String role = "ADMIN";
        List<MultipartFile> files = request.getFiles("fiFiles");
        ArrayList<String> fileList = new ArrayList<>();

        boolean update = bDao.insertFoodItem(fiCode, fiExDate, fiCounts, fiBigCg,
                fiMidCg, fiPrice, fiContents, fiTitle, fiVolume, fiOrigin, fiCal, fiSave);
        boolean insertFoodItemImg = false;

        Map<String, String> fiMap = new HashMap<String, String>();
//        String realPath = session.getServletContext().getRealPath("/");
        String uploadPath = session.getServletContext().getRealPath("/") + "uploadedImg/fooditem/";
        String realPath = "/uploadedImg/fooditem/";
//        int index = realPath.indexOf("/views");
//        realPath = realPath.substring(index);
        log.info("[파일] 업로드 경로 : {}",realPath);

//        File dir = new File(realPath);
//        if (!dir.isDirectory()) {
//            dir.mkdir();
//        } Security가 방해함 ㅠ

        for (MultipartFile mf : files) {
            String oriFileName = mf.getOriginalFilename();
            log.info("[파일] 기존파일명 : {}",oriFileName);
            fiMap.put("i_original_name", oriFileName);
            String sysFileName = System.currentTimeMillis() + "."
                    + oriFileName.substring(oriFileName.lastIndexOf(".")+1);
            log.info("[파일] 시스템파일명 : {}",sysFileName);
            fiMap.put("i_sys_name",sysFileName);
            fiMap.put("i_path", realPath);
            fiMap.put("m_id", role);
            String filesize = "";
            long size = mf.getSize();
            if (size >= 1024) {
                double sizeKB = size / 1024.0;
                filesize = String.format("%.2f KB", sizeKB);
                if (sizeKB >= 1024) {
                    double sizeMB = sizeKB / 1024.0;
                    filesize = String.format("%.2f MB", sizeMB);
                }
            } else {
                filesize = size + " B";
            }
            log.info(filesize);
            fiMap.put("i_filesize", filesize);

            try {
                mf.transferTo(new File(uploadPath + sysFileName));
                insertFoodItemImg = bDao.insertFoodItemImg(fiMap);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            
            
        }
        if (update && insertFoodItemImg) {
            log.info("[모달] 파일&업데이트 성공");
            return true;
        } else {
            log.info("[모달] 서비스 에러");
            return false;
        }
    }
    
    // 식자재 리스트 가져오기. 대분류 중분류에 해당하는 이름으로 바꾸고 ㅇㅇ
    public List<FoodItemDto> getFoodItemList(Integer pageNum, Integer pageSize) {
        List<FoodItemDto> fiList =  bDao.getFoodItemList();
        for (FoodItemDto fi : fiList) {
            fi.setC_num(bDao.getFoodItemListNaming(fi.getC_num()));
            fi.setC_num2(bDao.getFoodItemListNaming2(fi.getC_num2()));
            if (fi.getC_num().length()>6) {
                fi.setC_num(fi.getC_num().substring(0, 6)+"...");
            }
            if (fi.getF_title().length()>5) {
                fi.setF_title(fi.getF_title().substring(0, 5)+"...");
            }
        }
        int totalListCnt = fiList.size();
        int fromIdx = (pageNum - 1)*pageSize;
        int toIdx = Math.min(fromIdx + pageSize, totalListCnt);
        if (fromIdx > totalListCnt) {
            return List.of();
        }
        return fiList.subList(fromIdx, toIdx);
    }

    public Object getRecipeList() {
        return bDao.getRecipeList();
    }
    
    // 식자재 리스트 각각 정렬 ASC, DESC 토글
    boolean flag = true;
    public List<FoodItemDto> getSortedFoodItemList(String id, Integer pageNum, Integer pageSize) {
        log.info("[식자재정렬] 서비스 진입");
        String sort = "";
        if (flag) {
            sort = "desc";
            flag = false;
        } else {
            sort = "asc";
            flag = true;
        }
        log.info("ORDER BY {}",sort);
        String param = "";
        switch (id) {
            case "fcode":
                param = "f_code";
                break;
            case "fcnum":
                param = "c_num";
                break;
            case "fcnum2":
                param = "c_num2";
                break;
            case "fprice":
                param = "f_price";
                break;
            case "fcount":
                param = "f_count";
                break;
            case "ftitle":
                param = "f_title";
                break;
            case "fdate":
                param = "f_date";
                break;
            case "fedate":
                param = "f_edate";
                break;

        }
        List<FoodItemDto> fiList =  bDao.getSortedFoodItemList(param, sort);
        for (FoodItemDto fi : fiList) {
            fi.setC_num(bDao.getFoodItemListNaming(fi.getC_num()));
            fi.setC_num2(bDao.getFoodItemListNaming2(fi.getC_num2()));
        }
        int totalListCnt = fiList.size();
        Integer fromIdx = (pageNum - 1)*pageSize;
        Integer toIdx = Math.min(fromIdx + pageSize, totalListCnt);
        if (fromIdx > totalListCnt) {
            return List.of();
        }
        return fiList.subList(fromIdx, toIdx);
    }

    public Object getSortedRecipeList(String id) {
        log.info("[정렬] 레시피리스트 미구현");
        return null;
    }

    public List<?> getAllCategory(String name, String cg) {
        switch (String.valueOf(cg.charAt(0))) {
                case "1" -> {
                return bDao.getFoodItemBigCg();
                }
                case "2" -> {
                    return bDao.getFoodItemMidCg(cg);
                }
                case "3" -> {
                    return bDao.getFoodItemSmCg(cg);
                }
                case "4" -> {
                    return bDao.getRecipeBigCg();
                }
                case "5" -> {
                    return bDao.getRecipeMidCg(cg);
                }
                case "6" -> {
                    return bDao.getRecipeSmCg(cg);
                }
                default -> {
                    log.info("[삭제] 서비스 에러");
                    return null;
                }
            }
        }

    public List<?> insertAllCg(String cgName, String cgNum) {
        log.info("[추가] 서비스 진입");
            boolean result = bDao.addAllCg(cgName, cgNum);
            log.info(cgName);
            log.info(cgNum);
            if (result) {
                switch (String.valueOf(cgNum.charAt(0))) {
                    case "1":
                        return bDao.getFoodItemMidCg(cgNum);
                    case "2":
                        cgNum = "3";
                        break;
                    case "4":
                        cgNum = "5";
                        break;
                    case "5":
                        cgNum = "6";
                        break;
                }
                if (cgNum.equals("fooditem")) {
                    cgNum = "1";
                } else if (cgNum.equals("recipe")) {
                    cgNum = "2";
                }
                log.info(cgNum);
                return getAllCategory(cgName, cgNum);
            } else {
                return null;
            }

    }

    public List<?> deleteFoodItemList(ArrayList deleteKey, Integer pageNum, Integer pageSize) {
        log.info("[게시글 삭제] 서비스 진입");
        boolean result = bDao.deleteFoodItemList(deleteKey);
        if (result) {
            return getFoodItemList(pageNum, pageSize);
        } else {
            log.info("[게시글 삭제] 에러 발생");
            return null;
        }
    }

    public List<FoodItemDto> getModalFIDetails(String trCode) {
        List<FoodItemDto> details = bDao.getModalFIDetails(trCode);
        for (FoodItemDto fi : details) {
            fi.setF_img(bDao.getFiImg(trCode));
           /* fi.setC_name(bDao.getFIImg(trCode));*/
        }
        return details;
    }

    public List<FoodItemDto> getSearchListFI(Integer pageNum, Integer pageSize, String searchKeyword) {
        log.info("[식자재 검색] 진입");
        log.info("검색어 : {}", searchKeyword);

        List<FoodItemDto> fsearchList = bDao.getFoodItemList();
        for (FoodItemDto fis : fsearchList) {
            fis.setC_num(bDao.getFoodItemListNaming(fis.getC_num()));
            fis.setC_num2(bDao.getFoodItemListNaming2(fis.getC_num2()));
        }

        List<FoodItemDto> filteredList = fsearchList.stream()
                .filter(fis ->
                        fis.getF_title().contains(searchKeyword) ||
                                fis.getC_num().contains(searchKeyword) ||
                                fis.getC_num2().contains(searchKeyword) ||
                                fis.getF_code().contains(searchKeyword) ||
                                fis.getF_price().contains(searchKeyword) ||
                                fis.getF_count().contains(searchKeyword) ||
                                fis.getF_date().contains(searchKeyword) ||
                                fis.getF_edate().contains(searchKeyword) ||
                                fis.getF_contents().contains(searchKeyword))
                .collect(Collectors.toList());

        int totalListCnt = filteredList.size();
        int fromIdx = (pageNum - 1) * pageSize;
        int toIdx = Math.min(fromIdx + pageSize, totalListCnt);

        if (fromIdx >= totalListCnt) {
            return List.of(); // 페이지 범위가 전체 리스트 크기를 초과하는 경우 빈 리스트 반환
        }

        return filteredList.subList(fromIdx, toIdx);
    }

}