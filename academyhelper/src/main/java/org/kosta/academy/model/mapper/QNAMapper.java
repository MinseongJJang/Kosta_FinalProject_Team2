package org.kosta.academy.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.academy.model.service.PagingBean;
import org.kosta.academy.model.vo.AcaQNAVO;

@Mapper
public interface QNAMapper {
	public int getTotalQNACount();
	public List<AcaQNAVO> listAcaQNA(PagingBean pagingBean);
}
