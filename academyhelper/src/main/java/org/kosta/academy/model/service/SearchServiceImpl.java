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
import org.kosta.academy.model.vo.contentVO;
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
		contentVO content = new contentVO();
		ListVO lvo =  new ListVO();
		PagingBean pb = null;
		Map<String,Object> searchMap = new HashMap<String,Object>();
		int totalCount = 0;
		if((!(curriculumVO.getAcademyVO().getAcaAddr().equals("")) || curriculumVO.getAcademyVO().getAcaAddr() != null) && (curriculumVO.getCurName().equals("") || curriculumVO.getCurName() == null) && (search.equals("") || search == null)) {
			totalCount = searchMapper.getTotalCountByAddress(curriculumVO.getAcademyVO().getAcaAddr());
			content.setCurriculumVO(curriculumVO);
			if(pageNo == null) {
				pb = new  PagingBean(totalCount);
			}else {
				pb = new PagingBean(totalCount, Integer.parseInt(pageNo));
			}

			searchMap.put("acaAddr",curriculumVO.getAcademyVO().getAcaAddr());
			searchMap.put("STARTROWNUMBER", pb.getStartRowNumber());
			searchMap.put("ENDROWNUMBER", pb.getEndRowNumber()); 
			//**************************
			System.out.println("byaddress"+searchMap);
			//**************************
			List<CurriculumVO> curList = searchMapper.searchByAddress(searchMap);
			System.out.println(curList);
			lvo.setCurriculumList(curList);
			
		}else if((curriculumVO.getAcademyVO().getAcaAddr().equals("")||curriculumVO.getAcademyVO().getAcaAddr()==null) && (!(curriculumVO.getCurName().equals(""))||curriculumVO.getCurName()!=null) && (search.equals("")||search==null)) {
			totalCount = searchMapper.getTotalCountByCurName(curriculumVO.getCurName());
			content.setCurriculumVO(curriculumVO);
			if(pageNo == null) {
				pb = new  PagingBean(totalCount);
			}else {
				pb = new PagingBean(totalCount, Integer.parseInt(pageNo));
			}
			searchMap.put("curName",curriculumVO.getCurName());
			searchMap.put("STARTROWNUMBER", pb.getStartRowNumber());
			searchMap.put("ENDROWNUMBER", pb.getEndRowNumber());
			//**************************
			System.out.println("bycurname"+searchMap);
			//**************************
			List<CurriculumVO> curList = searchMapper.searchByCurName(searchMap);
			lvo.setCurriculumList(curList);
			
		}else if((curriculumVO.getAcademyVO().getAcaAddr().equals("")||curriculumVO.getAcademyVO().getAcaAddr()==null) && (curriculumVO.getCurName().equals("")||curriculumVO.getCurName()==null) && (!(search.equals(""))||search!=null)) {
			AcademyVO academyVO = new AcademyVO();
			academyVO.setAcaAddr(search);
			curriculumVO.setAcademyVO(academyVO);
			curriculumVO.setCurName(search);
			curriculumVO.setCurContent(search);
			totalCount = searchMapper.getTotalCountByKeyword(curriculumVO);
			content.setSearch(search);
			System.out.println("totalcount : "+totalCount+"pageNo:"+pageNo);
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
			System.out.println("bykeyword"+searchMap);
			//*******************
			List<CurriculumVO> curList = searchMapper.searchByKeyword(searchMap);
			lvo.setCurriculumList(curList);
		}else if((!(curriculumVO.getAcademyVO().getAcaAddr().equals(""))||curriculumVO.getAcademyVO().getAcaAddr()!=null) && (!(curriculumVO.getCurName().equals(""))||curriculumVO.getCurName() != null) && (search.equals("")||search==null)) {
			totalCount = searchMapper.getTotalCountByAcaAddrAndCurName(curriculumVO);
			content.setCurriculumVO(curriculumVO);
			if(pageNo == null) {
				pb = new  PagingBean(totalCount);
			}else {
				pb = new PagingBean(totalCount, Integer.parseInt(pageNo));
			}
			searchMap.put("acaAddr", curriculumVO.getAcademyVO().getAcaAddr());
			searchMap.put("curName", curriculumVO.getCurName());
			searchMap.put("STARTROWNUMBER", pb.getStartRowNumber());
			searchMap.put("ENDROWNUMBER", pb.getEndRowNumber());
			//*******************
			System.out.println("byAcaAddrAndCunName"+searchMap);
			//*******************
			List<CurriculumVO> curList = searchMapper.searchByAcaAddrAndCurName(searchMap);
			lvo.setCurriculumList(curList);
			
		}else if((!(curriculumVO.getAcademyVO().getAcaAddr().equals(""))||curriculumVO.getAcademyVO().getAcaAddr()!=null) && (curriculumVO.getCurName().equals("")||curriculumVO.getCurName()==null) && (!(search.equals(""))||search!=null)) {
			curriculumVO.setCurName(search);
			curriculumVO.setCurContent(search);
			totalCount = searchMapper.getTotalCountByAcaAddrAndSearch(curriculumVO);
			content.setCurriculumVO(curriculumVO);
			content.setSearch(search);
			if(pageNo == null) {
				pb = new  PagingBean(totalCount);
			}else {
				pb = new PagingBean(totalCount, Integer.parseInt(pageNo));
			}
			searchMap.put("acaAddr", curriculumVO.getAcademyVO().getAcaAddr());
			searchMap.put("curName", curriculumVO.getCurName());
			searchMap.put("curContent", curriculumVO.getCurContent());
			searchMap.put("STARTROWNUMBER", pb.getStartRowNumber());
			searchMap.put("ENDROWNUMBER", pb.getEndRowNumber());
			//*******************
			System.out.println("byAcaAddrAndSearch"+searchMap);
			//*******************
			List<CurriculumVO> curList = searchMapper.searchByAcaAddrAndSearch(searchMap);
			lvo.setCurriculumList(curList);
			
		}else if((curriculumVO.getAcademyVO().getAcaAddr().equals("")||curriculumVO.getAcademyVO().getAcaAddr()==null) && (!(curriculumVO.getCurName().equals(""))||curriculumVO.getCurName()!=null) && (!(search.equals(""))||search!=null)) {
			AcademyVO academyVO = new AcademyVO();
			academyVO.setAcaAddr(search);
			curriculumVO.setAcademyVO(academyVO);
			curriculumVO.setCurContent(search);
			totalCount = searchMapper.getTotalCountByCurNameAndSearch(curriculumVO);
			content.setCurriculumVO(curriculumVO);
			content.setSearch(search);
			if(pageNo == null) {
				pb = new  PagingBean(totalCount);
			}else {
				pb = new PagingBean(totalCount, Integer.parseInt(pageNo));
			}
			searchMap.put("acaAddr", curriculumVO.getAcademyVO().getAcaAddr());
			searchMap.put("curName", curriculumVO.getCurName());
			searchMap.put("curContent", search);
			searchMap.put("STARTROWNUMBER", pb.getStartRowNumber());
			searchMap.put("ENDROWNUMBER", pb.getEndRowNumber());
			//*******************
			System.out.println("byCurNameAndSearch"+searchMap);
			//*******************
			List<CurriculumVO> curList = searchMapper.searchByCurNameAndSearch(searchMap);
			lvo.setCurriculumList(curList);
			
		}else if((!(curriculumVO.getAcademyVO().getAcaAddr().equals(""))||curriculumVO.getAcademyVO().getAcaAddr()!=null) && (!(curriculumVO.getCurName().equals(""))||curriculumVO.getCurName()!=null) && (!(search.equals(""))||search!=null)) {
			curriculumVO.setCurContent(search);
			totalCount = searchMapper.getTotalCountByAcaAddrAndCurNameAndSearch(curriculumVO);
			content.setCurriculumVO(curriculumVO);
			content.setSearch(search);
			if(pageNo == null) {
				pb = new  PagingBean(totalCount);
			}else {
				pb = new PagingBean(totalCount, Integer.parseInt(pageNo));
			}
			searchMap.put("acaAddr", curriculumVO.getAcademyVO().getAcaAddr());
			searchMap.put("curName", curriculumVO.getCurName());
			searchMap.put("curContent", search);
			searchMap.put("STARTROWNUMBER", pb.getStartRowNumber());
			searchMap.put("ENDROWNUMBER", pb.getEndRowNumber());
			//*******************
			System.out.println("byAcaAddrAndCurNameAndSearch"+searchMap);
			//*******************
			List<CurriculumVO> curList = searchMapper.searchByAcaAddrAndCurNameAndSearch(searchMap);
			lvo.setCurriculumList(curList);
			
		}else {
			
		}
		lvo.setPb(pb);
		lvo.setContent(content);
		return lvo;
	}

}
