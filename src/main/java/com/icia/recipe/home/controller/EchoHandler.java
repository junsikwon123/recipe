package com.icia.recipe.home.controller;

import com.icia.recipe.home.dto.TradeDto;
import com.icia.recipe.home.service.TradeService;
import io.micrometer.common.util.StringUtils;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Component
@Slf4j
@RequiredArgsConstructor
public class EchoHandler extends TextWebSocketHandler {
    @Autowired
    TradeService tSer;



    private List<WebSocketSession> sessions = new ArrayList<>();
    private Map<String, WebSocketSession> userSessionMap = new HashMap<>();
    private Map<String, List<String>> notificationBuffer = new HashMap<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        log.info("Socket 연결 성공");
        log.info("session{}", session);
        sessions.add(session);
        log.info("sessions{}", sessions);
        log.info(">>>>" + sendPushUsername(session)); //현재 접속한 사람의 username이 출력됨
        String senderId = sendPushUsername(session);
        userSessionMap.put(senderId, session);
        log.info("userSessionMap {}", userSessionMap);

        if (notificationBuffer.containsKey(senderId)) {
            List<String> bufferedMessages = notificationBuffer.get(senderId);
            for (String msg : bufferedMessages) {
                session.sendMessage(new TextMessage(msg));
            }
            notificationBuffer.remove(senderId);
        }
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        log.info("session = " + sendPushUsername(session));
        String msg = message.getPayload(); //js에서 넘어온 메세지
        log.info("msg = " + msg);
        if (!StringUtils.isEmpty(msg)) {
            String[] strs = msg.split(",");
            if (strs.length == 8) {
                String tradeSend = strs[0]; //교환신청건 유저
                String sendedPushUser = strs[1]; //푸시 알림 받을 유저
                String t_num = strs[2]; //게시글 번호
                String title = strs[3];
                String item = strs[4]; //내가 올린 아이템
                String itemcount = strs[5]; //내가 올린 아이템 갯수
                String unit = strs[6]; //내가 올린 아이템 단위
                String change = strs[7]; //교환하고싶은 아이템
                log.info(">>>>>>>>>>" + tradeSend);
                log.info(">>>>>>>>>>" + sendedPushUser);
                TradeDto tDto = new TradeDto();
                tDto.setTradesend(tradeSend);
                tDto.setT_num(Integer.parseInt(t_num));
                tDto.setT_item(item);
                tDto.setT_itemcount(Integer.parseInt(itemcount));
                tDto.setT_unit(unit);
                tDto.setT_change(change);
                tDto.setM_id(sendedPushUser);
                boolean alertResult=tSer.alertSave(tDto);
                    WebSocketSession sendedPushSession = userSessionMap.get(sendedPushUser);//로그인 상태일때 알람 보냄
                    log.info("<<<<<<<<<sendedPushSession = {}", sendedPushSession);
                    LocalDateTime now = LocalDateTime.now();
                    // 초를 2자리로 포맷하기 위한 DateTimeFormatter 생성
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    // 포맷팅된 문자열 생성
                    String formattedDate = now.format(formatter);
                    // 초를 2자리로 잘라내기 (소수점 이하를 제외)
                    String result = formattedDate.substring(0, 19); // "yyyy-MM-dd HH:mm:ss" 형식의 첫 19글자까지 추출
                    String notification =
                            "<div class='me-3' id='notification-"+t_num+"-"+tradeSend+"'>" +
                            "<i class='fas fa-file-alt text-white'></i>" +
                            "</div>" +
                            "</div>" +
                            "<div id='socketAlertDiv'>" +
                            "<span id='current-time' class='small text-gray-500'>"
                            + result +
                            "</span>&nbsp;" +
                            "<button id='accept' onclick='accept(" + t_num + ", \"" + item + "\", " + itemcount + ")'>수락</button>&nbsp;" +
                            "<button id='refuse' onclick='refuse(" + t_num + ", \"" + tradeSend + "\", \""+sendedPushUser+"\")'>거절</button>" +
                            "<a class='dropdown-item d-flex align-items-center' href='#'>" +
                            "<div id='socketAlert' class='alert alert-warning' role='alert'>" +
                            tradeSend + "님이" + t_num + "번 글에 " + item + " " + itemcount + unit + "과(와)" + change + "를 교환신청을 하였습니다." +
                            "</div>" +
                            "</a>" +
                            "</div>" ;
                    if (sendedPushSession != null) {
                        sendedPushSession.sendMessage(new TextMessage(notification));
                    } else {
                        notificationBuffer.computeIfAbsent(sendedPushUser, k -> new ArrayList<>()).add(notification);
                    }
            }
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        log.info("Socket 연결 해제");
        sessions.remove(session);
        String userId = sendPushUsername(session);
        userSessionMap.remove(userId, session);
    }

    //알람을 보내는 유저
    private String sendPushUsername(WebSocketSession session) {
        String loginUsername;

        if (session.getPrincipal() == null) {
            loginUsername = null;
        } else {
            loginUsername = session.getPrincipal().getName();
        }
        return loginUsername;
    }
}
