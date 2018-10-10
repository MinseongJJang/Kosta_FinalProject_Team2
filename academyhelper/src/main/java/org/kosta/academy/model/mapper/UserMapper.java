package org.kosta.academy.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.academy.model.vo.AcaUserVO;
import org.kosta.academy.model.vo.AuthoritiesVO;
import org.kosta.academy.model.vo.UserVO;
@Mapper
public interface UserMapper {
	public UserVO findUserById(String id);
	public List<AuthoritiesVO> selectAuthorityById(String id);
	public void registerUser(UserVO userVO);
	public void registerUser(AcaUserVO acaUserVO);
	public void checkUser(UserVO userVO);
	public void checkUser(AcaUserVO acaUserVO);
	public void updateUser(UserVO userVO);
	public void updateUser(AcaUserVO acaUserVO);
	public void deleteUser(UserVO userVO);
	public void deleteUser(AcaUserVO acaUserVO);
	public void findId(UserVO userVO);
	public void findId(AcaUserVO acaUserVO);
	public void findPassword(UserVO userVO);
	public void findPassword(AcaUserVO acaUserVO);
	public void getUserInfo(String id);
	public void registerAuthorities(AuthoritiesVO authoritiesVO);
}
