package org.kosta.academy.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.kosta.academy.model.vo.FileUploadVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
@Controller
public class FileUploadController {
	private String uploadPath;
	@ResponseBody
	@RequestMapping("review-file-upload.do")
	public ArrayList<Object> fileUpload(FileUploadVO fileVO , HttpServletRequest request){
		uploadPath = request.getSession().getServletContext().getRealPath("/resources/reviewUpload/");
		//uploadPath = System.getProperty("user.home")+"\\git\\Kosta_FinalProject_Team2\\academyhelper\\src\\main\\resources\\reviewUpload\\";
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		List<MultipartFile> fileList = fileVO.getFile();
		ArrayList<Object> fileNameList= new ArrayList<Object>();
		for(int i=0;i<fileList.size();i++) {
			long curTime = System.currentTimeMillis();
			String fileName = fileList.get(i).getOriginalFilename().substring(0, fileList.get(i).getOriginalFilename().length()-4)+curTime+"1"+fileList.get(i).getOriginalFilename().substring(fileList.get(i).getOriginalFilename().length()-4, fileList.get(i).getOriginalFilename().length());
			if(!fileName.equals("")) {
				try {
					//파일네임뒤에 1이 붙으면 아직 attach 테이블에 저장되지 않은 파일
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
