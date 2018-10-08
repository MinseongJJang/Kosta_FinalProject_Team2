package org.kosta.academy.model.vo;

public class AcaReviewReplyVO {
	private String acaRevRepNo;
	private String acaRevRepContent;
	private String acaRevRepRegDate;
	private AcaReviewPostVO acaReviewPostVO;
	private UserVO userVO;

	public AcaReviewReplyVO() {
		super();
	}

	public AcaReviewReplyVO(String acaRevRepNo, String acaRevRepContent, String acaRevRepRegDate,
			AcaReviewPostVO acaReviewPostVO, UserVO userVO) {
		super();
		this.acaRevRepNo = acaRevRepNo;
		this.acaRevRepContent = acaRevRepContent;
		this.acaRevRepRegDate = acaRevRepRegDate;
		this.acaReviewPostVO = acaReviewPostVO;
		this.userVO = userVO;
	}

	public String getacaRevRepNo() {
		return acaRevRepNo;
	}

	public void setacaRevRepNo(String acaRevRepNo) {
		this.acaRevRepNo = acaRevRepNo;
	}

	public String getacaRevRepContent() {
		return acaRevRepContent;
	}

	public void setacaRevRepContent(String acaRevRepContent) {
		this.acaRevRepContent = acaRevRepContent;
	}

	public String getacaRevRepRegDate() {
		return acaRevRepRegDate;
	}

	public void setacaRevRepRegDate(String acaRevRepRegDate) {
		this.acaRevRepRegDate = acaRevRepRegDate;
	}

	public AcaReviewPostVO getAcaReviewPostVO() {
		return acaReviewPostVO;
	}

	public void setAcaReviewPostVO(AcaReviewPostVO acaReviewPostVO) {
		this.acaReviewPostVO = acaReviewPostVO;
	}

	public UserVO getUserVO() {
		return userVO;
	}

	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}

	@Override
	public String toString() {
		return "AcaRevReplyVO [acaRevRepNo=" + acaRevRepNo + ", acaRevRepContent=" + acaRevRepContent
				+ ", acaRevRepRegDate=" + acaRevRepRegDate + ", acaReviewPostVO=" + acaReviewPostVO + ", userVO="
				+ userVO + "]";
	}

}
