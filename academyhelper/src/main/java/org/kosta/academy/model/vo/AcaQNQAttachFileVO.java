package org.kosta.academy.model.vo;

public class AcaQNQAttachFileVO {
	private String qnaAttNo;
	private String qnaFilepath;
	private AcaQNAVO academyQNAVO;
	public AcaQNQAttachFileVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AcaQNQAttachFileVO(String qnaAttNo, String qnaFilepath, AcaQNAVO academyQNAVO) {
		super();
		this.qnaAttNo = qnaAttNo;
		this.qnaFilepath = qnaFilepath;
		this.academyQNAVO = academyQNAVO;
	}
	public String getQnaAttNo() {
		return qnaAttNo;
	}
	public void setQnaAttNo(String qnaAttNo) {
		this.qnaAttNo = qnaAttNo;
	}
	public String getQnaFilepath() {
		return qnaFilepath;
	}
	public void setQnaFilepath(String qnaFilepath) {
		this.qnaFilepath = qnaFilepath;
	}
	public AcaQNAVO getAcademyQNAVO() {
		return academyQNAVO;
	}
	public void setAcademyQNAVO(AcaQNAVO academyQNAVO) {
		this.academyQNAVO = academyQNAVO;
	}
	@Override
	public String toString() {
		return "AcaQNQAttachFileVO [qnaAttNo=" + qnaAttNo + ", qnaFilepath=" + qnaFilepath + ", academyQNAVO="
				+ academyQNAVO + "]";
	}
	
}
