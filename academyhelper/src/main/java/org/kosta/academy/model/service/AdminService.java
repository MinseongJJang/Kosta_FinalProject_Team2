package org.kosta.academy.model.service;

import org.kosta.academy.model.vo.AcademyVO;
import org.kosta.academy.model.vo.CurriculumVO;
import org.kosta.academy.model.vo.FAQVO;
import org.kosta.academy.model.vo.NoticeAttachFileVO;
import org.kosta.academy.model.vo.NoticeVO;

public interface AdminService {
	public void registerAcademy(AcademyVO academyVO);
	public void registerCurriculum(CurriculumVO curriculumVO);
	public void registerNotice(NoticeVO noticeVO,NoticeAttachFileVO attachVO);
	public void registerFAQ(FAQVO faqVO);
}
