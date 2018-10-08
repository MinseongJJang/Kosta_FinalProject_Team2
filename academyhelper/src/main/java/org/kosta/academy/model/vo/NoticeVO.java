package org.kosta.academy.model.vo;

public class NoticeVO {
	private String noticeNo;
	private String noticeTilte;
	private String noticeContent;
	private String noticeRegdate;
	private UserVO userVO;
	public NoticeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeVO(String noticeNo, String noticeTilte, String noticeContent, String noticeRegdate, UserVO userVO) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTilte = noticeTilte;
		this.noticeContent = noticeContent;
		this.noticeRegdate = noticeRegdate;
		this.userVO = userVO;
	}
	public String getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTilte() {
		return noticeTilte;
	}
	public void setNoticeTilte(String noticeTilte) {
		this.noticeTilte = noticeTilte;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticeRegdate() {
		return noticeRegdate;
	}
	public void setNoticeRegdate(String noticeRegdate) {
		this.noticeRegdate = noticeRegdate;
	}
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", noticeTilte=" + noticeTilte + ", noticeContent=" + noticeContent
				+ ", noticeRegdate=" + noticeRegdate + ", userVO=" + userVO + "]";
	}
	
	
}
