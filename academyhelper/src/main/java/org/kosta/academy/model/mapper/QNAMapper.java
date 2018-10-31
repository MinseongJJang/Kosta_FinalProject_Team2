package org.kosta.academy.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.academy.model.service.PagingBean;
import org.kosta.academy.model.vo.AcaQNAVO;
import org.kosta.academy.model.vo.AcaQNQAttachFileVO;

@Mapper
public interface QNAMapper {
	public int getTotalQNACount();
	public List<AcaQNAVO> listAcaQNA(PagingBean pagingBean);
	public AcaQNAVO detailAcaQNA(String qnaNO);
	public void deleteAcaQNA(String qnaNO);
	public void updateAcaQNA(AcaQNAVO acaQNAVO);
	public void registerAcaQNA(AcaQNAVO acaQnaVO);
	public void registerAcaQNAFile(AcaQNQAttachFileVO acaQnaAttachFileVO);
	public void registerAcaQnaAttach(AcaQNQAttachFileVO acaQnaAttachFileVO);
}
