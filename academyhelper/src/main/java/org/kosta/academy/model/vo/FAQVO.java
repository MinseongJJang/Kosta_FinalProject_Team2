package org.kosta.academy.model.vo;

public class FAQVO {
	private String faqNo;
	private String faqTitle;
	private String faqContent;
	private String faqRegdate;
	private UserVO userVO;
	public FAQVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FAQVO(String faqNo, String faqTitle, String faqContent, String faqRegdate, UserVO userVO) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqRegdate = faqRegdate;
		this.userVO = userVO;
	}
	public String getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(String faqNo) {
		this.faqNo = faqNo;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqContent() {
		return faqContent;
	}
	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}
	public String getFaqRegdate() {
		return faqRegdate;
	}
	public void setFaqRegdate(String faqRegdate) {
		this.faqRegdate = faqRegdate;
	}
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	@Override
	public String toString() {
		return "FAQVO [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", faqRegdate="
				+ faqRegdate + ", userVO=" + userVO + "]";
	}
	
}
