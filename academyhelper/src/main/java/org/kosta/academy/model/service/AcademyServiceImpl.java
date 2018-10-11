package org.kosta.academy.model.service;

import org.kosta.academy.model.vo.AcademyVO;
import org.kosta.academy.model.vo.CurriculumVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.stereotype.Service;

@Service
public class AcademyServiceImpl implements AcademyService {

	@Override
	public void registerAcademy(AcademyVO academyVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ListVO listAcademy(String pageNo) {
		// TODO Auto-generated method stub
		return null;
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
		// TODO Auto-generated method stub
		
	}

	@Override
	public ListVO listCurriculum(String acaNo, String pageNo) {
		// TODO Auto-generated method stub
		return null;
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

}
