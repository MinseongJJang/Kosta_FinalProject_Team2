package org.kosta.academy.model.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.academy.model.mapper.AcademyMapper;
import org.kosta.academy.model.mapper.CurriculumMapper;
import org.kosta.academy.model.vo.AcaAttachFileVO;
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
	public void updateAcademy(AcademyVO academyVO, AcaAttachFileVO acaAttachFileVO) {
		academyVO.setAcaContent(academyVO.getAcaContent().replaceAll("!!@@", ""));
		System.out.println(academyVO);
		academyMapper.updateAcademy(academyVO);
		acaAttachFileVO.setAcademyVO(academyVO);
		if(acaAttachFileVO.getAcaFilepath() !=null) {
			academyMapper.updateAcademyFile(acaAttachFileVO);
		}
		

	}

	@Override
	public void deleteAcademy(String acaNo) {
		academyMapper.deleteAcademy(acaNo);

	}

	@Override
	public void registerCurriculum(CurriculumVO curriculumVO, CurriculumAttachFileVO curriculumAttachFileVO) {
		curriculumVO.setCurContent(curriculumVO.getCurContent().replaceAll("!!@@", ""));
		curriculumMapper.registerCurriculum(curriculumVO);
		curriculumAttachFileVO.setCurriculumVO(curriculumVO);
		if(curriculumAttachFileVO.getCurriculumFilepath() !=null) {
			curriculumMapper.registerCurriculumFile(curriculumAttachFileVO);
		}
	}
	@Override
	public void registerAcademy(AcademyVO academyVO, AcaAttachFileVO acaAttachFileVO) {
		academyVO.setAcaMainPic(academyVO.getAcaMainPic().replaceAll("!!@@", ""));
		academyMapper.registerAcademy(academyVO);
		acaAttachFileVO.setAcademyVO(academyVO);
		if(acaAttachFileVO.getAcaFilepath() != null) {
			academyMapper.registerAcademyFile(acaAttachFileVO);
		}
	
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
	public void updateCurriculum(CurriculumVO curriculumVO, CurriculumAttachFileVO curriculumAttachFileVO) {
		curriculumVO.setCurContent(curriculumVO.getCurContent().replaceAll("!!@@", ""));
		curriculumMapper.updateCurriculum(curriculumVO);
		curriculumAttachFileVO.setCurriculumVO(curriculumVO);
		if(curriculumAttachFileVO.getCurriculumFilepath() !=null) {
			curriculumMapper.updateCurriculumFile(curriculumAttachFileVO);
		}
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
	@Override
	public void registerAcademyAttach(AcaAttachFileVO acaAttachFileVO) {
		academyMapper.registerAcademyFile(acaAttachFileVO);
	}

	@Override
	public List<CurriculumVO> bestCurriculumList() {
		return curriculumMapper.bestCurriculumList();
	}
	
}