package org.kosta.academy.model.service;

import java.util.List;

import org.kosta.academy.model.vo.AcaUserVO;
import org.kosta.academy.model.vo.AuthoritiesVO;
import org.kosta.academy.model.vo.UserVO;
/**
 * ROLE_USER , ROLE_ACADEMY 권한을 가지고 있는 회원들의
 * 행위를 담당하는 Interface
 * @author kms
 *
 */
public interface UserService {
	/**
	 * 로그인 할 때 사용되는 메소드
	 * @param id
	 * @return
	 */
	public UserVO findUserById(String id);
	/**
	 * 회원 권한을 확인하는 메소드
	 * @param id
	 * @return
	 */
	public List<AuthoritiesVO> selectAuthorityById(String id);
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
}
