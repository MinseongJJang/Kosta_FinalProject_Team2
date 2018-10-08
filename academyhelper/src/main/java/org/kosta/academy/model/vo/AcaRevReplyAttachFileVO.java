package org.kosta.academy.model.vo;

public class AcaRevReplyAttachFileVO {
	private String acaRevReplyAttNo;
	private String acaRevReplyFilepath;
	private AcaRevReplyVO acaRevReplyVO;
	public AcaRevReplyAttachFileVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AcaRevReplyAttachFileVO(String acaRevReplyAttNo, String acaRevReplyFilepath, AcaRevReplyVO acaRevReplyVO) {
		super();
		this.acaRevReplyAttNo = acaRevReplyAttNo;
		this.acaRevReplyFilepath = acaRevReplyFilepath;
		this.acaRevReplyVO = acaRevReplyVO;
	}
	public String getAcaRevReplyAttNo() {
		return acaRevReplyAttNo;
	}
	public void setAcaRevReplyAttNo(String acaRevReplyAttNo) {
		this.acaRevReplyAttNo = acaRevReplyAttNo;
	}
	public String getAcaRevReplyFilepath() {
		return acaRevReplyFilepath;
	}
	public void setAcaRevReplyFilepath(String acaRevReplyFilepath) {
		this.acaRevReplyFilepath = acaRevReplyFilepath;
	}
	public AcaRevReplyVO getAcaRevReplyVO() {
		return acaRevReplyVO;
	}
	public void setAcaRevReplyVO(AcaRevReplyVO acaRevReplyVO) {
		this.acaRevReplyVO = acaRevReplyVO;
	}
	@Override
	public String toString() {
		return "AcaRevReplyAttachFileVO [acaRevReplyAttNo=" + acaRevReplyAttNo + ", acaRevReplyFilepath="
				+ acaRevReplyFilepath + ", acaRevReplyVO=" + acaRevReplyVO + "]";
	}
	
	
}
