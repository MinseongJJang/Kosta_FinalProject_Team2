package org.kosta.academy.model.vo;

public class AcaQNAVO {
	private String qnaNo;
	private String qnaTitle;
	private String qnaContent;
	private String qnaRegdate;
	private AcademyVO academyVO;
	private UserVO userVO;
	public AcaQNAVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AcaQNAVO(String qnaNo, String qnaTitle, String qnaContent, String qnaRegdate, AcademyVO academyVO,
			UserVO userVO) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaRegdate = qnaRegdate;
		this.academyVO = academyVO;
		this.userVO = userVO;
	}
	public String getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(String qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getQnaRegdate() {
		return qnaRegdate;
	}
	public void setQnaRegdate(String qnaRegdate) {
		this.qnaRegdate = qnaRegdate;
	}
	public AcademyVO getAcademyVO() {
		return academyVO;
	}
	public void setAcademyVO(AcademyVO academyVO) {
		this.academyVO = academyVO;
	}
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	@Override
	public String toString() {
		return "AcaQNAVO [qnaNo=" + qnaNo + ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent + ", qnaRegdate="
				+ qnaRegdate + ", academyVO=" + academyVO + ", userVO=" + userVO + "]";
	}
	
	
}
