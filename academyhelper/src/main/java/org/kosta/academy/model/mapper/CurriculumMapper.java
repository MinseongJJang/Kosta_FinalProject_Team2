package org.kosta.academy.model.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.academy.model.service.PagingBean;
import org.kosta.academy.model.vo.CurriculumVO;

@Mapper
public interface CurriculumMapper {
	public void registerCurriculum(CurriculumVO curriculumVO);
	public List<CurriculumVO> listCurriculum(HashMap<String,Object> map);
	public List<CurriculumVO> listAllCurriculum(PagingBean pb);
	public CurriculumVO detailCurriculum(String curNo);
	public void updateCurriculum(CurriculumVO curriculumVO);
	public void deleteCurriculum(String curNo);
	public int getTotalCurriculumCount();

}
