package org.kosta.academy.model.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.academy.model.mapper.AcademyMapper;
import org.kosta.academy.model.mapper.CurriculumMapper;
import org.kosta.academy.model.vo.AcademyVO;
import org.kosta.academy.model.vo.CurriculumAttachFileVO;
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
		int totalListAcaCount = academyMapper.getTotalListAcaCount();
		PagingBean pagingBean = null;
		if (pageNo == null) {
			pagingBean = new PagingBean(totalListAcaCount);
		} else {
			pagingBean = new PagingBean(totalListAcaCount, Integer.parseInt(pageNo));
		}
		List<AcademyVO> academyList = academyMapper.listAcademy(pagingBean);
		ListVO lvo = new ListVO();
		lvo.setAcademyList(academyList);
		lvo.setPb(pagingBean);
		return lvo;
	}

	@Override
	public ListVO allListAcademy() {
		List<AcademyVO> academyList = academyMapper.allListAcademy();
		ListVO lvo = new ListVO();
		lvo.setAcademyList(academyList);
		return lvo;
	}
	
	@Override
	public AcademyVO detailAcademy(String acaNo) {
		return academyMapper.detailAcademy(acaNo);
	}

	@Override
	public void updateAcademy(AcademyVO academyVO) {
		academyMapper.updateAcademy(academyVO);

	}

	@Override
	public void deleteAcademy(String acaNo) {
		academyMapper.deleteAcademy(acaNo);

	}

	@Override
	public void registerCurriculum(CurriculumVO curriculumVO) {
		curriculumMapper.registerCurriculum(curriculumVO);

	}

	@Override
	public ListVO listCurriculum(String acaNo, String pageNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalCurCount = curriculumMapper.getTotalCurriculumCount(acaNo);
		PagingBean pagingBean = null;
		if (pageNo == null) {
			pagingBean = new PagingBean(totalCurCount);
			map.put("acaNo", acaNo);
			map.put("start", pagingBean.getStartRowNumber());
			map.put("end", pagingBean.getEndRowNumber());
		} else {
			pagingBean = new PagingBean(totalCurCount, Integer.parseInt(pageNo));
			map.put("acaNo", acaNo);
			map.put("start", pagingBean.getStartRowNumber());
			map.put("end", pagingBean.getEndRowNumber());
			map.put("pageNo", pagingBean.getNowPage());
		}
		List<CurriculumVO> curriculumList = curriculumMapper.listCurriculum(map);
		ListVO lvo = new ListVO();
		lvo.setCurriculumList(curriculumList);
		lvo.setPb(pagingBean);
		return lvo;
	}
	@Override
	public ListVO allListCurriculum(String acaNo) {
		List<CurriculumVO> curriculumList = curriculumMapper.allListCurriculum(acaNo);
		ListVO lvo = new ListVO();
		lvo.setCurriculumList(curriculumList);
		return lvo;
	}
	@Override
	public ListVO listCurriculumAsAcademy(String acaNo) {
		List<CurriculumVO> curriculumList = curriculumMapper.listCurriculumAsAcademy(acaNo);
		ListVO lvo = new ListVO();
		lvo.setCurriculumList(curriculumList);
		return lvo;
	}
	@Override
	public CurriculumVO detailCurriculum(String curNo) {
		return curriculumMapper.detailCurriculum(curNo);
	}

	@Override
	public void updateCurriculum(CurriculumVO curriculumVO) {
		curriculumMapper.updateCurriculum(curriculumVO);
	}

	@Override
	public void deleteCurriculum(String curNo) {
		curriculumMapper.deleteCurriculum(curNo);
	}

	@Override
	public List<AcademyVO> getAcademyList() {
		List<AcademyVO> academyList = academyMapper.getAcademyList();
		return academyList;
	}

	@Override
	public List<CurriculumVO> getCurriculumList(String acaNo) {
		List<CurriculumVO> curriculumList = curriculumMapper.getCurriculumList(acaNo);
		return curriculumList;
	}

	@Override
	public void registerCurriculumAttach(CurriculumAttachFileVO curriculumAttachFileVO) {
		curriculumMapper.registerCurriculumFile(curriculumAttachFileVO);
	}
	

}