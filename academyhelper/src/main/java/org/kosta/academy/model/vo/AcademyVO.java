package org.kosta.academy.model.vo;

public class AcademyVO {
	private String acaNo; 
	private String acaName;
	private String acaAddr;
	private String acaTel;
	private String acaMainPic;
	private String acaContent;
	private UserVO userVO;
	public AcademyVO(String acaNo, String acaName, String acaAddr, String acaTel, String acaMainPic, String acaContent,
			UserVO userVO) {
		super();
		this.acaNo = acaNo;
		this.acaName = acaName;
		this.acaAddr = acaAddr;
		this.acaTel = acaTel;
		this.acaMainPic = acaMainPic;
		this.acaContent = acaContent;
		this.userVO = userVO;
	}
	public AcademyVO() {
		super();
		// TODO Auto-generated constructor stub
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
	public String getAcaMainPic() {
		return acaMainPic;
	}
	public void setAcaMainPic(String acaMainPic) {
		this.acaMainPic = acaMainPic;
	}
	public String getAcaContent() {
		return acaContent;
	}
	public void setAcaContent(String acaContent) {
		this.acaContent = acaContent;
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
				+ ", acaMainPic=" + acaMainPic + ", acaContent=" + acaContent + ", userVO=" + userVO + "]";
	}
	
}
