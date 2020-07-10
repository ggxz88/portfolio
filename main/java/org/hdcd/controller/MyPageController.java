package org.hdcd.controller;

import org.hdcd.common.security.domain.CustomUser;
import org.hdcd.domain.Member;
import org.hdcd.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin() {
		return "mypage/admin";
	}
	
	@RequestMapping(value = "/my", method = RequestMethod.GET)
	public void my(Model model, Authentication authentication) throws Exception {
		CustomUser customUser = (CustomUser) authentication.getPrincipal();
		Member member = customUser.getMember();

		String userId = member.getUserId();
		
		model.addAttribute("mycoin", service.getCoin(userId));
	}
}