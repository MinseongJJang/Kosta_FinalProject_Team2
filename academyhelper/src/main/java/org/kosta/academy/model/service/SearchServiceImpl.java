package org.kosta.academy.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.academy.model.mapper.CurriculumMapper;
import org.kosta.academy.model.mapper.SearchMapper;
import org.kosta.academy.model.vo.AcademyVO;
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
		return null;
	}
	
	@Override
	public ListVO search(CurriculumVO curriculumVO, String search, String pageNo) {
		ListVO lvo =  new ListVO();
		PagingBean pb = null;
		Map<String,Object> searchMap = new HashMap<String,Object>();
		int totalCount = 0;
		if(!(curriculumVO.getAcademyVO().getAcaAddr().equals("")) && curriculumVO.getCurName().equals("") && search.equals("")) {
			totalCount = searchMapper.getTotalCountByAddress(curriculumVO.getAcademyVO().getAcaAddr());
			if(pageNo == null) {
				pb = new  PagingBean(totalCount);
			}else {
				pb = new PagingBean(totalCount, Integer.parseInt(pageNo));
			}
			searchMap.put("academyVO.acaAddr",curriculumVO.getAcademyVO().getAcaAddr());
			searchMap.put("STARTROWNUMBER", pb.getStartRowNumber());
			searchMap.put("ENDROWNUMBER", pb.getEndRowNumber());
			List<CurriculumVO> curList = searchMapper.searchByAddress(searchMap);
			System.out.println(curList);
			lvo.setCurriculumList(curList);
			
		}else if(curriculumVO.getAcademyVO().getAcaAddr().equals("") && !(curriculumVO.getCurName().equals("")) && search.equals("")) {
			totalCount = searchMapper.getTotalCountByCurName(curriculumVO.getCurName());
			if(pageNo == null) {
				pb = new  PagingBean(totalCount);
			}else {
				pb = new PagingBean(totalCount, Integer.parseInt(pageNo));
			}
			searchMap.put("curName",curriculumVO.getCurName());
			searchMap.put("STARTROWNUMBER", pb.getStartRowNumber());
			searchMap.put("ENDROWNUMBER", pb.getEndRowNumber());
			List<CurriculumVO> curList = searchMapper.searchByCurName(searchMap);
			lvo.setCurriculumList(curList);
			
		}else if(curriculumVO.getAcademyVO().getAcaAddr().equals("") && curriculumVO.getCurName().equals("") && !(search.equals(""))) {
			AcademyVO academyVO = new AcademyVO();
			academyVO.setAcaAddr(search);
			curriculumVO.setAcademyVO(academyVO);
			curriculumVO.setCurName(search);
			curriculumVO.setCurContent(search);
			totalCount = searchMapper.getTotalCountByKeyword(curriculumVO);
			if(pageNo == null) {
				pb = new  PagingBean(totalCount);
			}else {
				pb = new PagingBean(totalCount, Integer.parseInt(pageNo));
			}
			searchMap.put("acaAddr", search);
			searchMap.put("curName", search);
			searchMap.put("curContent", search);
			searchMap.put("STARTROWNUMBER", pb.getStartRowNumber());
			searchMap.put("ENDROWNUMBER", pb.getEndRowNumber());
			//*******************
			System.out.println("service"+searchMap);
			//*******************
			List<CurriculumVO> curList = searchMapper.searchByKeyword(searchMap);
			lvo.setCurriculumList(curList);
		}else if(curriculumVO.getAcademyVO().getAcaAddr() != null && curriculumVO.getCurName() != null && search == null) {
			
		}else if(curriculumVO.getAcademyVO().getAcaAddr() != null && curriculumVO.getCurName() == null && search != null) {
			
		}else if(curriculumVO.getAcademyVO().getAcaAddr() == null && curriculumVO.getCurName() != null && search != null) {
			
		}else if(curriculumVO.getAcademyVO().getAcaAddr() != null && curriculumVO.getCurName() != null && search != null) {
			
		}else {
			
		}
		lvo.setPb(pb);
		return lvo;
	}
	@Override
	public ListVO academySearch(CurriculumVO curriculumVO, String pageNo) {
		// TODO Auto-generated method stub
		return null;
	}
}
