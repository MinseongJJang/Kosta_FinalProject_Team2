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
	public UserVO findUserById(String usrId) {
		return userMapper.findUserById(usrId);
	}

	@Override
	public List<AuthoritiesVO> selectAuthorityById(String usrId) {
		return userMapper.selectAuthorityById(usrId);
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
		userMapper.registerUser(acaUserVO.getUserVO());
		userMapper.registerAcaUser(acaUserVO);
		//학원회원등록이므로 ROLE_USER , ROLE_ACADEMY 권한부여
		List<AuthoritiesVO> authoritiesList = new ArrayList<AuthoritiesVO>();
		authoritiesList.add(new AuthoritiesVO(acaUserVO.getUserVO(), "ROLE_USER"));
		authoritiesList.add(new AuthoritiesVO(acaUserVO.getUserVO(), "ROLE_ACADEMY"));
		for(int i=0; i<authoritiesList.size(); i++) {
			userMapper.registerAuthorities(authoritiesList.get(i));
		}
	}

	@Override
	public String idcheck(String usrId) {
		int count = userMapper.idcheck(usrId);
		return (count == 0) ? "ok" : "fail";
	}

	@Override
	public void updateUser(UserVO userVO) {
		String usrPass = passwordEncoder.encode(userVO.getUsrPass());
		userVO.setUsrPass(usrPass);
		userMapper.updateUser(userVO);		
	}

	@Override
	public void updateUser(AcaUserVO acaUserVO) {
		userMapper.updateUser(acaUserVO);
	}

	@Override
	public void deleteUser(String usrId) {
		userMapper.deleteUser(usrId);
	}

	@Override
	public UserVO getUserInfo(String usrId) {
		return userMapper.getUserInfo(usrId);
	}
	
	public ListVO userList(){				
		return userList("1");
	}
	@Override
	public ListVO userList(String pageNo) {
		int totalCount=userMapper.getTotalUserCount();
		PagingBean pagingBean=null;
		if(pageNo==null)
			pagingBean=new PagingBean(totalCount);
		else
			pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));		
		ListVO vo=new ListVO();
		vo.setUserList(userMapper.userList(pagingBean));
		vo.setPb(pagingBean);
		return vo;
	}

	@Override
	public String findUserIdByNameAndTel(UserVO userVO) {
		return userMapper.findUserIdByNameAndTel(userVO);
	}

	@Override
	public String findUserPasswordByIdAndEmail(UserVO userVO) {
		return userMapper.findUserPasswordByIdAndEmail(userVO);
	}

	
}
