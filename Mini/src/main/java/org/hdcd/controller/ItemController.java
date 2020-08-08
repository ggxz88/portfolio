package org.hdcd.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.hdcd.common.domain.PageRequest;
import org.hdcd.common.domain.Pagination;
import org.hdcd.common.security.domain.CustomUser;
import org.hdcd.domain.Item;
import org.hdcd.domain.Member;
import org.hdcd.domain.Review;
import org.hdcd.service.CartService;
import org.hdcd.service.ItemService;
import org.hdcd.service.MemberService;
import org.hdcd.service.ReviewService;
import org.hdcd.service.UserItemService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/item")
public class ItemController {
	
	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);
	
	private final ItemService service;
	private final MemberService memberService;
	private final UserItemService userItemService;
	private final CartService cartService;
	private final ReviewService reviewService;
	private final MessageSource messageSource;
	
	@Autowired
	public ItemController(ItemService service, MemberService memberService, UserItemService userItemService, CartService cartService, ReviewService reviewService, MessageSource messageSource) {
		this.service = service;
		this.memberService = memberService;
		this.userItemService = userItemService;
		this.cartService = cartService;
		this.reviewService = reviewService;
		this.messageSource = messageSource;
	}
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void registerForm(Model model) throws Exception {
		Item item = new Item();
		
		model.addAttribute(item);
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String register(Item item, RedirectAttributes rttr) throws Exception {
		MultipartFile pictureFile = item.getPicture();
		MultipartFile previewFile = item.getPreview();
		
		String createdPictureFilename = uploadFile(pictureFile.getOriginalFilename(), pictureFile.getBytes());
		String createdPreviewFilename = uploadFile(previewFile.getOriginalFilename(), previewFile.getBytes());

		item.setPictureUrl(createdPictureFilename);
		item.setPreviewUrl(createdPreviewFilename);
		
		service.register(item);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/item/list";
	}
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(@ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {
		List<Item> list = service.list(pageRequest);
		
		model.addAttribute("list", list);

		//페이징 네비게이션 정보를 뷰에 전달
		Pagination pagination = new Pagination();
		pagination.setPageRequest(pageRequest);
				
		//페이지 네비게이션 정보에 검색처리된 게시글 건수 저장
		pagination.setTotalCount(service.count(pageRequest));
				
		model.addAttribute("pagination", pagination);
				
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(Integer itemId, @ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {
		Item item = service.read(itemId);
		
		model.addAttribute(item);
		
		List<Review> reviewList = reviewService.list(itemId);
		
		model.addAttribute("reviewList", reviewList);
		
		model.addAttribute("review", new Review());
		
		return "item/read";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void modifyForm(Integer itemId, @ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {
		Item item = service.read(itemId);
		
		model.addAttribute(item);
		
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String modify(Item item, PageRequest pageRequest, RedirectAttributes rttr) throws Exception {
		MultipartFile pictureFile = item.getPicture();

		if (pictureFile != null && pictureFile.getSize() > 0) {
			String createdFilename = uploadFile(pictureFile.getOriginalFilename(), pictureFile.getBytes());

			item.setPictureUrl(createdFilename);
		}

		MultipartFile previewFile = item.getPreview();

		if (previewFile != null && previewFile.getSize() > 0) {
			String createdFilename = uploadFile(previewFile.getOriginalFilename(), previewFile.getBytes());

			item.setPreviewUrl(createdFilename);
		}

		service.modify(item);

		//RedirectAttributes 객체에 일회성 데이터를 지정하여 전달
		rttr.addAttribute("page", pageRequest.getPage());
		rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());
				
		//검색어를 뷰에 전달
		rttr.addAttribute("keyword", pageRequest.getKeyword());

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/item/list";
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String removeForm(Integer itemId, @ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {
		Item item = service.read(itemId);
		
		model.addAttribute(item);
		
		return "item/remove";
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String remove(Item item, PageRequest pageRequest, RedirectAttributes rttr) throws Exception {
		service.remove(item.getItemId());
		
		//RedirectAttributes 객체에 일회성 데이터를 지정하여 전달
		rttr.addAttribute("page", pageRequest.getPage());
		rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());
				
		//검색어를 뷰에 전달
		rttr.addAttribute("keyword", pageRequest.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/item/list";
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
	public ResponseEntity<byte[]> displayFile(Integer itemId) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		String fileName = service.getPreview(itemId);
		
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
	
	@ResponseBody
	@RequestMapping("/download")
	public ResponseEntity<byte[]> downloadFile(Integer itemId, Authentication authentication) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		String fullName = service.getPicture(itemId);

		try {
			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + File.separator + fullName);
			
			String fileName = fullName.substring(fullName.indexOf("_") + 1);

			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		
		return entity;
	}

	//상품 구매
	@RequestMapping(value = "/buy", method = {RequestMethod.POST, RequestMethod.GET})
	public String buy(Integer itemId, RedirectAttributes rttr, Authentication authentication) throws Exception {
		CustomUser customUser = (CustomUser) authentication.getPrincipal();
		Member member = customUser.getMember();
		
		String userId = member.getUserId();
		
		member.setCoin(memberService.getCoin(userId));
		
		Item item = service.read(itemId);
		
		userItemService.register(member, item);
		
		String message = messageSource.getMessage("item.purchaseComplete", null, Locale.KOREAN);
		rttr.addFlashAttribute("msg", message);
		
		return "redirect:/item/success";
	}
	
	// 상품 구매 성공
	@RequestMapping(value = "/success", method = RequestMethod.GET)
	public String success() throws Exception {
		return "item/success";
	}
	
	@RequestMapping(value = "/cartadd", method = RequestMethod.POST)
	public String cartadd(Integer itemId, Integer cartNo, RedirectAttributes rttr, Authentication authentication) throws Exception {
		CustomUser customUser = (CustomUser) authentication.getPrincipal();
		Member member = customUser.getMember();
		
		String userId = member.getUserId();
		
		Item item = service.read(itemId);
		
		//int count = cartService.countItem(service.read(itemId), userId);
		
		
		cartService.register(member, item);
		
		String message = messageSource.getMessage("cart.addComplete", null, Locale.KOREAN);
		
		rttr.addFlashAttribute("msg", message);
		
		return "redirect:/item/cartaddsuccess";
	}
	
	@RequestMapping(value = "/cartaddsuccess", method = RequestMethod.GET)
	public String cartaddsuccess() throws Exception {
		return "item/cartaddsuccess";
	}
	
	@RequestMapping(value = "/reviewregister", method = RequestMethod.POST)
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
	public String replyregister(Review review, int itemId, PageRequest pageRequest, Model model, Authentication authentication, RedirectAttributes rttr) throws Exception {
		CustomUser customUser = (CustomUser)authentication.getPrincipal();
		Member member = customUser.getMember();
		review.setReviewWriter(member.getUserId());
		
		reviewService.register(review);
		
		//RedirectAttributes 객체에 일회성 데이터를 지정하여 전달
		rttr.addAttribute("page", pageRequest.getPage());
		rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());
				
		//검색 유형과 검색어를 뷰에 전달
		rttr.addAttribute("keyword", pageRequest.getKeyword());
		rttr.addAttribute("itemId", itemId);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/item/read";
	}
	
	@RequestMapping(value = "/reviewremove", method = {RequestMethod.GET, RequestMethod.POST})
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
	public String replyremove(Review review, @RequestParam int reviewNo, int itemId, PageRequest pageRequest, Authentication authentication, RedirectAttributes rttr) throws Exception {
		logger.info("review delete");
		
		reviewService.remove(reviewNo);
		
		//RedirectAttributes 객체에 일회성 데이터를 지정하여 전달
		rttr.addAttribute("page", pageRequest.getPage());
		rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());
		
		//검색 유형과 검색어를 뷰에 전달
		rttr.addAttribute("keyword", pageRequest.getKeyword());
		rttr.addAttribute("itemId", itemId);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/item/read";
	}
	
	@RequestMapping(value = "/reviewmodify", method = RequestMethod.GET)
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
	public void replymodifyForm(int reviewNo, @ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {
		logger.info("review modifyform");
		//조회한 게시글 상세정보를 뷰에 전달
		
		Review review = reviewService.read(reviewNo);
		
		logger.info("reviewNo : " + reviewNo);
		
		model.addAttribute(review);
	}
	
	@RequestMapping(value = "/reviewmodify", method = RequestMethod.POST)
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
	public String replymodify(Review review, PageRequest pageRequest, RedirectAttributes rttr) throws Exception {
		logger.info("review modify");
		
		logger.info("수정할 댓글 번호 :" + review.getReviewNo());
		logger.info("수정할 내용 :" + review.getReviewContent());

		reviewService.modify(review);
		
		//RedirectAttributes 객체에 일회성 데이터를 지정하여 전달
		rttr.addAttribute("page", pageRequest.getPage());
		rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());
		
		//검색 유형과 검색어를 뷰에 전달
		rttr.addAttribute("keyword", pageRequest.getKeyword());
		rttr.addAttribute("itemId", review.getItemId());
				
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/item/read";
	}
	
}