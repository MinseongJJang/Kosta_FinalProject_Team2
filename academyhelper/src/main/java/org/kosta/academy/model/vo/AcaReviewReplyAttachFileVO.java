package org.kosta.academy.model.vo;

public class AcaReviewReplyAttachFileVO {
	private String acaRevRepAttNo;
	private String acaRevRepFilepath;
	private AcaReviewReplyVO acaReivewReplyVO;

	public AcaReviewReplyAttachFileVO() {
		super();
	}

	public AcaReviewReplyAttachFileVO(String acaRevRepAttNo, String acaRevRepFilepath,
			AcaReviewReplyVO acaReivewReplyVO) {
		super();
		this.acaRevRepAttNo = acaRevRepAttNo;
		this.acaRevRepFilepath = acaRevRepFilepath;
		this.acaReivewReplyVO = acaReivewReplyVO;
	}

	public String getacaRevRepAttNo() {
		return acaRevRepAttNo;
	}

	public void setacaRevRepAttNo(String acaRevRepAttNo) {
		this.acaRevRepAttNo = acaRevRepAttNo;
	}

	public String getacaRevRepFilepath() {
		return acaRevRepFilepath;
	}

	public void setacaRevRepFilepath(String acaRevRepFilepath) {
		this.acaRevRepFilepath = acaRevRepFilepath;
	}

	public AcaReviewReplyVO getacaReivewReplyVO() {
		return acaReivewReplyVO;
	}

	public void setacaReivewReplyVO(AcaReviewReplyVO acaReivewReplyVO) {
		this.acaReivewReplyVO = acaReivewReplyVO;
	}

	@Override
	public String toString() {
		return "AcaRevReplyAttachFileVO [acaRevRepAttNo=" + acaRevRepAttNo + ", acaRevRepFilepath=" + acaRevRepFilepath
				+ ", acaReivewReplyVO=" + acaReivewReplyVO + "]";
	}

}
