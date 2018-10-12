package org.kosta.academy.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.academy.model.vo.AcademyVO;

@Mapper
public interface AcademyMapper {

	void registerAcademy(AcademyVO academyVO);

	List<AcademyVO> listAcademy();

	int getTotalListAcaCount();
	
}
