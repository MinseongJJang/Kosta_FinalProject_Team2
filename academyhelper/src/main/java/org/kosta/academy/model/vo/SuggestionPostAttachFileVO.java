package org.kosta.academy.model.vo;

public class SuggestionPostAttachFileVO {
	private String sugPostAttNo;
	private String sugPostFilepath;
	private SuggestionPostVO suggestionPostVO;
	public SuggestionPostAttachFileVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SuggestionPostAttachFileVO(String sugPostAttNo, String sugPostFilepath, SuggestionPostVO suggestionPostVO) {
		super();
		this.sugPostAttNo = sugPostAttNo;
		this.sugPostFilepath = sugPostFilepath;
		this.suggestionPostVO = suggestionPostVO;
	}
	public String getSugPostAttNo() {
		return sugPostAttNo;
	}
	public void setSugPostAttNo(String sugPostAttNo) {
		this.sugPostAttNo = sugPostAttNo;
	}
	public String getSugPostFilepath() {
		return sugPostFilepath;
	}
	public void setSugPostFilepath(String sugPostFilepath) {
		this.sugPostFilepath = sugPostFilepath;
	}
	public SuggestionPostVO getSuggestionPostVO() {
		return suggestionPostVO;
	}
	public void setSuggestionPostVO(SuggestionPostVO suggestionPostVO) {
		this.suggestionPostVO = suggestionPostVO;
	}
	@Override
	public String toString() {
		return "SuggestionPostAttachFileVO [sugPostAttNo=" + sugPostAttNo + ", sugPostFilepath=" + sugPostFilepath
				+ ", suggestionPostVO=" + suggestionPostVO + "]";
	}
	
	
}
