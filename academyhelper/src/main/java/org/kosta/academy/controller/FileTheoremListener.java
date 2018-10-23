package org.kosta.academy.controller;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.kosta.academy.model.service.FileTheoremWorker;
public class FileTheoremListener implements ServletContextListener {
    public FileTheoremListener() {
    }
    public void contextDestroyed(ServletContextEvent arg0)  { 
    }
    /*
     * 웹 어플리케이션 동작시에 FileTheoremWorker 객체를 생성시키고
     * runTimer 메소드를 동작시켜 timer와 timertask로 업로드되지 않은
     * 파일을 정리
     */
    public void contextInitialized(ServletContextEvent arg0)  { 
         FileTheoremWorker worker = new FileTheoremWorker();
         worker.runTimer();
    }
	
}
