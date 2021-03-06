package org.kosta.academy.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.academy.model.service.PagingBean;
import org.kosta.academy.model.vo.AcaAttachFileVO;
import org.kosta.academy.model.vo.AcademyVO;

@Mapper
public interface AcademyMapper {

	void registerAcademy(AcademyVO academyVO);

	List<AcademyVO> listAcademy(PagingBean pagingBean);

	int getTotalListAcaCount();

	AcademyVO detailAcademy(String acaNo);

	void updateAcademy(AcademyVO academyVO);
	void deleteAcademy(String acaNo);
	List<AcademyVO> getAcademyList();
	AcademyVO getAcademyByAcaNo(String acaNo);

	List<AcademyVO> allListAcademy();

	void registerAcademyFile(AcaAttachFileVO acaAttachFileVO);
	void updateAcademyFile(AcaAttachFileVO acaAttachFileVO);
	List<AcaAttachFileVO> acaAttachList(String acaNo);
	
}
