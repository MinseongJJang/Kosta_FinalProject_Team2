package org.kosta.academy.model.vo;

public class CurriculumAttachFileVO {
	private String curriculumAttNo;
	private String curriculumFilepath;
	private CurriculumVO curriculumVO;
	
	
	public String getCurriculumAttNo() {
		return curriculumAttNo;
	}
	public void setCurriculumAttNo(String curriculumAttNo) {
		this.curriculumAttNo = curriculumAttNo;
	}
	public String getCurriculumFilepath() {
		return curriculumFilepath;
	}
	public void setCurriculumFilepath(String curriculumFilepath) {
		this.curriculumFilepath = curriculumFilepath;
	}
	public CurriculumVO getCurriculumVO() {
		return curriculumVO;
	}
	public void setCurriculumVO(CurriculumVO curriculumVO) {
		this.curriculumVO = curriculumVO;
	}
	public CurriculumAttachFileVO(String curriculumAttNo, String curriculumFilepath, CurriculumVO curriculumVO) {
		super();
		this.curriculumAttNo = curriculumAttNo;
		this.curriculumFilepath = curriculumFilepath;
		this.curriculumVO = curriculumVO;
	}
	public CurriculumAttachFileVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "CurriculumAttachFileVO [curriculumAttNo=" + curriculumAttNo + ", curriculumFilepath="
				+ curriculumFilepath + ", curriculumVO=" + curriculumVO + "]";
	}
	
	
}
