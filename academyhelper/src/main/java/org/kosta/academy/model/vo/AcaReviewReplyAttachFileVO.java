package org.kosta.academy.model.vo;

public class AcaReviewReplyAttachFileVO {
	private String acaRevRepAttNo;
	private String acaRevRepFilepath;
	private AcaReviewReplyVO acaReviewReplyVO;
	public AcaReviewReplyAttachFileVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AcaReviewReplyAttachFileVO(String acaRevRepAttNo, String acaRevRepFilepath,
			AcaReviewReplyVO acaReviewReplyVO) {
		super();
		this.acaRevRepAttNo = acaRevRepAttNo;
		this.acaRevRepFilepath = acaRevRepFilepath;
		this.acaReviewReplyVO = acaReviewReplyVO;
	}
	public String getAcaRevRepAttNo() {
		return acaRevRepAttNo;
	}
	public void setAcaRevRepAttNo(String acaRevRepAttNo) {
		this.acaRevRepAttNo = acaRevRepAttNo;
	}
	public String getAcaRevRepFilepath() {
		return acaRevRepFilepath;
	}
	public void setAcaRevRepFilepath(String acaRevRepFilepath) {
		this.acaRevRepFilepath = acaRevRepFilepath;
	}
	public AcaReviewReplyVO getAcaReviewReplyVO() {
		return acaReviewReplyVO;
	}
	public void setAcaReviewReplyVO(AcaReviewReplyVO acaReviewReplyVO) {
		this.acaReviewReplyVO = acaReviewReplyVO;
	}
	@Override
	public String toString() {
		return "AcaReviewReplyAttachFileVO [acaRevRepAttNo=" + acaRevRepAttNo + ", acaRevRepFilepath="
				+ acaRevRepFilepath + ", acaReviewReplyVO=" + acaReviewReplyVO + "]";
	}
	
	
}
