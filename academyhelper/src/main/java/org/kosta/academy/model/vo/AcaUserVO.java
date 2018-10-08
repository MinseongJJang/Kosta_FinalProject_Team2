package org.kosta.academy.model.vo;

public class AcaUserVO {
	private UserVO userVO;
	private String busiRegNum;
	private String acaName;
	private String acaAddr;
	private String accTel;

	public AcaUserVO() {
		super();
	}

	public AcaUserVO(UserVO userVO, String busiRegNum, String acaName, String acaAddr, String accTel) {
		super();
		this.userVO = userVO;
		this.busiRegNum = busiRegNum;
		this.acaName = acaName;
		this.acaAddr = acaAddr;
		this.accTel = accTel;
	}

	public UserVO getUserVO() {
		return userVO;
	}

	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}

	public String getBusiRegNum() {
		return busiRegNum;
	}

	public void setBusiRegNum(String busiRegNum) {
		this.busiRegNum = busiRegNum;
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

	public String getAccTel() {
		return accTel;
	}

	public void setAccTel(String accTel) {
		this.accTel = accTel;
	}

	@Override
	public String toString() {
		return "AcaUserVO [userVO=" + userVO + ", busiRegNum=" + busiRegNum + ", acaName=" + acaName + ", acaAddr="
				+ acaAddr + ", accTel=" + accTel + "]";
	}


}
