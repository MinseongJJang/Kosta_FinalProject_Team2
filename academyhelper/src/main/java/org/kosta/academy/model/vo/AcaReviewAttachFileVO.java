package org.kosta.academy.model.vo;

public class AcaReviewAttachFileVO {
	private String acaRevAttachNo;
	private String acaRevFilepath;
	private AcaReviewPostVO acaReviewPostVO;

	public AcaReviewAttachFileVO() {
		super();
	}

	public AcaReviewAttachFileVO(String acaRevAttachNo, String acaRevFilepath, AcaReviewPostVO acaReviewPostVO) {
		super();
		this.acaRevAttachNo = acaRevAttachNo;
		this.acaRevFilepath = acaRevFilepath;
		this.acaReviewPostVO = acaReviewPostVO;
	}

	public String getAcaRevAttachNo() {
		return acaRevAttachNo;
	}

	public void setAcaRevAttachNo(String acaRevAttachNo) {
		this.acaRevAttachNo = acaRevAttachNo;
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
		return "AcaRevAttachFileVO [acaRevAttachNo=" + acaRevAttachNo + ", acaRevFilepath=" + acaRevFilepath
				+ ", acaReviewPostVO=" + acaReviewPostVO + "]";
	}

}
