package org.kosta.academy.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class CurriculumVO {
	private String curNo;
	private String curName;
	private String curLecturer;
	private String limitMem;
	private String curContent;
	private String curTextbook;
	private String curMainPic;
	private AcademyVO academyVO;
	
	public CurriculumVO() {
		super();
	}

	public CurriculumVO(String curNo, String curName, String curLecturer, String limitMem, String curContent,
			String curTextbook, AcademyVO academyVO) {
		super();
		this.curNo = curNo;
		this.curName = curName;
		this.curLecturer = curLecturer;
		this.limitMem = limitMem;
		this.curContent = curContent;
		this.curTextbook = curTextbook;
		this.academyVO = academyVO;
	}

	public String getCurNo() {
		return curNo;
	}

	public void setCurNo(String curNo) {
		this.curNo = curNo;
	}

	public String getCurName() {
		return curName;
	}

	public void setCurName(String curName) {
		this.curName = curName;
	}

	public String getCurLecturer() {
		return curLecturer;
	}

	public void setCurLecturer(String curLecturer) {
		this.curLecturer = curLecturer;
	}

	public String getLimitMem() {
		return limitMem;
	}

	public void setLimitMem(String limitMem) {
		this.limitMem = limitMem;
	}

	public String getCurContent() {
		return curContent;
	}

	public void setCurContent(String curContent) {
		this.curContent = curContent;
	}

	public String getCurTextbook() {
		return curTextbook;
	}

	public void setCurTextbook(String curTextbook) {
		this.curTextbook = curTextbook;
	}

	public AcademyVO getAcademyVO() {
		return academyVO;
	}

	public void setAcademyVO(AcademyVO academyVO) {
		this.academyVO = academyVO;
	}

	public String getCurMainPic() {
		return curMainPic;
	}

	public void setCurMainPic(String curMainPic) {
		this.curMainPic = curMainPic;
	}

	@Override
	public String toString() {
		return "CurriculumVO [curNo=" + curNo + ", curName=" + curName + ", curLecturer=" + curLecturer + ", limitMem="
				+ limitMem + ", curContent=" + curContent + ", curTextbook=" + curTextbook + ", curMainPic="
				+ curMainPic + ", academyVO=" + academyVO + "]";
	}


}
