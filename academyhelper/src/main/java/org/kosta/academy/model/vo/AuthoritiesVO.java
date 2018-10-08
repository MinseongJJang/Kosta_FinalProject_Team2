package org.kosta.academy.model.vo;

import java.io.Serializable;

public class AuthoritiesVO implements Serializable {
	private static final long serialVersionUID = 5188280555844223102L;
	private UserVO userVO;
	private String authority;
	public AuthoritiesVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AuthoritiesVO(UserVO userVO, String authority) {
		super();
		this.userVO = userVO;
		this.authority = authority;
	}
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "AuthoritiesVO [userVO=" + userVO + ", authority=" + authority + "]";
	}
	
	
}
