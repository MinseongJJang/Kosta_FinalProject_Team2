package org.kosta.academy.model.vo;

public class AcaPromoPostVO {
	private String acaPromoNo;
	private String acaPromoTitle;
	private String acaPromoContent;
	private String acaPromoRegdate;
	private int acaPromoHits;
	private AcaUserVO acaUserVO;

	public AcaPromoPostVO() {
		super();
	}

	public AcaPromoPostVO(String acaPromoNo, String acaPromoTitle, String acaPromoContent, String acaPromoRegdate,
			int acaPromoHits, AcaUserVO acaUserVO) {
		super();
		this.acaPromoNo = acaPromoNo;
		this.acaPromoTitle = acaPromoTitle;
		this.acaPromoContent = acaPromoContent;
		this.acaPromoRegdate = acaPromoRegdate;
		this.acaPromoHits = acaPromoHits;
		this.acaUserVO = acaUserVO;
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

	public AcaUserVO getAcaUserVO() {
		return acaUserVO;
	}

	public void setAcaUserVO(AcaUserVO acaUserVO) {
		this.acaUserVO = acaUserVO;
	}

	@Override
	public String toString() {
		return "AcaPromoPostVO [acaPromoNo=" + acaPromoNo + ", acaPromoTitle=" + acaPromoTitle + ", acaPromoContent="
				+ acaPromoContent + ", acaPromoRegdate=" + acaPromoRegdate + ", acaPromoHits=" + acaPromoHits
				+ ", acaUserVO=" + acaUserVO + "]";
	}

	

}
