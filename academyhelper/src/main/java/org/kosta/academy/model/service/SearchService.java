package org.kosta.academy.model.service;

import org.kosta.academy.model.vo.CurriculumVO;
import org.kosta.academy.model.vo.HashTagVO;
import org.kosta.academy.model.vo.ListVO;
import org.springframework.stereotype.Service;

@Service
public interface SearchService {
	/**
	 * 검색조건으로 교육과정 목록을 불러오는 메소드
	 * 페이징빈을 인자값으로 받아와 페이지 정보를 불러온다
	 * @param curriculumVO
	 * @param pageNo
	 * @return
	 */
	public ListVO academySearch(CurriculumVO curriculumVO,String pageNo);
	/**
	 * 학원후기에 달린 해쉬태그를 검색해 그 후기에 대한 
	 * 교육과정 목록을 불러오는 메소드
	 * 페이징빈을 인자값으로 받아와 페이지 정보를 불러온다
	 * @param hashTagVO
	 * @param pageNo
	 * @return
	 */
	public ListVO academyHashSearch(HashTagVO hashTagVO,String pageNo);
}
