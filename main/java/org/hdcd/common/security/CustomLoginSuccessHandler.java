package org.hdcd.common.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hdcd.common.domain.LoginLog;
import org.hdcd.common.security.domain.CustomUser;
import org.hdcd.common.service.LoginLogService;
import org.hdcd.common.util.NetUtils;
import org.hdcd.domain.Member;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

public class CustomLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomLoginSuccessHandler.class);

	//로그인 로깅을 처리하는 LoginLogService를 멤버변수로 선언
	private final LoginLogService service;
	
	@Autowired
	public CustomLoginSuccessHandler(LoginLogService service) {
		this.service = service;
	}
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
		
		CustomUser customUser = (CustomUser)authentication.getPrincipal();
		Member member = customUser.getMember();
		
		logger.info("Userid = " + member.getUserId());	
		
		//로그인에 성공한 사용자의 IP정보와 사용자 정보를 로깅 처리
		String remoteAddr = NetUtils.getIp(request);
		
		logger.info("remoteAddr = " + remoteAddr);
		
		LoginLog loginLog = new LoginLog();
		
		loginLog.setUserId(member.getUserId());
		loginLog.setRemoteAddr(remoteAddr);
		
		try {
			service.register(loginLog);
		} catch (Exception e) {
			
		}
		
		super.onAuthenticationSuccess(request, response, authentication);
	}
}