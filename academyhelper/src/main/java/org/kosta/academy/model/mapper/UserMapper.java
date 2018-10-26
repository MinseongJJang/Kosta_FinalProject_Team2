package org.kosta.academy.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.academy.model.service.PagingBean;
import org.kosta.academy.model.vo.AcaUserVO;
import org.kosta.academy.model.vo.AuthoritiesVO;
import org.kosta.academy.model.vo.UserVO;
@Mapper
public interface UserMapper {
	public UserVO findUserById(String usrId);
	public String findId(UserVO userVO);
	public List<AuthoritiesVO> selectAuthorityById(String usrId);
	public void registerUser(UserVO userVO);
	public void registerAcaUser(AcaUserVO acaUserVO);
	public void checkUser(UserVO userVO);
	public void checkUser(AcaUserVO acaUserVO);
	public void updateUser(UserVO userVO);
	public void deleteUser(String usrId);
	public void updateUser(AcaUserVO acaUserVO);
	public UserVO getUserInfo(String usrId);
	public AcaUserVO getAcaUserInfo(String usrId);
	public void registerAuthorities(AuthoritiesVO authoritiesVO);
	public int idcheck(String usrId);
	public List<UserVO> userList(PagingBean pagingBean);
	public int getTotalUserCount();
	public String emailCheck(UserVO userVO);
	public int check_id(String id);
	public String findEmailById(String id);
	public void updatePassword(UserVO userVO);
	public int loginCheck(UserVO userVO);
	public String findLoginPass(UserVO userVO);
}
