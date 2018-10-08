package org.kosta.academy.model.vo;

public class AcaQNAReplyAttachFileVO {
	private String qnaRepAttNo;
	private String qnaRepFilepate;
	private AcaQNAReplyVO acaQNAReplyVO;

	public AcaQNAReplyAttachFileVO() {
		super();
	}

	public AcaQNAReplyAttachFileVO(String qnaRepAttNo, String qnaRepFilepate, AcaQNAReplyVO acaQNAReplyVO) {
		super();
		this.qnaRepAttNo = qnaRepAttNo;
		this.qnaRepFilepate = qnaRepFilepate;
		this.acaQNAReplyVO = acaQNAReplyVO;
	}

	public String getqnaRepAttNo() {
		return qnaRepAttNo;
	}

	public void setqnaRepAttNo(String qnaRepAttNo) {
		this.qnaRepAttNo = qnaRepAttNo;
	}

	public String getqnaRepFilepate() {
		return qnaRepFilepate;
	}

	public void setqnaRepFilepate(String qnaRepFilepate) {
		this.qnaRepFilepate = qnaRepFilepate;
	}

	public AcaQNAReplyVO getAcaQNAReplyVO() {
		return acaQNAReplyVO;
	}

	public void setAcaQNAReplyVO(AcaQNAReplyVO acaQNAReplyVO) {
		this.acaQNAReplyVO = acaQNAReplyVO;
	}

	@Override
	public String toString() {
		return "AcaQNAReplyAttachFileVO [qnaRepAttNo=" + qnaRepAttNo + ", qnaRepFilepate=" + qnaRepFilepate
				+ ", acaQNAReplyVO=" + acaQNAReplyVO + "]";
	}

}
