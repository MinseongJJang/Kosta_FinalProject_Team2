package org.kosta.academy.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.kosta.academy.model.vo.FileUploadVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
@Controller
public class FileUploadController {
	/*
	 * 파일업로드를 할 때 주의사항
	 * WYSIWYG 에디터는 SUMMERNOTE를 사용 view page 상단에 필요한 자원을 import
	 * textarea를 selector로 받아와 $('#acaPromoContent').summernote 명시 view page 참조
	 * 파일은 ajax처리하여 파일선택하면 지정된 경로로 업데이트된다.
	 * 만약 사용자가 글을 작성하다가 취소할 수 있기 때문에 그것을 캐치할 수 있도록 !!@@라는 문자를 파일명에 덧붙였다.
	 * 정상적으로 DB에 저장되었을 경우에 해당 디렉토리의 파일명에서 !!@@를 제거한다.
	 * 정상적으로 처리되지 않은 !!@@붙은 파일들은 Thread를 동작시켜 매시간 또는 몇시간에 한번씩 정리시킬 것.
	 * 
	 * 서버에 저장된 파일이 서버가 리로딩되어도 없어지지 않게 하기 위해서는 이클립스 좌측 Project Explorer에 Servers에 
	 * server.xml을 다음과 같이 수정한다.
	 * <Context docBase="C:/java-kosta/finalproject/finalproject/resources/reviewUpload/" path="/academy/resources/reviewUpload" reloadable="true"/>
	 * 여기에서 명시된 디렉토리는 해당경로에 반드시 존재해야 함.
	 * 새로운 디렉토리에 업로드가 필요하다면 Context를 추가한다.
	 * 
	 * 또 Main 이미지가 필요한 게시판은 ( ex. acadey ) 와 같은 경우에는 filepath에 저장된 첫번째 filepath가 Main 이미지가 되도록 한다.
	 * 예를 들어 KOSTA라는 Academy table이 있고 AcademyAttachFile table이 있을 때 KOSTA의 학원NO는 5번이라고 가정하면
	 * 5번에 3번 이미지 , 4번 이미지 , 5번 이미지가 저장되어 있다고 가정한다.
	 * 그렇다면 3번 이미지가 KOSTA라는 Academy의 Main이미지가 되도록 한다.
	 * 그리고 첫번째 이미지는 ajax처리로 파일업로드시에 textarea에 나타나지 않도록 설정한다.
	 */
	private String uploadPath;
	@ResponseBody
	@PostMapping("review-file-upload.do")
	public ArrayList<Object> reviewFileUpload(FileUploadVO fileVO , HttpServletRequest request){
		uploadPath ="C:\\java-kosta\\finalproject\\finalproject\\resources\\reviewUpload\\";
		//uploadPath = request.getSession().getServletContext().getRealPath("/resources/reviewUpload/");
		//uploadPath = System.getProperty("user.home")+"\\git\\Kosta_FinalProject_Team2\\academyhelper\\src\\main\\resources\\reviewUpload\\";
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		List<MultipartFile> fileList = fileVO.getFile();
		ArrayList<Object> fileNameList= new ArrayList<Object>();
		for(int i=0;i<fileList.size();i++) {
			long curTime = System.currentTimeMillis();
			String fileName = fileList.get(i).getOriginalFilename().substring(0, fileList.get(i).getOriginalFilename().length()-4)+curTime+"!!@@"+fileList.get(i).getOriginalFilename().substring(fileList.get(i).getOriginalFilename().length()-4, fileList.get(i).getOriginalFilename().length());
			if(!fileName.equals("")) {
				try {
					//파일네임뒤에 !!@@이 붙으면 아직 attach 테이블에 저장되지 않은 파일
					fileList.get(i).transferTo(new File(uploadPath+fileName));
					fileNameList.add(fileName);
					fileNameList.add(curTime);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return fileNameList;
	}
	@ResponseBody
	@PostMapping("promotion-file-upload.do")
	public ArrayList<Object> promotionFileUpload(FileUploadVO fileVO , HttpServletRequest request) {
		uploadPath ="C:\\java-kosta\\finalproject\\finalproject\\resources\\promotionUpload\\";
		//uploadPath = System.getProperty("user.home")+"\\git\\Kosta_FinalProject_Team2\\academyhelper\\src\\main\\resources\\reviewUpload\\";
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		List<MultipartFile> fileList = fileVO.getFile();
		ArrayList<Object> fileNameList= new ArrayList<Object>();
		for(int i=0;i<fileList.size();i++) {
			long curTime = System.currentTimeMillis();
			String fileName = fileList.get(i).getOriginalFilename().substring(0, fileList.get(i).getOriginalFilename().length()-4)+curTime+"!!@@"+fileList.get(i).getOriginalFilename().substring(fileList.get(i).getOriginalFilename().length()-4, fileList.get(i).getOriginalFilename().length());
			if(!fileName.equals("")) {
				try {
					//파일네임뒤에 !!@@이 붙으면 아직 attach 테이블에 저장되지 않은 파일
					fileList.get(i).transferTo(new File(uploadPath+fileName));
					fileNameList.add(fileName);
					fileNameList.add(curTime);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return fileNameList;
	}
	@ResponseBody
	@PostMapping("suggestion-file-upload.do")
	public ArrayList<Object> suggestionFileUpload(FileUploadVO fileVO , HttpServletRequest request) {
		uploadPath ="C:\\java-kosta\\finalproject\\finalproject\\resources\\suggestionUpload\\";
		//uploadPath = System.getProperty("user.home")+"\\git\\Kosta_FinalProject_Team2\\academyhelper\\src\\main\\resources\\reviewUpload\\";
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		List<MultipartFile> fileList = fileVO.getFile();
		ArrayList<Object> fileNameList= new ArrayList<Object>();
		for(int i=0;i<fileList.size();i++) {
			long curTime = System.currentTimeMillis();
			String fileName = fileList.get(i).getOriginalFilename().substring(0, fileList.get(i).getOriginalFilename().length()-4)+curTime+"!!@@"+fileList.get(i).getOriginalFilename().substring(fileList.get(i).getOriginalFilename().length()-4, fileList.get(i).getOriginalFilename().length());
			if(!fileName.equals("")) {
				try {
					//파일네임뒤에 !!@@이 붙으면 아직 attach 테이블에 저장되지 않은 파일
					fileList.get(i).transferTo(new File(uploadPath+fileName));
					fileNameList.add(fileName);
					fileNameList.add(curTime);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return fileNameList;
	}
	
}
