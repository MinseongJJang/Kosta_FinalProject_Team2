package org.kosta.academy.model.mapper;

import java.util.List;

import org.kosta.academy.model.vo.Authority;
import org.kosta.academy.model.vo.UserVO;

public interface UserMapper {
	public UserVO findUserById(String id);
	public List<Authority> selectAuthorityById(String id);
}
