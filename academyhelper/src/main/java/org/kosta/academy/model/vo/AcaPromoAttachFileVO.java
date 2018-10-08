package org.kosta.academy.model.vo;

public class AcaPromoAttachFileVO {
	private String acaPromoAttNo;
	private String acaPromoFilepath;
	private AcaPromoPostVO acaPromoPostVO;
	
	public AcaPromoAttachFileVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AcaPromoAttachFileVO(String acaPromoAttNo, String acaPromoFilepath, AcaPromoPostVO acaPromoPostVO) {
		super();
		this.acaPromoAttNo = acaPromoAttNo;
		this.acaPromoFilepath = acaPromoFilepath;
		this.acaPromoPostVO = acaPromoPostVO;
	}
	public String getAcaPromoAttNo() {
		return acaPromoAttNo;
	}
	public void setAcaPromoAttNo(String acaPromoAttNo) {
		this.acaPromoAttNo = acaPromoAttNo;
	}
	public String getAcaPromoFilepath() {
		return acaPromoFilepath;
	}
	public void setAcaPromoFilepath(String acaPromoFilepath) {
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
		return "AcaPromoAttachFileVO [acaPromoAttNo=" + acaPromoAttNo + ", acaPromoFilepath=" + acaPromoFilepath
				+ ", acaPromoPostVO=" + acaPromoPostVO + "]";
	}
	
}
