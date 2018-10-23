package org.kosta.academy.model.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadVO {
	private List<MultipartFile> file;

	public FileUploadVO() {
		super();
	}

	public FileUploadVO(List<MultipartFile> file) {
		super();
		this.file = file;
	}

	public List<MultipartFile> getFile() {
		return file;
	}

	public void setFile(List<MultipartFile> file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "FileUploadVO [file=" + file + "]";
	}

}
