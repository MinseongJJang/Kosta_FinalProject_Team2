package org.kosta.academy.model.vo;

public class AcademyVO {
	private String acaNo;
	private String acaName;
	private String acaAddr;
	private String acaTel;
	private UserVO userVO;

	public AcademyVO() {
		super();
	}

	public AcademyVO(String acaName, String acaAddr, String acaTel, UserVO userVO) {
		super();
		this.acaName = acaName;
		this.acaAddr = acaAddr;
		this.acaTel = acaTel;
		this.userVO = userVO;
	}

	public String getAcaNo() {
		return acaNo;
	}

	public void setAcaNo(String acaNo) {
		this.acaNo = acaNo;
	}

	public String getAcaName() {
		return acaName;
	}

	public void setAcaName(String acaName) {
		this.acaName = acaName;
	}

	public String getAcaAddr() {
		return acaAddr;
	}

	public void setAcaAddr(String acaAddr) {
		this.acaAddr = acaAddr;
	}

	public String getAcaTel() {
		return acaTel;
	}

	public void setAcaTel(String acaTel) {
		this.acaTel = acaTel;
	}

	public UserVO getUserVO() {
		return userVO;
	}

	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}

	@Override
	public String toString() {
		return "AcademyVO [acaNo=" + acaNo + ", acaName=" + acaName + ", acaAddr=" + acaAddr + ", acaTel=" + acaTel
				+ ", userVO=" + userVO + "]";
	}

}
