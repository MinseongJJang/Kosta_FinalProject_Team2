package org.kosta.academy.model.vo;

public class AcaUserVO {
	private UserVO userVO;
	private String busiRegNum;
	private String acaName;

	public AcaUserVO() {
		super();
	}

	public AcaUserVO(UserVO userVO, String busiRegNum, String acaName) {
		super();
		this.userVO = userVO;
		this.busiRegNum = busiRegNum;
		this.acaName = acaName;
	}

	public UserVO getUserVO() {
		return userVO;
	}

	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}

	public String getbusiRegNum() {
		return busiRegNum;
	}

	public void setbusiRegNum(String busiRegNum) {
		this.busiRegNum = busiRegNum;
	}

	public String getacaName() {
		return acaName;
	}

	public void setacaName(String acaName) {
		this.acaName = acaName;
	}

	@Override
	public String toString() {
		return "AcaUser [userVO=" + userVO + ", busiRegNum=" + busiRegNum + ", acaName=" + acaName + "]";
	}

}
