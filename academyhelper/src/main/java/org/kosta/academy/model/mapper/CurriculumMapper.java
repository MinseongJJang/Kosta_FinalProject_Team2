package org.kosta.academy.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.academy.model.service.PagingBean;
import org.kosta.academy.model.vo.CurriculumVO;

@Mapper
public interface CurriculumMapper {
	public void registerCurriculum(CurriculumVO curriculumVO);
	public List<CurriculumVO> listCurriculum(String acaNO,PagingBean pageNo);
	public CurriculumVO detailCurriculum(String curNo);
	public void updateCurriculum(CurriculumVO curriculumVO);
	public void deleteCurriculum(String curNo);
	public int getTotalCurriculumCount();

}
