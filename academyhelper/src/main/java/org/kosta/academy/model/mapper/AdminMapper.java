package org.kosta.academy.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.academy.model.vo.AcademyVO;
import org.kosta.academy.model.vo.CurriculumVO;
import org.kosta.academy.model.vo.FAQVO;
import org.kosta.academy.model.vo.NoticeAttachFileVO;
import org.kosta.academy.model.vo.NoticeVO;
/**
 * 관리자 권한이 있다면 관리자의
 * 기능을 사용할 수 있다.
 * @author kms
 *
 */
@Mapper
public interface AdminMapper {
	public void registerAcademy(AcademyVO academyVO);
	public void registerCurriculum(CurriculumVO curriculumVO);
	public void registerNotice(NoticeVO noticeVO);
	public void registerNoticeAttach(NoticeAttachFileVO attachVO);
	public void registerFAQ(FAQVO faqVO);
}
