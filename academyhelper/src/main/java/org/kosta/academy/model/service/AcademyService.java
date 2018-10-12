package org.kosta.academy.model.service;

import org.kosta.academy.model.vo.AcademyVO;
import org.kosta.academy.model.vo.CurriculumVO;
import org.kosta.academy.model.vo.ListVO;

/**
 * Academy 및 Curriculum에 대한
 * 기능을 정의해 놓은 Service
 * @author kms
 *
 */
public interface AcademyService {
	/**
	 * 교육기관 정보를 등록하는 메소드
	 * 파일첨부도 함께 처리한다
	 * @param academyVO
	 */
	public void registerAcademy(AcademyVO academyVO);
	/**
	 * 교육기관 정보 목록을 불러오는 메소드
	 * 페이징빈을 인자값으로 받아와 페이지 정보를 불러온다
	 * @param pageNo
	 * @return
	 */
	public ListVO listAcademy(String pageNo);
	/**
	 * 교육기관 상세정보를 불러오는 메소드
	 * @param usrId
	 * @return
	 */
	public AcademyVO detailAcademy(String usrId);
	/**
	 * 교육기관 정보를 수정하는 메소드
	 * @param academyVO
	 */
	public void updateAcademy(AcademyVO academyVO);
	/**
	 * 교육기관 정보를 삭제하는 메소드
	 * @param academyVO
	 */
	public void deleteAcademy(String acaNo);
	/**
	 * 교육과정을 등록하는 메소드
	 * @param curriculumVO
	 */
	public void registerCurriculum(CurriculumVO curriculumVO);
	/**
	 * 인자값으로 받아온 학원 acaNo의 
	 * 교육과정 목록을  불러오는 메소드
	 * @param acaNo
	 * @param pageNo
	 * @return
	 */
	public ListVO listCurriculum(String acaNo,String pageNo);
	/**
	 * 교육과정 상세정보를 불러오는 메소드
	 * @param curNo
	 * @return
	 */
	public CurriculumVO detailCurriculum(String curNo);
	/**
	 * 교육과정 정보를 수정하는 메소드
	 * @param curriculumVO
	 */
	public void updateCurriculum(CurriculumVO curriculumVO);
	/**
	 * 인자값 curNo에 해당하는 교육과정을 삭제하는 메소드
	 * @param curNo
	 */
	public void deleteCurriculum(String curNo);
	
	public int getTotalListAcaCount();
}
