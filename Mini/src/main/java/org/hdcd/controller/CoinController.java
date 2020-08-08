package org.hdcd.controller;

import java.util.Locale;

import org.hdcd.common.security.domain.CustomUser;
import org.hdcd.domain.Coin;
import org.hdcd.domain.Member;
import org.hdcd.service.CoinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/coin")
public class CoinController {
	
	private final CoinService service;
	private final MessageSource messageSource;
	
	@Autowired
	public CoinController(CoinService service, MessageSource messageSource) {
		this.service = service;
		this.messageSource = messageSource;
	}
	
	@RequestMapping(value = "/charge", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public void ChargeForm(Model model) throws Exception {
		Coin coin = new Coin();
		coin.setAmount(1000);
		
		model.addAttribute(coin);
	}
	
	@RequestMapping(value = "/charge", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public String charge(int amount, RedirectAttributes rttr, Authentication authentication) throws Exception {
		CustomUser customUser = (CustomUser) authentication.getPrincipal();
		Member member = customUser.getMember();
		
		String userId = member.getUserId();
		
		Coin coin = new Coin();
		coin.setUserId(userId);
		coin.setAmount(amount);
		
		service.charge(coin);
		
		String message = messageSource.getMessage("coin.chargingComplete", null, Locale.KOREAN);
		rttr.addFlashAttribute("msg", message);
		
		return "redirect:/coin/success";
		
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public void list(Model model, Authentication authentication) throws Exception {
		CustomUser customUser = (CustomUser) authentication.getPrincipal();
		Member member = customUser.getMember();
		
		String userId = member.getUserId();
		
		model.addAttribute("list", service.list(userId));
	}
	
	
	@RequestMapping(value = "/success", method = RequestMethod.GET)
	public String success() throws Exception {
		return "coin/success";
	}
	
	//구매내역 보기
	@RequestMapping(value = "/listPay", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public void listPayHistory(Model model, Authentication authentication) throws Exception {
		CustomUser customUser = (CustomUser) authentication.getPrincipal();
		Member member = customUser.getMember();
		
		String userId = member.getUserId();
		
		model.addAttribute("list", service.listPayHistory(userId));
	}
	
	//코인 부족 메시지
	@RequestMapping(value = "/notEnoughCoin", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public void notEnoughCoin(Model model) throws Exception {
		
	}
	
}