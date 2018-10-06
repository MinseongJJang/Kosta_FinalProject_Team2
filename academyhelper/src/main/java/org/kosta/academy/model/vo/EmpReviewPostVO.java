package org.kosta.academy.model.vo;

public class EmpReviewPostVO {
	private String empRevNo;
	private String empRevTitle;
	private int empRevHits;
	private String empRevContent;
	private String empRevRegdate;
	private UserVO userVO;
	private CurriculumVO curriculumVO;

	public EmpReviewPostVO() {
		super();
	}

	public EmpReviewPostVO(String empRevTitle, int empRevHits, String empRevContent, String empRevRegdate,
			UserVO userVO, CurriculumVO curriculumVO) {
		super();
		this.empRevTitle = empRevTitle;
		this.empRevHits = empRevHits;
		this.empRevContent = empRevContent;
		this.empRevRegdate = empRevRegdate;
		this.userVO = userVO;
		this.curriculumVO = curriculumVO;
	}

	public String getEmpRevNo() {
		return empRevNo;
	}

	public void setEmpRevNo(String empRevNo) {
		this.empRevNo = empRevNo;
	}

	public String getEmpRevTitle() {
		return empRevTitle;
	}

	public void setEmpRevTitle(String empRevTitle) {
		this.empRevTitle = empRevTitle;
	}

	public int getEmpRevHits() {
		return empRevHits;
	}

	public void setEmpRevHits(int empRevHits) {
		this.empRevHits = empRevHits;
	}

	public String getEmpRevContent() {
		return empRevContent;
	}

	public void setEmpRevContent(String empRevContent) {
		this.empRevContent = empRevContent;
	}

	public String getEmpRevRegdate() {
		return empRevRegdate;
	}

	public void setEmpRevRegdate(String empRevRegdate) {
		this.empRevRegdate = empRevRegdate;
	}

	public UserVO getUserVO() {
		return userVO;
	}

	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}

	public CurriculumVO getCurriculumVO() {
		return curriculumVO;
	}

	public void setCurriculumVO(CurriculumVO curriculumVO) {
		this.curriculumVO = curriculumVO;
	}

	@Override
	public String toString() {
		return "EmpReviewPostVO [empRevNo=" + empRevNo + ", empRevTitle=" + empRevTitle + ", empRevHits=" + empRevHits
				+ ", empRevContent=" + empRevContent + ", empRevRegdate=" + empRevRegdate + ", userVO=" + userVO
				+ ", curriculumVO=" + curriculumVO + "]";
	}

}
