package org.kosta.academy.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.academy.model.mapper.UserMapper;
import org.kosta.academy.model.vo.AuthoritiesVO;
import org.kosta.academy.model.vo.UserVO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

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
}
