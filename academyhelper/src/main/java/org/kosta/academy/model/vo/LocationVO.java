package org.kosta.academy.model.vo;

public class LocationVO {
	private String province;
	private String district;
	public LocationVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LocationVO(String province, String district) {
		super();
		this.province = province;
		this.district = district;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	@Override
	public String toString() {
		return "LocationVO [province=" + province + ", district=" + district + "]";
	}
	
}
