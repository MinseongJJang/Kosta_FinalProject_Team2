package org.kosta.academy.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatHandler extends TextWebSocketHandler {
	//client와 연결정보를 가진 WebSocketSession을  저장하는 리스트 
    private List<WebSocketSession> sessionList=new ArrayList<WebSocketSession>();
    // 웹소켓 서버에 클라이언트가 접속하면 호출되는 메소드
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {         
    	System.out.println("핸들러러러러");
    	sessionList.add(session);//접속하면 리스트에 추가한다         
        String userIp=session.getRemoteAddress().getHostName();//client ip
        System.out.println(userIp+" 클라이언트 접속됨. 리스트에 추가");
      //웹소켓 서버에 접속한 모든 클라이언트에게 입장 메세지 전송 
        for(int i=0;i<sessionList.size();i++) {
        	sessionList.get(i).sendMessage(new TextMessage(userIp+" 입장!"));
        }    
    }
    // 웹소켓 서버측에 텍스트 메시지가 접수되면 호출되는 메소드
    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {    	
        String payloadMessage = (String) message.getPayload();
        String userIp=session.getRemoteAddress().getHostName();//client ip
        System.out.println("서버에 도착한 메시지:"+payloadMessage);
        //웹소켓 서버에 접속한 모든 클라이언트에게 메세지 전송 
        for(int i=0;i<sessionList.size();i++) {
        	sessionList.get(i).sendMessage(new TextMessage(userIp+":"+payloadMessage));
        }        
    }
 
    // 클라이언트가 접속을 종료하면 호출되는 메소드
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	sessionList.remove(session);        
        String userIp=session.getRemoteAddress().getHostName();//client ip
        System.out.println(userIp+" 클라이언트 접속해제");
        //웹소켓 서버에 접속한 모든 클라이언트에게 입장 메세지 전송 
          for(int i=0;i<sessionList.size();i++) {
          	sessionList.get(i).sendMessage(new TextMessage(userIp+" 나갔습니다!"));
          }    
    }
 
    // 메시지 전송시나 접속해제시 오류가 발생할 때 호출되는 메소드
    @Override
    public void handleTransportError(WebSocketSession session,
            Throwable exception) throws Exception {
        super.handleTransportError(session, exception);
        System.out.println("전송오류 발생");
    }
}