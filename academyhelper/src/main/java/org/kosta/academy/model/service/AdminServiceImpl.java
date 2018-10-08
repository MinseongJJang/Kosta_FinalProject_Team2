package org.kosta.academy.model.service;

import javax.annotation.Resource;

import org.kosta.academy.model.mapper.AdminMapper;
import org.kosta.academy.model.vo.AcademyVO;
import org.kosta.academy.model.vo.CurriculumVO;
import org.kosta.academy.model.vo.FAQVO;
import org.kosta.academy.model.vo.NoticeAttachFileVO;
import org.kosta.academy.model.vo.NoticeVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AdminServiceImpl implements AdminService{
	@Resource
	private AdminMapper adminMapper;

	@Override
	public void registerAcademy(AcademyVO academyVO) {
		adminMapper.registerAcademy(academyVO);
	}

	@Override
	public void registerCurriculum(CurriculumVO curriculumVO) {
		adminMapper.registerCurriculum(curriculumVO);
	}
	@Transactional
	@Override
	public void registerNotice(NoticeVO noticeVO,NoticeAttachFileVO attachVO) {
		adminMapper.registerNotice(noticeVO);
		adminMapper.registerNoticeAttach(attachVO);
	}

	@Override
	public void registerFAQ(FAQVO faqVO) {
		
	}
	
}
