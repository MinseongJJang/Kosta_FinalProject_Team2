package org.kosta.academy.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
/*
 * ajax로 파일선택 시에 서버에는 파일이 업로드 되도록
 * 설정한다.
 * ex) 파일을 선택했지만 글은 등록하지 않았을 경우 파일은 
 * 		서버에 업로드 된다.
 * --> 이것의 해결방안은 서버 시작시에 ServletContextListener등을 이용해
 * 업로드 폴더 정리용 Thread를 생성해 시간 주기를 주어 해당 폴더에 모든
 * 이미지를 삭제하도록 함.
 */
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
@Controller
public class FileUploadController {
	private String uploadPath;
	
	@ResponseBody
	@RequestMapping("file-upload.do")
	public ArrayList<String> fileUpload(List<MultipartFile> fileList, HttpServletRequest request) {
		//wepapps/resources/upload 에 업로드된다.
		uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload");
		File uploadDir = new File(uploadPath);
		ArrayList<String> fileNameList = new ArrayList<String>();
		//해당 upload 폴더가 존재하지 않는다면 생성
		if(uploadDir.exists() == false) {
			uploadDir.mkdirs();
		}
		for(int i=0;i<fileList.size();i++) {
			//서버에 저장시킬 filename
			String fileName = fileList.get(i).getOriginalFilename();
			if(fileName.equals("")) {
				//업로드 파일이 존재한다면 서버에 업로드
				try {
					//서버에 업로드
					fileList.get(i).transferTo(new File(uploadPath+fileName));
				   /*
					* 서버에 업로드 된 파일명을 json으로 보내준다.
					* 이 후 register 메소드가 실행될 때 해당 경로+fileNameList를
					* AttachFile 테이블에 저장 후 uploadPath에서 해당경로로 이동
					* ex) 홍보게시판의 경우 파일선택시에 uploadPath에 파일이 생성되지만
					* register 메소드가 실행시에 uploadPath에서 promotionUpload로 이동
					* (file의 renameTo이용)
					*/
					fileNameList.add(uploadPath+fileName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return fileNameList;
	}
}
