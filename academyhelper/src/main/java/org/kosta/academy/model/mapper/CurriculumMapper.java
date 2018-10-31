package org.kosta.academy.model.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.academy.model.vo.CurriculumAttachFileVO;
import org.kosta.academy.model.vo.CurriculumVO;
import org.kosta.academy.model.vo.SuggestionPostAttachFileVO;

@Mapper
public interface CurriculumMapper {
	public void registerCurriculum(CurriculumVO curriculumVO);
	public List<CurriculumVO> listCurriculum(HashMap<String,Object> map);
	public CurriculumVO detailCurriculum(String curNo);
	public void updateCurriculum(CurriculumVO curriculumVO);
	public void deleteCurriculum(String curNo);
	public int getTotalCurriculumCount(String acaNo);
	public List<CurriculumVO> getCurriculumList(String acaNo);
	public List<CurriculumVO> allListCurriculum(String acaNo);
	public List<CurriculumVO> listCurriculumAsAcademy(String acaNo);
	
	
	void registerCurriculumFile(CurriculumAttachFileVO curriculumAttachFileVO);
	void updateCurriculumFile(CurriculumAttachFileVO curriculumAttachFileVO);
	List<CurriculumAttachFileVO> listCurriculumFile(CurriculumAttachFileVO curriculumAttachFileVO);

}
