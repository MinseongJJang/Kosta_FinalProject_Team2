package org.kosta.academy.model.vo;

public class contentVO {
	private CurriculumVO curriculumVO;
	private String search;
	public contentVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CurriculumVO getCurriculumVO() {
		return curriculumVO;
	}
	public void setCurriculumVO(CurriculumVO curriculumVO) {
		this.curriculumVO = curriculumVO;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	@Override
	public String toString() {
		return "contentVO [curriculumVO=" + curriculumVO + ", search=" + search + "]";
	}
	
} 