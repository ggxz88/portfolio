package org.hdcd.controller;

import javax.servlet.http.HttpServletRequest;

import org.hdcd.domain.Member;
import org.hdcd.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/user")
public class MemberController {
	
	private final MemberService service;
	
	private final PasswordEncoder passwordEncoder;

	@Autowired
	public MemberController(MemberService service, PasswordEncoder passwordEncoder) {
		this.service = service;
		this.passwordEncoder = passwordEncoder;
	}
	
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public void registerForm(Member member, Model model) throws Exception {
		
	}
	
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(@Validated Member member, BindingResult result, Model model, RedirectAttributes rttr) throws Exception {
		if(result.hasErrors()) {
			
			return "user/register";
		}
		
		String inputPassword = member.getUserPw();
		member.setUserPw(passwordEncoder.encode(inputPassword));
		
		service.register(member);
		
		rttr.addFlashAttribute("userName", member.getUserName());
		return "redirect:/user/registerSuccess";
	}
	
	@RequestMapping(value = "registerSuccess", method = RequestMethod.GET)
	public void registerSuccess(Model model) throws Exception {
		
	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void list(Model model) throws Exception {
		model.addAttribute("list", service.list());
	}
	
	@RequestMapping(value = "read", method = RequestMethod.GET)
	public void read(String userId, Model model) throws Exception {
		model.addAttribute(service.read(userId));
	}

	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public void modifyForm(String userId, Model model) throws Exception {
		model.addAttribute(service.read(userId));
	}
	
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modify(Member member, RedirectAttributes rttr) throws Exception {
		service.modify(member);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/user/list";
	}
	
	@RequestMapping(value = "remove", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String remove(String userId, RedirectAttributes rttr) throws Exception {
		service.remove(userId);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/user/list";
	}
	
	@RequestMapping(value = "setup", method = RequestMethod.GET)
	public String setupAdminForm(Member member, Model model) throws Exception {
		if(service.countAll() == 0) {
			return "user/setup";
		}
		
		return "user/setupFailure";
	}
	
	@RequestMapping(value = "setup", method = RequestMethod.POST)
	public String setupAdmin(Member member, RedirectAttributes rttr) throws Exception {
		if(service.countAll() == 0) {
			String inputPassword = member.getUserPw();
			member.setUserPw(passwordEncoder.encode(inputPassword));
			
			service.setupAdmin(member);
			
			rttr.addFlashAttribute("userName", member.getUserName());
			
			return "redirect:/user/registerSuccess";
		}
		
		return "redirect:/user/setupFailure";
	}
	
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public int idChk(HttpServletRequest req) throws Exception {
		
		String userId = req.getParameter("userId");
		Member idChk = service.idChk(userId);
		
		int result = 0;
		
		if(idChk != null) {
			result = 1;
		}
		
		return result;
	}
}