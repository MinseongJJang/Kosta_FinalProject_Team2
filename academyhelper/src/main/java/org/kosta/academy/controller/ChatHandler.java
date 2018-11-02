package org.kosta.academy.controller;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;

import org.kosta.academy.model.vo.UserVO;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatHandler extends TextWebSocketHandler {
	//client와 연결정보를 가진 WebSocketSession을  저장하는 리스트 
    private List<WebSocketSession> sessionList=new ArrayList<WebSocketSession>();
	private ArrayList<String> ipAddress = new ArrayList<String>();
    // 웹소켓 서버에 클라이언트가 접속하면 호출되는 메소드
    File file = new File("C:\\java-kosta\\chat.txt");
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception { 
    	String br = "";
    	FileReader reader = new FileReader("C:\\java-kosta\\chat.txt");
    	int ch;
    	while((ch=reader.read()) != -1) {
    		br += (char)ch;
    	}
    	FileWriter fw = new FileWriter(file, true);
    	sessionList.add(session);//접속하면 리스트에 추가한다         
    	UsernamePasswordAuthenticationToken token=(UsernamePasswordAuthenticationToken)session.getPrincipal();
    	String userId=((UserVO)token.getPrincipal()).getUsrId();
    	
    	System.out.println("로그인 한 아이디 : " + userId);
    	
    	ipAddress.add(session.getRemoteAddress().getHostName());//client ip
    	System.out.println("아이피 개수 : " + ipAddress.size());
    	fw.write("채팅창 입장 : "+userId+"\r\n");
        System.out.println("채팅창 입장 : "+userId);
      //웹소켓 서버에 접속한 모든 클라이언트에게 입장 메세지 전송
		sessionList.get(sessionList.size()-1).sendMessage(new TextMessage(br+"\n"));

        for(int i=0;i<sessionList.size();i++) {
        	sessionList.get(i).sendMessage(new TextMessage("--------"+userId+" 입장!-------"));
        }    
        reader.close();
        fw.close();
    }
    // 웹소켓 서버측에 텍스트 메시지가 접수되면 호출되는 메소드
    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {    
    	FileWriter fw = new FileWriter(file, true);
    	UsernamePasswordAuthenticationToken token=(UsernamePasswordAuthenticationToken)session.getPrincipal();
    	String userId=((UserVO)token.getPrincipal()).getUsrId();
    	String payloadMessage = (String) message.getPayload();
        //String userId=mvo.getUsrId();//client ip
        System.out.println("서버에 도착한 메시지:"+payloadMessage+"\r\n");
        //웹소켓 서버에 접속한 모든 클라이언트에게 메세지 전송 
        fw.write(userId+":"+payloadMessage+"\r\n");
        for(int i=0;i<sessionList.size();i++) {
        	sessionList.get(i).sendMessage(new TextMessage(userId+":"+payloadMessage));
        }    
        fw.close();
    }
 
    // 클라이언트가 접속을 종료하면 호출되는 메소드
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	FileWriter fw = new FileWriter(file, true);
    	sessionList.remove(session);        
    	UsernamePasswordAuthenticationToken token=(UsernamePasswordAuthenticationToken)session.getPrincipal();
    	String userId=((UserVO)token.getPrincipal()).getUsrId();
        System.out.println(userId+" 클라이언트 접속해제");
        //웹소켓 서버에 접속한 모든 클라이언트에게 입장 메세지 전송 
        fw.write(userId+"나갔습니다. \r\n");
          for(int i=0;i<sessionList.size();i++) {
          	sessionList.get(i).sendMessage(new TextMessage(userId+" 나갔습니다!"));
          } 
          fw.close();
    }
 
    // 메시지 전송시나 접속해제시 오류가 발생할 때 호출되는 메소드
    @Override
    public void handleTransportError(WebSocketSession session,
            Throwable exception) throws Exception {
        super.handleTransportError(session, exception);
        System.out.println("전송오류 발생");
    }
}