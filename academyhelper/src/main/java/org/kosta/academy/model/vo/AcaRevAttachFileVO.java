package org.kosta.academy.model.vo;

public class AcaRevAttachFileVO {
	private String acaRevAttachNo;
	private String acaRevFilepath;
	private AcaReviewVO acaReviewVO;

	public AcaRevAttachFileVO() {
		super();
	}

	public AcaRevAttachFileVO(String acaRevAttachNo, String acaRevFilepath, AcaReviewVO acaReviewVO) {
		super();
		this.acaRevAttachNo = acaRevAttachNo;
		this.acaRevFilepath = acaRevFilepath;
		this.acaReviewVO = acaReviewVO;
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

	public AcaReviewVO getAcaReviewVO() {
		return acaReviewVO;
	}

	public void setAcaReviewVO(AcaReviewVO acaReviewVO) {
		this.acaReviewVO = acaReviewVO;
	}

	@Override
	public String toString() {
		return "AcaRevAttachFileVO [acaRevAttachNo=" + acaRevAttachNo + ", acaRevFilepath=" + acaRevFilepath
				+ ", acaReviewVO=" + acaReviewVO + "]";
	}

}
