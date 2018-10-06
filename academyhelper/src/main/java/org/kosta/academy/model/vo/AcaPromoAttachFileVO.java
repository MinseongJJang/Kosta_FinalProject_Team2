package org.kosta.academy.model.vo;

public class AcaPromoAttachFileVO {
	private String promoAttachNo;
	private String acaPromoFilepath;
	private AcaPromoPostVO acaPromoPostVO;

	public AcaPromoAttachFileVO() {
		super();
	}

	public AcaPromoAttachFileVO(String acaPromoFilepath, AcaPromoPostVO acaPromoPostVO) {
		super();
		this.acaPromoFilepath = acaPromoFilepath;
		this.acaPromoPostVO = acaPromoPostVO;
	}

	public String getpromoAttachNo() {
		return promoAttachNo;
	}

	public void setpromoAttachNo(String promoAttachNo) {
		this.promoAttachNo = promoAttachNo;
	}

	public String getacaPromoFilepath() {
		return acaPromoFilepath;
	}

	public void setacaPromoFilepath(String acaPromoFilepath) {
		this.acaPromoFilepath = acaPromoFilepath;
	}

	public AcaPromoPostVO getAcaPromoPostVO() {
		return acaPromoPostVO;
	}

	public void setAcaPromoPostVO(AcaPromoPostVO acaPromoPostVO) {
		this.acaPromoPostVO = acaPromoPostVO;
	}

	@Override
	public String toString() {
		return "AcaPromoAttachFile [promoAttachNo=" + promoAttachNo + ", acaPromoFilepath=" + acaPromoFilepath
				+ ", acaPromoPostVO=" + acaPromoPostVO + "]";
	}

}
