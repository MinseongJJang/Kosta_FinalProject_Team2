package org.kosta.academy.model.vo;

public class AcaReviewReplyVO {
	private String acaRevRepNo;
	private String acaRevRepContent;
	private String acaRevRepRegdate;
	private AcaReviewPostVO acaReviewPostVO;
	private UserVO userVO;
	public AcaReviewReplyVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AcaReviewReplyVO(String acaRevRepNo, String acaRevRepContent, String acaRevRepRegdate,
			AcaReviewPostVO acaReviewPostVO, UserVO userVO) {
		super();
		this.acaRevRepNo = acaRevRepNo;
		this.acaRevRepContent = acaRevRepContent;
		this.acaRevRepRegdate = acaRevRepRegdate;
		this.acaReviewPostVO = acaReviewPostVO;
		this.userVO = userVO;
	}
	public String getAcaRevRepNo() {
		return acaRevRepNo;
	}
	public void setAcaRevRepNo(String acaRevRepNo) {
		this.acaRevRepNo = acaRevRepNo;
	}
	public String getAcaRevRepContent() {
		return acaRevRepContent;
	}
	public void setAcaRevRepContent(String acaRevRepContent) {
		this.acaRevRepContent = acaRevRepContent;
	}
	public String getAcaRevRepRegdate() {
		return acaRevRepRegdate;
	}
	public void setAcaRevRepRegdate(String acaRevRepRegdate) {
		this.acaRevRepRegdate = acaRevRepRegdate;
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
		return "AcaReviewReplyVO [acaRevRepNo=" + acaRevRepNo + ", acaRevRepContent=" + acaRevRepContent
				+ ", acaRevRepRegdate=" + acaRevRepRegdate + ", acaReviewPostVO=" + acaReviewPostVO + ", userVO="
				+ userVO + "]";
	}
	
	
}
