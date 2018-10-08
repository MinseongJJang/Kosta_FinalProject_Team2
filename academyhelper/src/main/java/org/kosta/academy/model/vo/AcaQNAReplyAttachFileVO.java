package org.kosta.academy.model.vo;

public class AcaQNAReplyAttachFileVO {
	private String qnaReplyAttNo;
	private String qnaReplyFilepate;
	private AcaQNAReplyVO acaQNAReplyVO;
	public AcaQNAReplyAttachFileVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AcaQNAReplyAttachFileVO(String qnaReplyAttNo, String qnaReplyFilepate, AcaQNAReplyVO acaQNAReplyVO) {
		super();
		this.qnaReplyAttNo = qnaReplyAttNo;
		this.qnaReplyFilepate = qnaReplyFilepate;
		this.acaQNAReplyVO = acaQNAReplyVO;
	}
	public String getQnaReplyAttNo() {
		return qnaReplyAttNo;
	}
	public void setQnaReplyAttNo(String qnaReplyAttNo) {
		this.qnaReplyAttNo = qnaReplyAttNo;
	}
	public String getQnaReplyFilepate() {
		return qnaReplyFilepate;
	}
	public void setQnaReplyFilepate(String qnaReplyFilepate) {
		this.qnaReplyFilepate = qnaReplyFilepate;
	}
	public AcaQNAReplyVO getAcaQNAReplyVO() {
		return acaQNAReplyVO;
	}
	public void setAcaQNAReplyVO(AcaQNAReplyVO acaQNAReplyVO) {
		this.acaQNAReplyVO = acaQNAReplyVO;
	}
	@Override
	public String toString() {
		return "AcaQNAReplyAttachFileVO [qnaReplyAttNo=" + qnaReplyAttNo + ", qnaReplyFilepate=" + qnaReplyFilepate
				+ ", acaQNAReplyVO=" + acaQNAReplyVO + "]";
	}
	
	
	
}
