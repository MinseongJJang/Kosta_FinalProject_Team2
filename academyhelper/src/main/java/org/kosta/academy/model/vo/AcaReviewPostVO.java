package org.kosta.academy.model.vo;

public class AcaReviewPostVO {
	private String acaRevNo;
	private String acaRevTitle;
	private String acaRevContent;
	private String acaRevRegdate;
	private int acaRevHits;
	private CurriculumVO curriculumVO;
	private UserVO userVO;

	public AcaReviewPostVO() {
		super();
	}

	public AcaReviewPostVO(String acaRevTitle, String acaRevContent, String acaRevRegdate, int acaRevHits,
			CurriculumVO curriculumVO, UserVO userVO) {
		super();
		this.acaRevTitle = acaRevTitle;
		this.acaRevContent = acaRevContent;
		this.acaRevRegdate = acaRevRegdate;
		this.acaRevHits = acaRevHits;
		this.curriculumVO = curriculumVO;
		this.userVO = userVO;
	}

	public String getAcaRevNo() {
		return acaRevNo;
	}

	public void setAcaRevNo(String acaRevNo) {
		this.acaRevNo = acaRevNo;
	}

	public String getAcaRevTitle() {
		return acaRevTitle;
	}

	public void setAcaRevTitle(String acaRevTitle) {
		this.acaRevTitle = acaRevTitle;
	}

	public String getAcaRevContent() {
		return acaRevContent;
	}

	public void setAcaRevContent(String acaRevContent) {
		this.acaRevContent = acaRevContent;
	}

	public String getAcaRevRegdate() {
		return acaRevRegdate;
	}

	public void setAcaRevRegdate(String acaRevRegdate) {
		this.acaRevRegdate = acaRevRegdate;
	}

	public int getAcaRevHits() {
		return acaRevHits;
	}

	public void setAcaRevHits(int acaRevHits) {
		this.acaRevHits = acaRevHits;
	}

	public CurriculumVO getCurriculumVO() {
		return curriculumVO;
	}

	public void setCurriculumVO(CurriculumVO curriculumVO) {
		this.curriculumVO = curriculumVO;
	}

	public UserVO getUserVO() {
		return userVO;
	}

	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}

	@Override
	public String toString() {
		return "AcaReviewPost [acaRevNo=" + acaRevNo + ", acaRevTitle=" + acaRevTitle + ", acaRevContent=" + acaRevContent
				+ ", acaRevRegdate=" + acaRevRegdate + ", acaRevHits=" + acaRevHits + ", curriculumVO=" + curriculumVO
				+ ", userVO=" + userVO + "]";
	}

}
