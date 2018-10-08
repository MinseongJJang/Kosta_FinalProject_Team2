package org.kosta.academy.model.mapper;

import java.util.List;

import org.kosta.academy.model.vo.AcaUserVO;
import org.kosta.academy.model.vo.AuthoritiesVO;
import org.kosta.academy.model.vo.UserVO;

public interface UserMapper {
	public UserVO findUserById(String id);
	public List<AuthoritiesVO> selectAuthorityById(String id);
	public void registerUser(UserVO userVO);
	public void registerUser(AcaUserVO acaUserVO);
	public void updateUser(UserVO userVO);
	public void updateUser(AcaUserVO acaUserVO);
	public void registerAuthorities(AuthoritiesVO authoritiesVO);
}
