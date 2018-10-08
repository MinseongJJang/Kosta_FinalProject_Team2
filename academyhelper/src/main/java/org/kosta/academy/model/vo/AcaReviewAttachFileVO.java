package org.kosta.academy.model.vo;

public class AcaReviewAttachFileVO {
	private String acaRevAttNo;
	private String acaRevFilepath;
	private AcaReviewPostVO acaReviewPostVO;
	public AcaReviewAttachFileVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AcaReviewAttachFileVO(String acaRevAttNo, String acaRevFilepath, AcaReviewPostVO acaReviewPostVO) {
		super();
		this.acaRevAttNo = acaRevAttNo;
		this.acaRevFilepath = acaRevFilepath;
		this.acaReviewPostVO = acaReviewPostVO;
	}
	public String getAcaRevAttNo() {
		return acaRevAttNo;
	}
	public void setAcaRevAttNo(String acaRevAttNo) {
		this.acaRevAttNo = acaRevAttNo;
	}
	public String getAcaRevFilepath() {
		return acaRevFilepath;
	}
	public void setAcaRevFilepath(String acaRevFilepath) {
		this.acaRevFilepath = acaRevFilepath;
	}
	public AcaReviewPostVO getAcaReviewPostVO() {
		return acaReviewPostVO;
	}
	public void setAcaReviewPostVO(AcaReviewPostVO acaReviewPostVO) {
		this.acaReviewPostVO = acaReviewPostVO;
	}
	@Override
	public String toString() {
		return "AcaReviewAttachFileVO [acaRevAttNo=" + acaRevAttNo + ", acaRevFilepath=" + acaRevFilepath
				+ ", acaReviewPostVO=" + acaReviewPostVO + "]";
	}

	
}
