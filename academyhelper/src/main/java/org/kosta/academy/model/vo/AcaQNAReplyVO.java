package org.kosta.academy.model.vo;

public class AcaQNAReplyVO {
	private String qnaRepNo;
	private String qnaRepRegDate;
	private String qnaRepContent;
	private UserVO userVo;
	private AcaQNAVO acaQNAVO;

	public AcaQNAReplyVO() {
		super();
	}

	public AcaQNAReplyVO(String qnaRepNo, String qnaRepRegDate, String qnaRepContent, UserVO userVo,
			AcaQNAVO acaQNAVO) {
		super();
		this.qnaRepNo = qnaRepNo;
		this.qnaRepRegDate = qnaRepRegDate;
		this.qnaRepContent = qnaRepContent;
		this.userVo = userVo;
		this.acaQNAVO = acaQNAVO;
	}

	public String getqnaRepNo() {
		return qnaRepNo;
	}

	public void setqnaRepNo(String qnaRepNo) {
		this.qnaRepNo = qnaRepNo;
	}

	public String getqnaRepRegDate() {
		return qnaRepRegDate;
	}

	public void setqnaRepRegDate(String qnaRepRegDate) {
		this.qnaRepRegDate = qnaRepRegDate;
	}

	public String getqnaRepContent() {
		return qnaRepContent;
	}

	public void setqnaRepContent(String qnaRepContent) {
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
		return "AcaQNAReplyVO [qnaRepNo=" + qnaRepNo + ", qnaRepRegDate=" + qnaRepRegDate + ", qnaRepContent="
				+ qnaRepContent + ", userVo=" + userVo + ", acaQNAVO=" + acaQNAVO + "]";
	}

}
