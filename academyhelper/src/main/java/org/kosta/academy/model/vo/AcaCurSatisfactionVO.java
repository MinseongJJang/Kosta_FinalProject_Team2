package org.kosta.academy.model.vo;

public class AcaCurSatisfactionVO {
	private AcaReviewVO acaReviewVO;
	private String curSatis;
	private String amentiesSatis;
	private String lecturerSatis;
	private String empLinksSatis;
	private String trafficSatis;

	public AcaCurSatisfactionVO() {
		super();
	}

	public AcaCurSatisfactionVO(AcaReviewVO acaReviewVO, String curSatis, String amentiesSatis, String lecturerSatis,
			String empLinksSatis, String trafficSatis) {
		super();
		this.acaReviewVO = acaReviewVO;
		this.curSatis = curSatis;
		this.amentiesSatis = amentiesSatis;
		this.lecturerSatis = lecturerSatis;
		this.empLinksSatis = empLinksSatis;
		this.trafficSatis = trafficSatis;
	}

	public AcaReviewVO getAcaReviewVO() {
		return acaReviewVO;
	}

	public void setAcaReviewVO(AcaReviewVO acaReviewVO) {
		this.acaReviewVO = acaReviewVO;
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
		return "AcaCurSatisfaction [acaReviewVO=" + acaReviewVO + ", curSatis=" + curSatis + ", amentiesSatis="
				+ amentiesSatis + ", lecturerSatis=" + lecturerSatis + ", empLinksSatis=" + empLinksSatis
				+ ", trafficSatis=" + trafficSatis + "]";
	}

}
