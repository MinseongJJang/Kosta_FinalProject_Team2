package org.kosta.academy.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.academy.model.mapper.AcademyMapper;
import org.kosta.academy.model.mapper.CurriculumMapper;
import org.kosta.academy.model.vo.AcademyVO;
import org.kosta.academy.model.vo.CurriculumVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.stereotype.Service;

@Service
public class AcademyServiceImpl implements AcademyService {
	@Resource
	private AcademyMapper academyMapper;
	@Resource
	private CurriculumMapper curriculumMapper;

	@Override
	public void registerAcademy(AcademyVO academyVO) {
		academyMapper.registerAcademy(academyVO);
	}

	@Override
	public ListVO listAcademy(String pageNo) {
		List<AcademyVO> academyList = academyMapper.listAcademy();
		ListVO lvo = new ListVO();
		lvo.setAcademyList(academyList);
		return lvo;
	}

	@Override
	public int getTotalListAcaCount() {
		int totalCount = 0;
		totalCount = academyMapper.getTotalListAcaCount();
		return totalCount;
	}

	@Override
	public AcademyVO detailAcademy(String usrId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateAcademy(AcademyVO academyVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteAcademy(String acaNo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void registerCurriculum(CurriculumVO curriculumVO) {
		curriculumMapper.registerCurriculum(curriculumVO);

	}

	@Override
	public ListVO listCurriculum(String acaNo, String pageNo) {
		int totalPostCount = curriculumMapper.getTotalCurriculumCount();
		
		PagingBean pagingBean = new PagingBean(totalPostCount);

	
		List<CurriculumVO> curriculumList = curriculumMapper.listCurriculum(acaNo, pagingBean);
		ListVO lvo = new ListVO();
		lvo.setCurriculumList(curriculumList);
		return lvo;
	}

	@Override
	public CurriculumVO detailCurriculum(String curNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateCurriculum(CurriculumVO curriculumVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteCurriculum(String curNo) {
		// TODO Auto-generated method stub

	}

	@Override
	public int getTotalCurriculumCount() {
		// TODO Auto-generated method stub
		int totalCount = 0;
		totalCount = curriculumMapper.getTotalCurriculumCount();
		return totalCount;

	}
}