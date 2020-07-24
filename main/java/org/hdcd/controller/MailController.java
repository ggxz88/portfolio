package org.hdcd.controller;

import java.util.Random;

import org.hdcd.common.security.domain.CustomUser;
import org.hdcd.domain.Member;
import org.hdcd.service.MailService;
import org.hdcd.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/email")
public class MailController {
	
	private static final Logger logger = LoggerFactory.getLogger(MailController.class);

	
	private final MemberService memberService;
	private final MailService mailService;
	private final PasswordEncoder passwordEncoder;

	@Autowired
	public MailController(MemberService memberService, MailService mailService, PasswordEncoder passwordEncoder) {
		this.memberService = memberService;
		this.mailService = mailService;
		this.passwordEncoder = passwordEncoder;
	}
	
	//아이디 찾기
	@RequestMapping(value="/id", method = RequestMethod.POST)
	public String sendMailId(@RequestParam String email, RedirectAttributes rttr) throws Exception {
		logger.info("find ID");
		Member member = memberService.findEmail(email);
		logger.info(email);
		logger.info(member.getUserId());
		if(member != null) {
			String subject = "아이디 찾기 안내 메일입니다.";
			StringBuilder sb = new StringBuilder();
			sb.append("귀하의 아이디는 " + member.getUserId() + " 입니다.");
			mailService.send(subject, sb.toString(), "ggxz8810@gmail.com", email, null);
			rttr.addFlashAttribute("msg", "귀하의 이메일 주소로 해당 이메일로 가입된 아이디를 발송하였습니다.");
		} 
		else {
			rttr.addFlashAttribute("msg", "귀하의 이메일로 가입된 아이디가 없습니다.");
		}
		return "redirect:/email/result";
	}
	
	@RequestMapping(value = "/result", method = RequestMethod.GET)
	public String result() throws Exception {
		return "email/result";
	}
	
	@RequestMapping(value="/pass", method = RequestMethod.POST)
	public String sendMailPass(@RequestParam String userId, @RequestParam String email, Authentication authentication, RedirectAttributes rttr) throws Exception {
		logger.info("Find Pw");		
		Member member = memberService.read(userId);
		Member user = memberService.findEmail(email);
		
		if(user != null) {
			if(!member.getUserId().equals(userId)) {
				rttr.addFlashAttribute("msg", "아이디가 일치하지 않습니다.");
				return "redirect:/user/findPass";
			}
			int ran = new Random().nextInt(100000) + 10000; //10000 ~ 99999
			String temppass = String.valueOf(ran);
			member.setUserPw(passwordEncoder.encode(temppass));
			
			memberService.modifyPw(member);
			
			String subject = "임시 비밀번호 발급 안내입니다.";
			StringBuilder sb = new StringBuilder();
			sb.append("귀하의 임시 비밀번호는" + temppass + "입니다.");
			mailService.send(subject, sb.toString(), "ggxz8810@gmail.com", email, null);
			rttr.addFlashAttribute("msg", "귀하의 이메일 주소로 새로운 비밀번호를 발송하였습니다.");
		} else {
			rttr.addFlashAttribute("msg", "귀하의 이메일로 가입된 아이디가 없습니다.");
		}
		
		return "redirect:/email/result";
	}
	
}