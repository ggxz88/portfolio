package org.hdcd.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.hdcd.domain.Banner;
import org.hdcd.domain.UserItem;
import org.hdcd.service.BannerService;
import org.hdcd.service.UserItemService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	private final UserItemService userItemservice;
	private final BannerService bannerService;
	
	@Autowired
	public HomeController(UserItemService userItemservice, BannerService bannerService) {
		this.userItemservice = userItemservice;
		this.bannerService = bannerService;
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(UserItem userItem, Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		int itemId = userItem.getItemId();
		
		List<UserItem> rank = userItemservice.rank(itemId);
		
		model.addAttribute("list", rank);
		
		List<Banner> banner = bannerService.list();
		
		model.addAttribute("banner", banner);
		
		return "home";
	}
	
}
