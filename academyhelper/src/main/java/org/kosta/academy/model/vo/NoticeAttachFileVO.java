package org.kosta.academy.model.vo;

public class NoticeAttachFileVO {
	private String noticeAttNo;
	private String noticeFilepath;
	private NoticeVO noticeVO;
	public NoticeAttachFileVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeAttachFileVO(String noticeAttNo, String noticeFilepath, NoticeVO noticeVO) {
		super();
		this.noticeAttNo = noticeAttNo;
		this.noticeFilepath = noticeFilepath;
		this.noticeVO = noticeVO;
	}
	public String getNoticeAttNo() {
		return noticeAttNo;
	}
	public void setNoticeAttNo(String noticeAttNo) {
		this.noticeAttNo = noticeAttNo;
	}
	public String getNoticeFilepath() {
		return noticeFilepath;
	}
	public void setNoticeFilepath(String noticeFilepath) {
		this.noticeFilepath = noticeFilepath;
	}
	public NoticeVO getNoticeVO() {
		return noticeVO;
	}
	public void setNoticeVO(NoticeVO noticeVO) {
		this.noticeVO = noticeVO;
	}
	@Override
	public String toString() {
		return "NoticeAttachFileVO [noticeAttNo=" + noticeAttNo + ", noticeFilepath=" + noticeFilepath + ", noticeVO="
				+ noticeVO + "]";
	}
	
	
}
