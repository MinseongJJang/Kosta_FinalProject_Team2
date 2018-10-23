package org.kosta.academy.model.service;

import java.io.File;
import java.util.Timer;
import java.util.TimerTask;

public class FileTheoremWorker{
	
	private String filepath;
	public void runTimer() {
		Timer timer = new Timer();
		timer.schedule(timerTask, 60*60*24*1000);//24시간에 한번만 실행
	}
	TimerTask timerTask = new TimerTask() {
		@Override
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
	};
	
}
