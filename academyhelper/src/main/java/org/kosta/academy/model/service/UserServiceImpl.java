package org.kosta.academy.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.academy.model.mapper.UserMapper;
import org.kosta.academy.model.vo.AcaUserVO;
import org.kosta.academy.model.vo.AuthoritiesVO;
import org.kosta.academy.model.vo.ListVO;
import org.kosta.academy.model.vo.UserVO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements UserService{
	@Resource
	private UserMapper userMapper;
	@Resource
	private BCryptPasswordEncoder passwordEncoder;

	@Override
	public UserVO findUserById(String id) {
		return userMapper.findUserById(id);
	}

	@Override
	public List<AuthoritiesVO> selectAuthorityById(String id) {
		return userMapper.selectAuthorityById(id);
	}
	@Transactional
	@Override
	public void registerUser(UserVO userVO) {
		//password는 암호화처리하여 DB에 저장
		String usrPass = passwordEncoder.encode(userVO.getUsrPass());
		userVO.setUsrPass(usrPass);
		userMapper.registerUser(userVO);
		//일반회원등록이므로 ROLE_USER 권한 부여
		AuthoritiesVO authoritiesVO = new AuthoritiesVO(userVO, "ROLE_USER");
		userMapper.registerAuthorities(authoritiesVO);
	}
	@Transactional
	@Override
	public void registerUser(AcaUserVO acaUserVO) {
		String usrPass = passwordEncoder.encode(acaUserVO.getUserVO().getUsrPass());
		acaUserVO.getUserVO().setUsrPass(usrPass);
		userMapper.registerUser(acaUserVO);
		//학원회원등록이므로 ROLE_USER , ROLE_ACADEMY 권한부여
		List<AuthoritiesVO> authoritiesList = new ArrayList<AuthoritiesVO>();
		authoritiesList.add(new AuthoritiesVO(acaUserVO.getUserVO(), "ROLE_USER"));
		authoritiesList.add(new AuthoritiesVO(acaUserVO.getUserVO(), "ROLE_ACADEMY"));
		for(int i=0; i<authoritiesList.size(); i++) {
			userMapper.registerAuthorities(authoritiesList.get(i));
		}
	}

	@Override
	public void updateUser(UserVO userVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateUser(AcaUserVO acaUserVO) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public String findId(UserVO userVO) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public void findPassword(UserVO userVO) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public UserVO getUserInfo(String id) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public ListVO listUser(String pageNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteUser(String usrId) {
		// TODO Auto-generated method stub
		
	}
}
