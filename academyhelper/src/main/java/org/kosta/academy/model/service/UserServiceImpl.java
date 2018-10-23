package org.kosta.academy.model.service;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
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
	public String findId(UserVO userVO) {
		String id = userMapper.findId(userVO);
		id=id.replace(id.substring(id.length()-3, id.length()),"***");
		return id;
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
		String usrPass = passwordEncoder.encode(acaUserVO.getUserVO().getUsrPass());
		acaUserVO.getUserVO().setUsrPass(usrPass);
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

	@Override
	public AcaUserVO getAcaUserInfo(String usrId) {
		return userMapper.getAcaUserInfo(usrId);
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
	public String emailCheck(UserVO userVO) {
		return userMapper.emailCheck(userVO);
	}
	// 이메일 발송
		@Override
		public void send_mail(UserVO userVO, String div) throws Exception {
			// Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com";
			String hostSMTPid = "ksm0799@naver.com";
			String hostSMTPpwd = "qer1356";

			// 보내는 사람 EMail, 제목, 내용
			String fromEmail = "ksm0799@naver.com";
			String fromName = "qer1356";
			String subject = "";
			String msg = "";
			
			if(div.equals("join")) {
				// 회원가입 메일 내용
				subject = "Spring Homepage 회원가입 인증 메일입니다.";
				msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
				msg += "<h3 style='color: blue;'>";
				msg += userVO.getUsrId() + "님 회원가입을 환영합니다.</h3>";
				msg += "<div style='font-size: 130%'>";
				msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
				msg += "<form method='post' action='http://localhost:8081/homepage/member/approval_member.do'>";
				msg += "<input type='hidden' name='email' value='" + userVO.getUsrEmail() + "'>";
				//msg += "<input type='hidden' name='approval_key' value='" + member.getApproval_key() + "'>";
				msg += "<input type='submit' value='인증'></form><br/></div>";
			}else if(div.equals("find_pw")) {
				subject = "Spring Homepage 임시 비밀번호 입니다.";
				msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
				msg += "<h3 style='color: blue;'>";
				msg += userVO.getUsrId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
				msg += "<p>임시 비밀번호 : ";
				msg += userVO.getUsrPass() + "</p></div>";
			}
			// 받는 사람 E-Mail 주소
			String mail = userVO.getUsrEmail();
			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				email.setSSL(true);
				email.setHostName(hostSMTP);
				email.setSmtpPort(587);
				email.setAuthentication(hostSMTPid, hostSMTPpwd);
				email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg(msg);
				email.send();
			} catch (Exception e) {
				System.out.println("메일발송 실패 : " + e);
			}
		}
		@Override
		public void find_pw(HttpServletResponse response,UserVO userVO) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			// 아이디가 없으면
			if(userMapper.check_id(userVO.getUsrId()) == 0) {
				out.print("아이디가 없습니다.");
				out.close();
			}
			// 가입에 사용한 이메일이 아니면
			else if(!userVO.getUsrEmail().equals(userMapper.findEmailById(userVO.getUsrId()))) {
				out.print("잘못된 이메일 입니다.");
				out.close();
			}else {
				// 임시 비밀번호 생성
				String pw = "";
				for (int i = 0; i < 12; i++) {
					pw += (char) ((Math.random() * 26) + 97);
				}
				userVO.setUsrPass(pw);
				// 비밀번호 변경 메일 발송
				send_mail(userVO, "find_pw");
				// 비밀번호 변경
				userVO.setUsrPass(passwordEncoder.encode(pw));

				userMapper.updatePassword(userVO);
				
				out.print("이메일로 임시 비밀번호를 발송하였습니다.");
				out.close();
			}
		}

	@Override
	public String findLoginPass(UserVO userVO) {
		String passwordEn = userMapper.findLoginPass(userVO);
		return passwordEn;
	}
	
	@Override
	public int loginCheck(UserVO userVO) {
		String passwordEn = userMapper.findLoginPass(userVO);
		Boolean check = passwordEncoder.matches(userVO.getUsrPass(), passwordEn);
		System.out.println("check결과"+check);
		if(check==true) {
			userVO.setUsrPass(passwordEn);
			return userMapper.loginCheck(userVO);
		}else {
			return 0;
		}
	}
}
