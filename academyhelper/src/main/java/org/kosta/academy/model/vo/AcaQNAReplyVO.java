package org.kosta.academy.model.vo;

public class AcaQNAReplyVO {
	private String qnaRepNo;
	private String qnaRepRegdate;
	private String qnaRepContent;
	private UserVO userVO;
	private AcaQNAVO acaQNAVO;
	public AcaQNAReplyVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AcaQNAReplyVO(String qnaRepNo, String qnaRepRegdate, String qnaRepContent, UserVO userVO,
			AcaQNAVO acaQNAVO) {
		super();
		this.qnaRepNo = qnaRepNo;
		this.qnaRepRegdate = qnaRepRegdate;
		this.qnaRepContent = qnaRepContent;
		this.userVO = userVO;
		this.acaQNAVO = acaQNAVO;
	}
	public String getQnaRepNo() {
		return qnaRepNo;
	}
	public void setQnaRepNo(String qnaRepNo) {
		this.qnaRepNo = qnaRepNo;
	}
	public String getQnaRepRegdate() {
		return qnaRepRegdate;
	}
	public void setQnaRepRegdate(String qnaRepRegdate) {
		this.qnaRepRegdate = qnaRepRegdate;
	}
	public String getQnaRepContent() {
		return qnaRepContent;
	}
	public void setQnaRepContent(String qnaRepContent) {
		this.qnaRepContent = qnaRepContent;
	}
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	public AcaQNAVO getAcaQNAVO() {
		return acaQNAVO;
	}
	public void setAcaQNAVO(AcaQNAVO acaQNAVO) {
		this.acaQNAVO = acaQNAVO;
	}
	@Override
	public String toString() {
		return "AcaQNAReplyVO [qnaRepNo=" + qnaRepNo + ", qnaRepRegdate=" + qnaRepRegdate + ", qnaRepContent="
				+ qnaRepContent + ", userVO=" + userVO + ", acaQNAVO=" + acaQNAVO + "]";
	}
	
}
