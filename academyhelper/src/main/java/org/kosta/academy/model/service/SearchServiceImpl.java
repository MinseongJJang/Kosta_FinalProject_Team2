package org.kosta.academy.model.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.academy.model.mapper.CurriculumMapper;
import org.kosta.academy.model.mapper.SearchMapper;
import org.kosta.academy.model.vo.CurriculumVO;
import org.kosta.academy.model.vo.HashTagVO;
import org.kosta.academy.model.vo.ListVO;
import org.kosta.academy.model.vo.LocationVO;
import org.springframework.stereotype.Service;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Resource
	private CurriculumMapper curriculumMapper;
	@Resource
	private SearchMapper searchMapper;

	
	@Override
	public ListVO academySearch(CurriculumVO curriculumVO, String pageNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalCurCount = searchMapper.getTotalListAcaCount(curriculumVO);
		PagingBean pagingBean = null;
		if (pageNo == null) {
			pagingBean = new PagingBean(totalCurCount);
			map.put("curName", curriculumVO.getCurName());
			map.put("curContent", curriculumVO.getCurContent());
			map.put("acaAddr", curriculumVO.getAcademyVO().getAcaAddr());
			map.put("startRowNumber", pagingBean.getStartRowNumber());
			map.put("endRowNumber", pagingBean.getEndRowNumber());
		} else {
			pagingBean = new PagingBean(totalCurCount, Integer.parseInt(pageNo));
			map.put("curName", curriculumVO.getCurName());
			map.put("curContent", curriculumVO.getCurContent());
			map.put("acaAddr", curriculumVO.getAcademyVO().getAcaAddr());
			map.put("startRowNumber", pagingBean.getStartRowNumber());
			map.put("endRowNumber", pagingBean.getEndRowNumber());
			map.put("pageNo", pagingBean.getNowPage());
		}
		List<CurriculumVO> searchAcademyList = searchMapper.academySearch(map);
		ListVO lvo = new ListVO();
		lvo.setCurriculumList(searchAcademyList);
		lvo.setPb(pagingBean);
		return lvo;
	}
	
	@Override
	public ListVO provinceList() {
		List<LocationVO> list = searchMapper.provinceList();
		ListVO locationList = new ListVO();
		locationList.setLocationList(list);
		return locationList;
	}
	@Override
	public ListVO districtList(String province) {
		List<LocationVO> list = searchMapper.districtList(province);
		ListVO locationList = new ListVO();
		locationList.setLocationList(list);
		return locationList;
	}
	
	@Override
	public ListVO academyHashSearch(HashTagVO hashTagVO, String pageNo) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public ListVO locationAndCurName(CurriculumVO curriculumVO, String pageNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalCurCount = searchMapper.getTotalListAcaCount(curriculumVO);
		PagingBean pagingBean = null;
		if (pageNo == null) {
			pagingBean = new PagingBean(totalCurCount);
			map.put("curName", curriculumVO.getCurName());
			map.put("curContent", curriculumVO.getCurContent());
			map.put("academyVO.acaAddr", curriculumVO.getAcademyVO().getAcaAddr());
			map.put("startRowNumber", pagingBean.getStartRowNumber());
			map.put("endRowNumber", pagingBean.getEndRowNumber());
		} else {
			pagingBean = new PagingBean(totalCurCount, Integer.parseInt(pageNo));
			map.put("curName", curriculumVO.getCurName());
			map.put("curContent", curriculumVO.getCurContent());
			map.put("academyVO.acaAddr", curriculumVO.getAcademyVO().getAcaAddr());
			map.put("startRowNumber", pagingBean.getStartRowNumber());
			map.put("endRowNumber", pagingBean.getEndRowNumber());
			map.put("pageNo", pagingBean.getNowPage());
		}
		List<CurriculumVO> searchAcademyList = searchMapper.locationAndCurName(map);
		ListVO lvo = new ListVO();
		lvo.setCurriculumList(searchAcademyList);
		lvo.setPb(pagingBean);
		return lvo;
	}
	@Override
	public ListVO locationAndSearch(CurriculumVO curriculumVO, String pageNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalCurCount = searchMapper.getTotalListAcaCount(curriculumVO);
		PagingBean pagingBean = null;
		if (pageNo == null) {
			pagingBean = new PagingBean(totalCurCount);
			map.put("curName", curriculumVO.getCurName());
			map.put("curContent", curriculumVO.getCurContent());
			map.put("academyVO.acaAddr", curriculumVO.getAcademyVO().getAcaAddr());
			map.put("startRowNumber", pagingBean.getStartRowNumber());
			map.put("endRowNumber", pagingBean.getEndRowNumber());
		} else {
			pagingBean = new PagingBean(totalCurCount, Integer.parseInt(pageNo));
			map.put("curName", curriculumVO.getCurName());
			map.put("curContent", curriculumVO.getCurContent());
			map.put("academyVO.acaAddr", curriculumVO.getAcademyVO().getAcaAddr());
			map.put("startRowNumber", pagingBean.getStartRowNumber());
			map.put("endRowNumber", pagingBean.getEndRowNumber());
			map.put("pageNo", pagingBean.getNowPage());
		}
		List<CurriculumVO> searchAcademyList = searchMapper.locationAndSearch(map);
		ListVO lvo = new ListVO();
		lvo.setCurriculumList(searchAcademyList);
		lvo.setPb(pagingBean);
		return lvo;
	}
	@Override
	public ListVO curNameAndSearch(CurriculumVO curriculumVO, String pageNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalCurCount = searchMapper.getTotalListAcaCount(curriculumVO);
		PagingBean pagingBean = null;
		if (pageNo == null) {
			pagingBean = new PagingBean(totalCurCount);
			map.put("curName", curriculumVO.getCurName());
			map.put("curContent", curriculumVO.getCurContent());
			map.put("academyVO.acaAddr", curriculumVO.getAcademyVO().getAcaAddr());
			map.put("startRowNumber", pagingBean.getStartRowNumber());
			map.put("endRowNumber", pagingBean.getEndRowNumber());
		} else {
			pagingBean = new PagingBean(totalCurCount, Integer.parseInt(pageNo));
			map.put("curName", curriculumVO.getCurName());
			map.put("curContent", curriculumVO.getCurContent());
			map.put("academyVO.acaAddr", curriculumVO.getAcademyVO().getAcaAddr());
			map.put("startRowNumber", pagingBean.getStartRowNumber());
			map.put("endRowNumber", pagingBean.getEndRowNumber());
			map.put("pageNo", pagingBean.getNowPage());
		}
		List<CurriculumVO> searchAcademyList = searchMapper.curNameAndSearch(map);
		ListVO lvo = new ListVO();
		lvo.setCurriculumList(searchAcademyList);
		lvo.setPb(pagingBean);
		return lvo;
	}
	@Override
	public ListVO locationAndCurNameAndSearch(CurriculumVO curriculumVO, String pageNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalCurCount = searchMapper.getTotalListAcaCount(curriculumVO);
		PagingBean pagingBean = null;
		if (pageNo == null) {
			pagingBean = new PagingBean(totalCurCount);
			map.put("curName", curriculumVO.getCurName());
			map.put("curContent", curriculumVO.getCurContent());
			map.put("academyVO.acaAddr", curriculumVO.getAcademyVO().getAcaAddr());
			map.put("startRowNumber", pagingBean.getStartRowNumber());
			map.put("endRowNumber", pagingBean.getEndRowNumber());
		} else {
			pagingBean = new PagingBean(totalCurCount, Integer.parseInt(pageNo));
			map.put("curName", curriculumVO.getCurName());
			map.put("curContent", curriculumVO.getCurContent());
			map.put("academyVO.acaAddr", curriculumVO.getAcademyVO().getAcaAddr());
			map.put("startRowNumber", pagingBean.getStartRowNumber());
			map.put("endRowNumber", pagingBean.getEndRowNumber());
			map.put("pageNo", pagingBean.getNowPage());
		}
		List<CurriculumVO> searchAcademyList = searchMapper.locationAndCurNameAndSearch(map);
		ListVO lvo = new ListVO();
		lvo.setCurriculumList(searchAcademyList);
		lvo.setPb(pagingBean);
		return lvo;
	}
}
