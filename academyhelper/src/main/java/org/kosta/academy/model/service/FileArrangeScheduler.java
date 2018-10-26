package org.kosta.academy.model.service;

import java.io.File;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class FileArrangeScheduler{
	
	private String filepath;
	
	@Scheduled(cron="0 0 02 * * *")
	public void run() {
				System.out.println("파일정리 Thread run method 실행");
				filepath = "C:\\java-kosta\\finalproject\\finalproject\\resources\\";
				File fileCheck = new File(filepath + "reviewUpload\\");
				String[] fileList = fileCheck.list();
				for (int i = 0; i < fileList.length; i++) {
					if (fileList[i].contains("!!@@")) {
						new File(filepath + "reviewUpload\\" + fileList[i]).delete();
					}
				}
				fileCheck = new File(filepath + "promotionUpload\\");
				fileList = fileCheck.list();
				for (int i = 0; i < fileList.length; i++) {
					if (fileList[i].contains("!!@@")) {
						new File(filepath + "promotionUpload\\" + fileList[i]).delete();
					}
				}
		
		}
	
}
