package org.kosta.academy.model.vo;

public class CurriculumVO {
	private String curNo;
	private String curName;
	private String curLecturer;
	private String limitMem;
	private String curContent;
	private String curTextbook;

	public CurriculumVO() {
		super();
	}

	public CurriculumVO(String curNo, String curName, String curLecturer, String limitMem, String curContent,
			String curTextbook) {
		super();
		this.curNo = curNo;
		this.curName = curName;
		this.curLecturer = curLecturer;
		this.limitMem = limitMem;
		this.curContent = curContent;
		this.curTextbook = curTextbook;
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

	@Override
	public String toString() {
		return "CurriculumVO [curNo=" + curNo + ", curName=" + curName + ", curLecturer=" + curLecturer + ", limitMem="
				+ limitMem + ", curContent=" + curContent + ", curTextbook=" + curTextbook + "]";
	}

	

}
