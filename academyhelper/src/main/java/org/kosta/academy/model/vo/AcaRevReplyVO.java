package org.kosta.academy.model.vo;

public class AcaRevReplyVO {
	private String acaRevReplyNo;
	private String acaRevReplyContent;
	private String acaRevReplyRegDate;
	private AcaReviewPostVO acaReviewPostVO;
	private UserVO userVO;
	public AcaRevReplyVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AcaRevReplyVO(String acaRevReplyNo, String acaRevReplyContent, String acaRevReplyRegDate,
			AcaReviewPostVO acaReviewPostVO, UserVO userVO) {
		super();
		this.acaRevReplyNo = acaRevReplyNo;
		this.acaRevReplyContent = acaRevReplyContent;
		this.acaRevReplyRegDate = acaRevReplyRegDate;
		this.acaReviewPostVO = acaReviewPostVO;
		this.userVO = userVO;
	}
	public String getAcaRevReplyNo() {
		return acaRevReplyNo;
	}
	public void setAcaRevReplyNo(String acaRevReplyNo) {
		this.acaRevReplyNo = acaRevReplyNo;
	}
	public String getAcaRevReplyContent() {
		return acaRevReplyContent;
	}
	public void setAcaRevReplyContent(String acaRevReplyContent) {
		this.acaRevReplyContent = acaRevReplyContent;
	}
	public String getAcaRevReplyRegDate() {
		return acaRevReplyRegDate;
	}
	public void setAcaRevReplyRegDate(String acaRevReplyRegDate) {
		this.acaRevReplyRegDate = acaRevReplyRegDate;
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
		return "AcaRevReplyVO [acaRevReplyNo=" + acaRevReplyNo + ", acaRevReplyContent=" + acaRevReplyContent
				+ ", acaRevReplyRegDate=" + acaRevReplyRegDate + ", acaReviewPostVO=" + acaReviewPostVO + ", userVO="
				+ userVO + "]";
	}
	
	
}
