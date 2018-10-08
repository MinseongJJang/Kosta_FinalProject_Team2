package org.kosta.academy.model.vo;

public class FAQVO {
	private String faqNo;
	private String faqTitle;
	private String faqContent;
	private String faqRegDate;
	private UserVO userVO;
	public FAQVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FAQVO(String faqNo, String faqTitle, String faqContent, String faqRegDate, UserVO userVO) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqRegDate = faqRegDate;
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
	public String getFaqRegDate() {
		return faqRegDate;
	}
	public void setFaqRegDate(String faqRegDate) {
		this.faqRegDate = faqRegDate;
	}
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	@Override
	public String toString() {
		return "FAQVO [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", faqRegDate="
				+ faqRegDate + ", userVO=" + userVO + "]";
	}
	
	
}
