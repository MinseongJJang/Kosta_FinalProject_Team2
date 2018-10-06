package org.kosta.academy.model.vo;

public class EmpReviewAttachFileVO {
	private String empRevAttachNo;
	private String empRevFilepath;
	private EmpReviewPostVO empReviewPostVO;

	public EmpReviewAttachFileVO() {
		super();
	}

	public EmpReviewAttachFileVO(String empRevAttachNo, String empRevFilepath, EmpReviewPostVO empReviewPostVO) {
		super();
		this.empRevAttachNo = empRevAttachNo;
		this.empRevFilepath = empRevFilepath;
		this.empReviewPostVO = empReviewPostVO;
	}

	public String getEmpRevAttachNo() {
		return empRevAttachNo;
	}

	public void setEmpRevAttachNo(String empRevAttachNo) {
		this.empRevAttachNo = empRevAttachNo;
	}

	public String getEmpRevFilepath() {
		return empRevFilepath;
	}

	public void setEmpRevFilepath(String empRevFilepath) {
		this.empRevFilepath = empRevFilepath;
	}

	public EmpReviewPostVO getEmpReviewPostVO() {
		return empReviewPostVO;
	}

	public void setEmpReviewPostVO(EmpReviewPostVO empReviewPostVO) {
		this.empReviewPostVO = empReviewPostVO;
	}

	@Override
	public String toString() {
		return "EmpReviewAttachFile [empRevAttachNo=" + empRevAttachNo + ", empRevFilepath=" + empRevFilepath
				+ ", empReviewPostVO=" + empReviewPostVO + "]";
	}

}
