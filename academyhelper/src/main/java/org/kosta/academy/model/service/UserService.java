package org.kosta.academy.model.service;

import java.util.List;

import org.kosta.academy.model.vo.AuthoritiesVO;
import org.kosta.academy.model.vo.UserVO;

public interface UserService {
	public UserVO findUserById(String id);
	public List<AuthoritiesVO> selectAuthorityById(String id);
}
