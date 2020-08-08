package org.hdcd.controller;


import java.util.List;

import org.hdcd.common.security.domain.CustomUser;
import org.hdcd.domain.Cart;
import org.hdcd.domain.Member;
import org.hdcd.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	private final CartService service;
	
	@Autowired
	public CartController(CartService service) {
		this.service = service;
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model, Authentication authentication) throws Exception {
		CustomUser customUser = (CustomUser) authentication.getPrincipal();
		Member member = customUser.getMember();
		
		String userId = member.getUserId();
		
		List<Cart> list = service.list(userId);
		
		model.addAttribute("list", list);
		
		int All = service.priceAll(userId);
		
		model.addAttribute("priceall", All);
	}
	
	@RequestMapping(value = "/remove", method = {RequestMethod.POST, RequestMethod.GET})
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public String remove(@RequestParam int cartNo, RedirectAttributes rttr) throws Exception {
		service.remove(cartNo);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/cart/list";
	}
	
	@RequestMapping(value = "/removeall", method = {RequestMethod.POST, RequestMethod.GET})
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public String removeall(RedirectAttributes rttr, Authentication authentication) throws Exception {
		CustomUser customUser = (CustomUser) authentication.getPrincipal();
		Member member = customUser.getMember();
		
		String userId = member.getUserId();
		
		service.removeAll(userId);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/cart/list";
	}
	
}