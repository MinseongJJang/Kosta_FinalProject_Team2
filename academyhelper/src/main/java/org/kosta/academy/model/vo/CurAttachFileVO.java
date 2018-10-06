package org.kosta.academy.model.vo;

public class CurAttachFileVO {
	private String curAttachNo;
	private String curFilepath;
	private CurriculumVO curriculumVO;

	public CurAttachFileVO() {
		super();
	}

	public CurAttachFileVO(String curFilepath, CurriculumVO curriculumVO) {
		super();
		this.curFilepath = curFilepath;
		this.curriculumVO = curriculumVO;
	}

	public String getCurAttachNo() {
		return curAttachNo;
	}

	public void setCurAttachNo(String curAttachNo) {
		this.curAttachNo = curAttachNo;
	}

	public String getCurFilepath() {
		return curFilepath;
	}

	public void setCurFilepath(String curFilepath) {
		this.curFilepath = curFilepath;
	}

	public CurriculumVO getCurriculumVO() {
		return curriculumVO;
	}

	public void setCurriculumVO(CurriculumVO curriculumVO) {
		this.curriculumVO = curriculumVO;
	}

	@Override
	public String toString() {
		return "CurAttachFileVO [curAttachNo=" + curAttachNo + ", curFilepath=" + curFilepath + ", curriculumVO="
				+ curriculumVO + "]";
	}

}
