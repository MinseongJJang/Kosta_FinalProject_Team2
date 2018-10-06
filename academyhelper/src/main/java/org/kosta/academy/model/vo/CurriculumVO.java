package org.kosta.academy.model.vo;

public class CurriculumVO {
	private String curNo;
	private String curName;
	private String lecturer;
	private String startDate;
	private String endDate;
	private String limitMem;
	private int price;

	public CurriculumVO() {
		super();
	}

	public CurriculumVO(String curName, String lecturer, String startDate, String endDate, String limitMem, int price) {
		super();
		this.curName = curName;
		this.lecturer = lecturer;
		this.startDate = startDate;
		this.endDate = endDate;
		this.limitMem = limitMem;
		this.price = price;
	}

	public String getCurNo() {
		return curNo;
	}

	public void setCurNo(String curNo) {
		this.curNo = curNo;
	}

	public String getCurName() {
		return curName;
	}

	public void setCurName(String curName) {
		this.curName = curName;
	}

	public String getLecturer() {
		return lecturer;
	}

	public void setLecturer(String lecturer) {
		this.lecturer = lecturer;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getLimitMem() {
		return limitMem;
	}

	public void setLimitMem(String limitMem) {
		this.limitMem = limitMem;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "CurriculumVO [curNo=" + curNo + ", curName=" + curName + ", lecturer=" + lecturer + ", startDate="
				+ startDate + ", endDate=" + endDate + ", limitMem=" + limitMem + ", price=" + price + "]";
	}

}
