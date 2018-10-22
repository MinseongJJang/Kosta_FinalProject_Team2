package org.kosta.academy.model.vo;

public class HashTagVO {
	private String hashTagNo;
	private String hashTagName;
	private AcaReviewPostVO acaReviewPostVO;
	public HashTagVO() {
		super();
	}
	public HashTagVO(String hashTagName, AcaReviewPostVO acaReviewPostVO) {
		super();
		this.hashTagName = hashTagName;
		this.acaReviewPostVO = acaReviewPostVO;
	}
	
	public String getHashTagNo() {
		return hashTagNo;
	}
	public void setHashTagNo(String hashTagNo) {
		this.hashTagNo = hashTagNo;
	}
	public String getHashTagName() {
		return hashTagName;
	}
	public void setHashTagName(String hashTagName) {
		this.hashTagName = hashTagName;
	}
	public AcaReviewPostVO getAcaReviewPostVO() {
		return acaReviewPostVO;
	}
	public void setAcaReviewPostVO(AcaReviewPostVO acaReviewPostVO) {
		this.acaReviewPostVO = acaReviewPostVO;
	}
	@Override
	public String toString() {
		return "HashTagVO [hashTagNo=" + hashTagNo + ", hashTagName=" + hashTagName + ", acaReviewPostVO="
				+ acaReviewPostVO + "]";
	}
	
}
