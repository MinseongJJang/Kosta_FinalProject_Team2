package org.kosta.academy.model.vo;

public class SuggestionPostVO {
	private String sugNo;
	private String sugTitle;
	private String sugContent;
	private String sugRegdate;
	private UserVO userVO;

	public SuggestionPostVO() {
		super();
	}

	public SuggestionPostVO(String sugTitle, String sugContent, String sugRegdate, UserVO userVO) {
		super();
		this.sugTitle = sugTitle;
		this.sugContent = sugContent;
		this.sugRegdate = sugRegdate;
		this.userVO = userVO;
	}

	public String getSugNo() {
		return sugNo;
	}

	public void setSugNo(String sugNo) {
		this.sugNo = sugNo;
	}

	public String getSugTitle() {
		return sugTitle;
	}

	public void setSugTitle(String sugTitle) {
		this.sugTitle = sugTitle;
	}

	public String getSugContent() {
		return sugContent;
	}

	public void setSugContent(String sugContent) {
		this.sugContent = sugContent;
	}

	public String getSugRegdate() {
		return sugRegdate;
	}

	public void setSugRegdate(String sugRegdate) {
		this.sugRegdate = sugRegdate;
	}

	public UserVO getUserVO() {
		return userVO;
	}

	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}

	@Override
	public String toString() {
		return "SuggestionPostVO [sugNo=" + sugNo + ", sugTitle=" + sugTitle + ", sugContent=" + sugContent
				+ ", sugRegdate=" + sugRegdate + ", userVO=" + userVO + "]";
	}

}
