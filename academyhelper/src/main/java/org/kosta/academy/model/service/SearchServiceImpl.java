package org.kosta.academy.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
			searchMap.put("ADDRESS",curriculumVO.getAcademyVO().getAcaAddr());
			searchMap.put("STARTROWNUMBER", pb.getStartRowNumber());
			searchMap.put("ENDROWNUMBER", pb.getEndRowNumber());
			List<CurriculumVO> curList = searchMapper.searchByAddress(searchMap);
			lvo.setCurriculumList(curList);
			
		}else if(curriculumVO.getAcademyVO().getAcaAddr().equals("") && !(curriculumVO.getCurName().equals("")) && search.equals("")) {
			totalCount = searchMapper.getTotalCountByCurName(curriculumVO.getCurName());
			if(pageNo == null) {
				pb = new  PagingBean(totalCount);
			}else {
				pb = new PagingBean(totalCount, Integer.parseInt(pageNo));
			}
			System.out.println("check"+curriculumVO);
			searchMap.put("CURNAME",curriculumVO.getCurName());
			searchMap.put("STARTROWNUMBER", pb.getStartRowNumber());
			searchMap.put("ENDROWNUMBER", pb.getEndRowNumber());
			List<CurriculumVO> curList = searchMapper.searchByCurName(searchMap);
			lvo.setCurriculumList(curList);
			System.out.println("test in service"+lvo);
			
		}else if(curriculumVO.getAcademyVO().getAcaAddr().equals("") && curriculumVO.getCurName().equals("") && !(search.equals(""))) {
			//***********************************
			//totalCount = searchMapper.getTotalCountBySearch(curriculumVO.getCurName());
			if(pageNo == null) {
				pb = new  PagingBean(totalCount);
			}else {
				pb = new PagingBean(totalCount, Integer.parseInt(pageNo));
			}
			searchMap.put("ADDRESS",search);
			searchMap.put("CURNAME",search);
			searchMap.put("CONTENT",search);
			searchMap.put("STARTROWNUMBER", pb.getStartRowNumber());
			searchMap.put("ENDROWNUMBER", pb.getEndRowNumber());
			List<CurriculumVO> curList = searchMapper.searchBySearch(searchMap);
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
