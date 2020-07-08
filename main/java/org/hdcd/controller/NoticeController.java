package org.hdcd.controller;

import java.util.ArrayList;
import java.util.List;

import org.hdcd.common.domain.CodeLabelValue;
import org.hdcd.common.domain.PageRequest;
import org.hdcd.common.domain.Pagination;
import org.hdcd.domain.Notice;
import org.hdcd.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	private final NoticeService service;
	
	@Autowired
	public NoticeController(NoticeService service) {
		this.service = service;
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void registerForm(Model model) throws Exception {
		Notice notice = new Notice();
		
		model.addAttribute(notice);
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String register(Notice notice, RedirectAttributes rttr) throws Exception {
		service.register(notice);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/notice/list";
		
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(@ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {
		model.addAttribute("list", service.list(pageRequest));
		
		//페이징 네비게이션 정보를 뷰에 전달
		Pagination pagination = new Pagination();
		pagination.setPageRequest(pageRequest);
				
		//페이지 네비게이션 정보에 검색처리된 게시글 건수 저장
		pagination.setTotalCount(service.count(pageRequest));
				
		model.addAttribute("pagination", pagination);
				
		//검색유형의 코드명과 코드값을 정의
		List<CodeLabelValue> searchTypeCodeValueList = new ArrayList<CodeLabelValue>();
		searchTypeCodeValueList.add(new CodeLabelValue("n", "---"));
		searchTypeCodeValueList.add(new CodeLabelValue("t", "Title"));
		searchTypeCodeValueList.add(new CodeLabelValue("c", "Content"));
		searchTypeCodeValueList.add(new CodeLabelValue("w", "Writer"));
		searchTypeCodeValueList.add(new CodeLabelValue("tc", "Title OR Content"));
		searchTypeCodeValueList.add(new CodeLabelValue("cw", "Content OR Writer"));
		searchTypeCodeValueList.add(new CodeLabelValue("tcw", "Title OR Content OR Writer"));

		model.addAttribute("searchTypeCodeValueList", searchTypeCodeValueList);

	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(int noticeNo, @ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {
		Notice notice = service.read(noticeNo);
		
		model.addAttribute(notice);
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void modifyFrom(int noticeNo, @ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {
		Notice notice = service.read(noticeNo);
		
		model.addAttribute(notice);
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String modify(Notice notice, PageRequest pageRequest, RedirectAttributes rttr) throws Exception {
		service.modify(notice);
		
		//RedirectAttributes 객체에 일회성 데이터를 지정하여 전달
		rttr.addAttribute("page", pageRequest.getPage());
		rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());
				
		//검색 유형과 검색어를 뷰에 전달
		rttr.addAttribute("searchType", pageRequest.getSearchType());
		rttr.addAttribute("keyword", pageRequest.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/notice/list";
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String remove(int noticeNo, PageRequest pageRequest, RedirectAttributes rttr) throws Exception {
		service.remove(noticeNo);
		
		//RedirectAttributes 객체에 일회성 데이터를 지정하여 전달
		rttr.addAttribute("page", pageRequest.getPage());
		rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());
				
		//검색 유형과 검색어를 뷰에 전달
		rttr.addAttribute("searchType", pageRequest.getSearchType());
		rttr.addAttribute("keyword", pageRequest.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/notice/list";
	}
	
}