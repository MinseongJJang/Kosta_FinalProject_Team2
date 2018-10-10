package org.kosta.academy.model.vo;

public class AcaAttachFile {
	private String acaAttNo;
	private String acaFilepath;
	private AcademyVO academyVO;

	public AcaAttachFile(String acaFilepath, AcademyVO academyVO) {
		super();
		this.acaFilepath = acaFilepath;
		this.academyVO = academyVO;
	}

	public AcaAttachFile() {
		super();
	}

	public String getAcaAttNo() {
		return acaAttNo;
	}

	public void setAcaAttNo(String acaAttNo) {
		this.acaAttNo = acaAttNo;
	}

	public String getAcaFilepath() {
		return acaFilepath;
	}

	public void setAcaFilepath(String acaFilepath) {
		this.acaFilepath = acaFilepath;
	}

	public AcademyVO getAcademyVO() {
		return academyVO;
	}

	public void setAcademyVO(AcademyVO academyVO) {
		this.academyVO = academyVO;
	}

	@Override
	public String toString() {
		return "AcaAttachFile [acaAttNo=" + acaAttNo + ", acaFilepath=" + acaFilepath + ", academyVO=" + academyVO
				+ "]";
	}

}
