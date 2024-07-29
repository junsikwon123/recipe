package com.icia.recipe.home.controller;

import io.micrometer.common.util.StringUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
@Slf4j
@RequiredArgsConstructor
public class EchoHandler extends TextWebSocketHandler {
    private List<WebSocketSession> sessions = new ArrayList<>();
    private Map<String,WebSocketSession> userSessionMap = new HashMap<>();
    private Map<String,List<String>> notificationBuffer=new HashMap<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        log.info("Socket 연결 성공");
        log.info("session{}",session);
        sessions.add(session);
        log.info("sessions{}", sessions);
        log.info(sendPushUsername(session)); //현재 접속한 사람의 username이 출력됨
        String senderId = sendPushUsername(session);
        userSessionMap.put(senderId, session);
        log.info("userSessionMap {}", userSessionMap);

        if(notificationBuffer.containsKey(senderId)){
            List<String> bufferedMessages = notificationBuffer.get(senderId);
            for(String msg:bufferedMessages){
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
            if (strs != null && strs.length == 4) {
                String tradeSend = strs[0]; //교환신청건 유저
                String sendedPushUser= strs[1]; //푸시 알림 받을 유저
                String t_num=strs[2]; //게시글 번호
                String title=strs[3]; //게시글 제목
                log.info(">>>>>>>>>>"+tradeSend);
                log.info(">>>>>>>>>>"+sendedPushUser);
                WebSocketSession sendedPushSession = userSessionMap.get(sendedPushUser); //로그인 상태일때 알람 보냄
                log.info("sendedPushSession = {}", sendedPushSession);
//                    TextMessage textMsg = new TextMessage(tradeSend + "님이" + t_num + "번글" + title + "에 교환신청을 하셨습니다");
//                    sendedPushSession.sendMessage(textMsg);
                String notification=tradeSend+"님이"+t_num+"번 글"+"에 교환신청을 하였습니다.";
                if(sendedPushSession!=null){
                    sendedPushSession.sendMessage(new TextMessage(notification));
                }else{
                    notificationBuffer.computeIfAbsent(sendedPushUser, k -> new ArrayList<>()).add(notification);
                }
            }
        }
    }
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        log.info("Socket 연결 해제");
        sessions.remove(session);
        String userId=sendPushUsername(session);
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
