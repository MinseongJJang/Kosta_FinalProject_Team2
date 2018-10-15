package org.kosta.academy.model.service;

import java.util.HashMap;
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
		int totalListAcaCount = academyMapper.getTotalListAcaCount();
		PagingBean pagingBean = null;
		if(pageNo==null) {
			pagingBean = new PagingBean(totalListAcaCount);
		}else {
			pagingBean = new PagingBean(totalListAcaCount, Integer.parseInt(pageNo));
		}
		List<AcademyVO> academyList = academyMapper.listAcademy(pagingBean);
		ListVO lvo = new ListVO();
		lvo.setAcademyList(academyList);
		lvo.setPb(pagingBean);
		return lvo;
	}

	@Override
	public AcademyVO detailAcademy(String acaNo) {
		AcademyVO avo = academyMapper.detailAcademy(acaNo);
		return avo;
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
	public ListVO listCurriculum(HashMap<String,Object> map) {
		int totalCurCount = curriculumMapper.getTotalCurriculumCount();
		PagingBean pagingBean = new PagingBean(totalCurCount);
		map.put("acaNo", "1");
		map.put("start", pagingBean.getStartRowNumber());
		map.put("end", pagingBean.getEndRowNumber());
		map.put("pageNo", pagingBean.getNowPage());
		
		/*String pageno=(String) map.get("pageNo");
		if(pageno==null) {
			pagingBean = new PagingBean(totalCurCount);
		}else {
			pagingBean = new PagingBean(totalCurCount, Integer.parseInt(pageno));
		}*/
		List<CurriculumVO> curriculumList = curriculumMapper.listCurriculum(map);
		ListVO lvo = new ListVO();
		lvo.setCurriculumList(curriculumList);
		lvo.setPb(pagingBean);
		return lvo;
	}

	@Override
	public CurriculumVO detailCurriculum(String curNo) {
		CurriculumVO detailCurriculum = curriculumMapper.detailCurriculum(curNo);
		return detailCurriculum;
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