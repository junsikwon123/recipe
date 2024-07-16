package com.icia.recipe.management.service;

import com.icia.recipe.management.dao.BoardDao;
import com.icia.recipe.management.dto.BoardDto;
import com.icia.recipe.management.dto.FoodItemDto;
import com.icia.recipe.management.dto.RecipeDto;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class BoardService {

    @Autowired
    private BoardDao bDao;

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
        String realPath = session.getServletContext().getRealPath("/");
        realPath += "WEB-INF/views/uploadedImg/fooditem";
        log.info("[파일] 업로드 경로 : {}",realPath);

        File dir = new File(realPath);
        if (!dir.isDirectory()) {
            dir.mkdir();
        }

        for (MultipartFile mf : files) {
            String oriFileName = mf.getOriginalFilename();
            log.info("[파일] 기존파일명 : {}",oriFileName);
            fiMap.put("i_original_name", oriFileName);
            String sysFileName = System.currentTimeMillis() + "."
                    + oriFileName.substring(oriFileName.lastIndexOf(".")+1);
            log.info("[파일] 시스템파일명 : {}",sysFileName);
            fiMap.put("i_sys_name",sysFileName);
            fiMap.put("i_path", realPath);
            fiMap.put("fiCode", fiCode);
            fiMap.put("m_id", role);
            String filesize = "";
            if (mf.getSize() >= 1024) {
                filesize = String.valueOf(mf.getSize()/1024);
                filesize += "KB";
                if (mf.getSize()/1024 >= 1024) {
                    filesize = String.valueOf((mf.getSize()/1024)/1024);
                    filesize += "MB";
                }
            }
            fiMap.put("i_filesize", filesize);

            try {
                mf.transferTo(new File(realPath + sysFileName));
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

    public List<FoodItemDto> getFoodItemList() {
        List<FoodItemDto> fiList =  bDao.getFoodItemList();
        for (FoodItemDto fi : fiList) {
            fi.setC_num(bDao.getFoodItemListNaming(fi.getC_num()));
            fi.setC_num2(bDao.getFoodItemListNaming2(fi.getC_num2()));
        }
        return fiList;
    }

    public Object getRecipeList() {
        return bDao.getRecipeList();
    }

    public List<FoodItemDto> getSortedFoodItemList(String id) {
        log.info("[식자재정렬] 서비스 진입");
        String sort = "desc";
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
        return bDao.getSortedFoodItemList(param, sort);
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

    public List<?> deleteFoodItemList(ArrayList deleteKey) {
        log.info("[게시글 삭제] 서비스 진입");
        boolean result = bDao.deleteFoodItemList(deleteKey);
        if (result) {
            return bDao.getFoodItemList();
        } else {
            log.info("[게시글 삭제] 에러 발생");
            return null;
        }
    }
}