package org.kosta.academy.model.vo;

public class UserVO {
	private String usrId;
	private String usrPass;
	private String usrName;
	private String usrAddr;
	private int enabled;
	private String nickname;
	private String birthday;
	private String usrRegdate;
	private String usrEmail;
	private String usrTel;

	public UserVO() {
		super();
	}

	public UserVO(String usrId, String usrPass, String usrName, String usrAddr, int enabled, String nickname,
			String birthday, String usrRegdate, String usrEmail, String usrTel) {
		super();
		this.usrId = usrId;
		this.usrPass = usrPass;
		this.usrName = usrName;
		this.usrAddr = usrAddr;
		this.enabled = enabled;
		this.nickname = nickname;
		this.birthday = birthday;
		this.usrRegdate = usrRegdate;
		this.usrEmail = usrEmail;
		this.usrTel = usrTel;
	}

	public String getUsrId() {
		return usrId;
	}

	public void setUsrId(String usrId) {
		this.usrId = usrId;
	}

	public String getUsrPass() {
		return usrPass;
	}

	public void setUsrPass(String usrPass) {
		this.usrPass = usrPass;
	}

	public String getUsrName() {
		return usrName;
	}

	public void setUsrName(String usrName) {
		this.usrName = usrName;
	}

	public String getUsrAddr() {
		return usrAddr;
	}

	public void setUsrAddr(String usrAddr) {
		this.usrAddr = usrAddr;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getUsrRegdate() {
		return usrRegdate;
	}

	public void setUsrRegdate(String usrRegdate) {
		this.usrRegdate = usrRegdate;
	}

	public String getUsrEmail() {
		return usrEmail;
	}

	public void setUsrEmail(String usrEmail) {
		this.usrEmail = usrEmail;
	}

	public String getUsrTel() {
		return usrTel;
	}

	public void setUsrTel(String usrTel) {
		this.usrTel = usrTel;
	}

	@Override
	public String toString() {
		return "User [usrId=" + usrId + ", usrPass=" + usrPass + ", usrName=" + usrName + ", usrAddr=" + usrAddr
				+ ", enabled=" + enabled + ", nickname=" + nickname + ", birthday=" + birthday + ", usrRegdate="
				+ usrRegdate + ", usrEmail=" + usrEmail + ", usrTel=" + usrTel + "]";
	}

}
