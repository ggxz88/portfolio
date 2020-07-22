package org.hdcd.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.hdcd.domain.Banner;
import org.hdcd.service.BannerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/banner")
public class BannerController {
	
	private static final Logger logger = LoggerFactory.getLogger(BannerController.class);
	
	private final BannerService service;
	
	@Autowired
	public BannerController(BannerService service) {
		this.service = service;
	}
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void registerForm(Model model) throws Exception {
		logger.info("banner register");
		Banner banner = new Banner();
		
		model.addAttribute(banner);
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String register(Banner banner, RedirectAttributes rttr) throws Exception {
		logger.info("banner register post");
		MultipartFile bannerPicturefile = banner.getBannerPicture();

		String createdbannerPicturefilename = uploadFile(bannerPicturefile.getOriginalFilename(), bannerPicturefile.getBytes());

		banner.setBannerPictureUrl(createdbannerPicturefilename);

		service.register(banner);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/banner/list";
	}
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void list(Model model) throws Exception {
		
		logger.info("banner list");
		
		List<Banner> list = service.list();
		
		model.addAttribute("list", list);
				
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String read(Integer bannerNo, Model model) throws Exception {
		logger.info("banner read");
		
		Banner banner = service.read(bannerNo);
		
		model.addAttribute(banner);
	
		return "/banner/read";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String modifyForm(Integer bannerNo, Model model) throws Exception {
		logger.info("banner modify");
		
		Banner banner = service.read(bannerNo);
		
		model.addAttribute(banner);
		
		return "/banner/modify";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String modify(Banner banner, RedirectAttributes rttr) throws Exception {
		logger.info("banner modify post");
		
		MultipartFile bannerPicturefile = banner.getBannerPicture();

		logger.info("1");
		if (bannerPicturefile != null && bannerPicturefile.getSize() > 0) {
			String createdFilename = uploadFile(bannerPicturefile.getOriginalFilename(), bannerPicturefile.getBytes());
			logger.info("2");
			banner.setBannerPictureUrl(createdFilename);
		}
		logger.info("3");
		service.modify(banner);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/banner/list";
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String removeForm(Integer bannerNo, Model model) throws Exception {
		logger.info("banner remove");

		Banner banner = service.read(bannerNo);
		
		model.addAttribute(banner);
		
		return "/banner/remove";
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String remove(Banner banner, RedirectAttributes rttr) throws Exception {
		logger.info("banner remove post");

		service.remove(banner.getBannerNo());
		logger.info("1");
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/banner/list";
	}
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();
		
		originalName = new String(originalName.getBytes("UTF-8"), "ISO-8859-1");

		String createdFileName = uid.toString() + "_" + originalName;

		File target = new File(uploadPath, createdFileName);

		FileCopyUtils.copy(fileData, target);

		return createdFileName;
	}

	@ResponseBody
	@RequestMapping("/display")
	public ResponseEntity<byte[]> displayFile(Integer bannerNo) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		String fileName = service.getBannerPicture(bannerNo);
		
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

			MediaType mType = getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + File.separator + fileName);

			if (mType != null) {
				headers.setContentType(mType);
			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}
	
	private MediaType getMediaType(String formatName) {
		if(formatName != null) {
			if(formatName.equals("JPG")) {
				return MediaType.IMAGE_JPEG;
			}
			
			if(formatName.equals("GIF")) {
				return MediaType.IMAGE_GIF;
			}
			
			if(formatName.equals("PNG")) {
				return MediaType.IMAGE_PNG;
			}
		}
		
		return null;
	}
	
}