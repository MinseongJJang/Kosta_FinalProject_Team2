package org.kosta.academy.model.vo;

public class AcaCurSatisfactionVO {
	private AcaReviewPostVO acaReviewPostVO;
	private String curSatis;
	private String amentiesSatis;
	private String lecturerSatis;
	private String empLinksSatis;
	private String trafficSatis;

	public AcaCurSatisfactionVO() {
		super();
	}

	public AcaCurSatisfactionVO(AcaReviewPostVO acaReviewPostVO, String curSatis, String amentiesSatis, String lecturerSatis,
			String empLinksSatis, String trafficSatis) {
		super();
		this.acaReviewPostVO = acaReviewPostVO;
		this.curSatis = curSatis;
		this.amentiesSatis = amentiesSatis;
		this.lecturerSatis = lecturerSatis;
		this.empLinksSatis = empLinksSatis;
		this.trafficSatis = trafficSatis;
	}

	public AcaReviewPostVO getAcaReviewPostVO() {
		return acaReviewPostVO;
	}

	public void setAcaReviewPostVO(AcaReviewPostVO acaReviewPostVO) {
		this.acaReviewPostVO = acaReviewPostVO;
	}

	public String getCurSatis() {
		return curSatis;
	}

	public void setCurSatis(String curSatis) {
		this.curSatis = curSatis;
	}

	public String getAmentiesSatis() {
		return amentiesSatis;
	}

	public void setAmentiesSatis(String amentiesSatis) {
		this.amentiesSatis = amentiesSatis;
	}

	public String getLecturerSatis() {
		return lecturerSatis;
	}

	public void setLecturerSatis(String lecturerSatis) {
		this.lecturerSatis = lecturerSatis;
	}

	public String getEmpLinksSatis() {
		return empLinksSatis;
	}

	public void setEmpLinksSatis(String empLinksSatis) {
		this.empLinksSatis = empLinksSatis;
	}

	public String getTrafficSatis() {
		return trafficSatis;
	}

	public void setTrafficSatis(String trafficSatis) {
		this.trafficSatis = trafficSatis;
	}

	@Override
	public String toString() {
		return "AcaCurSatisfaction [acaReviewPostVO=" + acaReviewPostVO + ", curSatis=" + curSatis + ", amentiesSatis="
				+ amentiesSatis + ", lecturerSatis=" + lecturerSatis + ", empLinksSatis=" + empLinksSatis
				+ ", trafficSatis=" + trafficSatis + "]";
	}

}
