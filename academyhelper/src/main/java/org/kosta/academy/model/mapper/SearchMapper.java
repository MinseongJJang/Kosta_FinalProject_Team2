package org.kosta.academy.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.academy.model.vo.CurriculumVO;
import org.kosta.academy.model.vo.LocationVO;

@Mapper
public interface SearchMapper {
	
	List<LocationVO> provinceList();

	List<LocationVO> districtList(String province);
	
	int getTotalCountByAddress(String address);

	List<CurriculumVO> searchByAddress(Map<String, Object> searchMap);
	
	int getTotalCountByCurName(String curName);

	List<CurriculumVO> searchByCurName(Map<String, Object> searchMap);

	int getTotalCountByKeyword(CurriculumVO curriculumVO);

	List<CurriculumVO> searchByKeyword(Map<String, Object> searchMap);

	int getTotalCountByAcaAddrAndCurName(CurriculumVO curriculumVO);

	List<CurriculumVO> searchByAcaAddrAndCurName(Map<String, Object> searchMap);

	int getTotalCountByAcaAddrAndSearch(CurriculumVO curriculumVO);

	List<CurriculumVO> searchByAcaAddrAndSearch(Map<String, Object> searchMap);

	int getTotalCountByCurNameAndSearch(CurriculumVO curriculumVO);

	List<CurriculumVO> searchByCurNameAndSearch(Map<String, Object> searchMap);

	int getTotalCountByAcaAddrAndCurNameAndSearch(CurriculumVO curriculumVO);

	List<CurriculumVO> searchByAcaAddrAndCurNameAndSearch(Map<String, Object> searchMap);

}
