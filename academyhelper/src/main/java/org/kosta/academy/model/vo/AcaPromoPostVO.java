package org.kosta.academy.model.vo;

public class AcaPromoPostVO {
	private String acaPromoNo;
	private String acaPromoTitle;
	private String acaPromoContent;
	private String acaPromoRegdate;
	private int acaPromoHits;
	private UserVO userVO;

	public AcaPromoPostVO() {
		super();
	}

	public AcaPromoPostVO(String acaPromoTitle, String acaPromoContent, String acaPromoRegdate, int acaPromoHits,
			UserVO userVO) {
		super();
		this.acaPromoTitle = acaPromoTitle;
		this.acaPromoContent = acaPromoContent;
		this.acaPromoRegdate = acaPromoRegdate;
		this.acaPromoHits = acaPromoHits;
		this.userVO = userVO;
	}

	public String getAcaPromoNo() {
		return acaPromoNo;
	}

	public void setAcaPromoNo(String acaPromoNo) {
		this.acaPromoNo = acaPromoNo;
	}

	public String getAcaPromoTitle() {
		return acaPromoTitle;
	}

	public void setAcaPromoTitle(String acaPromoTitle) {
		this.acaPromoTitle = acaPromoTitle;
	}

	public String getAcaPromoContent() {
		return acaPromoContent;
	}

	public void setAcaPromoContent(String acaPromoContent) {
		this.acaPromoContent = acaPromoContent;
	}

	public String getAcaPromoRegdate() {
		return acaPromoRegdate;
	}

	public void setAcaPromoRegdate(String acaPromoRegdate) {
		this.acaPromoRegdate = acaPromoRegdate;
	}

	public int getAcaPromoHits() {
		return acaPromoHits;
	}

	public void setAcaPromoHits(int acaPromoHits) {
		this.acaPromoHits = acaPromoHits;
	}

	public UserVO getUserVO() {
		return userVO;
	}

	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}

	@Override
	public String toString() {
		return "AcaPromoPost [acaPromoNo=" + acaPromoNo + ", acaPromoTitle=" + acaPromoTitle + ", acaPromoContent="
				+ acaPromoContent + ", acaPromoRegdate=" + acaPromoRegdate + ", acaPromoHits=" + acaPromoHits
				+ ", userVO=" + userVO + "]";
	}

}
