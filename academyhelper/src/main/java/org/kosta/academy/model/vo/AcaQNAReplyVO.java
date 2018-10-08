package org.kosta.academy.model.vo;

public class AcaQNAReplyVO {
	private String qnaRepNo;
	private String qnaRepRegdate;
	private String qnaRepContent;
	private UserVO userVo;
	private AcaQNAVO acaQNAVO;

	public AcaQNAReplyVO() {
		super();
	}

	public AcaQNAReplyVO(String qnaRepNo, String qnaRepRegdate, String qnaRepContent, UserVO userVo,
			AcaQNAVO acaQNAVO) {
		super();
		this.qnaRepNo = qnaRepNo;
		this.qnaRepRegdate = qnaRepRegdate;
		this.qnaRepContent = qnaRepContent;
		this.userVo = userVo;
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
		return "AcaQNAReplyVO [qnaRepNo=" + qnaRepNo + ", qnaRepRegdate=" + qnaRepRegdate + ", qnaRepContent="
				+ qnaRepContent + ", userVo=" + userVo + ", acaQNAVO=" + acaQNAVO + "]";
	}
	
}