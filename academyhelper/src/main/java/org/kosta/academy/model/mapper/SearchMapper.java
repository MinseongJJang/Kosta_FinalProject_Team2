package org.kosta.academy.model.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.academy.model.vo.CurriculumVO;
import org.kosta.academy.model.vo.LocationVO;

@Mapper
public interface SearchMapper {
	
	int getTotalListAcaCount(CurriculumVO curriculumVO);

	List<CurriculumVO> academySearch(HashMap<String, Object> map);

	List<LocationVO> provinceList();

	List<LocationVO> districtList(String province);

	List<CurriculumVO> locationAndCurName(HashMap<String, Object> map);

	List<CurriculumVO> locationAndSearch(HashMap<String, Object> map);
	
	List<CurriculumVO> curNameAndSearch(HashMap<String, Object> map);

	List<CurriculumVO> locationAndCurNameAndSearch(HashMap<String, Object> map);

}
