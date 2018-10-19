package org.kosta.academy.model.service;

import java.util.List;

import org.kosta.academy.model.vo.AcaUserVO;
import org.kosta.academy.model.vo.AuthoritiesVO;
import org.kosta.academy.model.vo.ListVO;
import org.kosta.academy.model.vo.UserVO;
import org.springframework.stereotype.Service;
/**
 * ROLE_USER , ROLE_ACADEMY 권한을 가지고 있는 회원들의
 * 행위를 담당하는 Interface
 * @author kms
 *
 */
@Service
public interface UserService {
	/**
	 * 로그인 할 때 사용되는 메소드
	 * @param id
	 * @return
	 */
	public UserVO findUserById(String usrId);
	/**
	 * 회원 권한을 확인하는 메소드
	 * @param id
	 * @return
	 */
	public List<AuthoritiesVO> selectAuthorityById(String usrId);
	/**
	 * 일반 회원가입 시 사용되는 메소드
	 * 가입시 권한도 함께 등록되어야 함
	 * Transaction 처리
	 * @param userVO
	 */
	public void registerUser(UserVO userVO);
	/**
	 * 학원 회원가입 시 사용되는 메소드
	 * 가입시 권한도 함께 등록되어야 함
	 * Transaction 처리(두가지 권한등록)
	 * @param acaUserVO
	 */
	public void registerUser(AcaUserVO acaUserVO);
	/**
	 * 일반 회원정보 수정시 사용되는 메소드
	 * @param userVO
	 */
	public void updateUser(UserVO userVO);
	/**
	 * 학원 회원정보 수정시 사용되는 메소드
	 * @param acaUserVO
	 */
	public void updateUser(AcaUserVO acaUserVO);
	/**
	 * 회원 탈퇴 메서드
	 * enabled를 1에서 0으로 
	 * @param usrId
	 */
	public void deleteUser(String usrId);
	/**
	 * 일반 회원 아이디를 찾는 메소드
	 * @param userVO
	 * @return
	 */
	public String findUserIdByNameAndTel(UserVO userVO);
	/**
	 * 일반 회원 비밀번호를 찾는 메소드
	 * @param userVO
	 */
	public String findUserPasswordByIdAndEmail(UserVO userVO);
	/**
	 * 회원 정보를 조회하는 메소드
	 * @param id
	 * @return 
	 */
	public UserVO getUserInfo(String usrId);
	/**
	 * 학원 회원 정보를 조회하는 메서드
	 * @param usrId
	 * @return
	 */
	
	public AcaUserVO getAcaUserInfo(String usrId);
	/**
	 * 학원 회원 목록을 불러오는 메소드
	 * 페이징빈을 인자값으로 받아와 페이지 정보를 불러온다
	 * @param pageNo
	 * @return
	 */
	public ListVO userList();
	public ListVO userList(String pageNo);
	/**
	 * 아이디 중복 체크하는 메소드
	 * @param usrId
	 * @return
	 */
	public String idcheck(String usrId);
	
	
}
