package org.kosta.academy.model.vo;

public class AcaQNAReplyVO {
	private String qnaReplyNo;
	private String qnaReplyRegDate;
	private String qnaReplyContent;
	private UserVO userVo;
	private AcaQNAVO acaQNAVO;
	public AcaQNAReplyVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AcaQNAReplyVO(String qnaReplyNo, String qnaReplyRegDate, String qnaReplyContent, UserVO userVo,
			AcaQNAVO acaQNAVO) {
		super();
		this.qnaReplyNo = qnaReplyNo;
		this.qnaReplyRegDate = qnaReplyRegDate;
		this.qnaReplyContent = qnaReplyContent;
		this.userVo = userVo;
		this.acaQNAVO = acaQNAVO;
	}
	public String getQnaReplyNo() {
		return qnaReplyNo;
	}
	public void setQnaReplyNo(String qnaReplyNo) {
		this.qnaReplyNo = qnaReplyNo;
	}
	public String getQnaReplyRegDate() {
		return qnaReplyRegDate;
	}
	public void setQnaReplyRegDate(String qnaReplyRegDate) {
		this.qnaReplyRegDate = qnaReplyRegDate;
	}
	public String getQnaReplyContent() {
		return qnaReplyContent;
	}
	public void setQnaReplyContent(String qnaReplyContent) {
		this.qnaReplyContent = qnaReplyContent;
	}
	public UserVO getUserVo() {
		return userVo;
	}
	public void setUserVo(UserVO userVo) {
		this.userVo = userVo;
	}
	public AcaQNAVO getAcaQNAVO() {
		return acaQNAVO;
	}
	public void setAcaQNAVO(AcaQNAVO acaQNAVO) {
		this.acaQNAVO = acaQNAVO;
	}
	@Override
	public String toString() {
		return "AcaQNAReplyVO [qnaReplyNo=" + qnaReplyNo + ", qnaReplyRegDate=" + qnaReplyRegDate + ", qnaReplyContent="
				+ qnaReplyContent + ", userVo=" + userVo + ", acaQNAVO=" + acaQNAVO + "]";
	}
	
	
}
