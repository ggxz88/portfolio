package org.hdcd.controller;

import java.util.ArrayList;
import java.util.List;

import org.hdcd.common.domain.CodeLabelValue;
import org.hdcd.common.domain.PageRequest;
import org.hdcd.common.domain.Pagination;
import org.hdcd.common.security.domain.CustomUser;
import org.hdcd.domain.Board;
import org.hdcd.domain.Member;
import org.hdcd.domain.Reply;
import org.hdcd.service.BoardService;
import org.hdcd.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	private final BoardService service;
	private final ReplyService replyService;
	
	@Autowired
	public BoardController(BoardService service, ReplyService replyService) {
		this.service = service;
		this.replyService = replyService;
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public void registerForm(Model model, Authentication authentication) throws Exception {
		CustomUser customUser = (CustomUser)authentication.getPrincipal();
		Member member = customUser.getMember();
		
		Board board = new Board();
		
		board.setWriter(member.getUserId());
		
		model.addAttribute(board);
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public String register(Board board, RedirectAttributes rttr) throws Exception {
		service.register(board);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/board/list";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	//페이징요청 정보를 매개변수로 받고 다시 뷰에 전달
	public void list(@ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {
		//뷰에 페이징 처리를 한 게시글 목록 전달
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
	public void read(int boardNo, @ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {
		//조회한 게시글 상세정보를 뷰에 전달
		Board board = service.read(boardNo);
				
		model.addAttribute(board);
		
		//댓글
		List<Reply> replyList = replyService.list(boardNo);
		
		model.addAttribute("replyList", replyList);
		
		model.addAttribute("reply", new Reply());
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
	public String remove(int boardNo, PageRequest pageRequest, RedirectAttributes rttr) throws Exception {
		service.remove(boardNo);
		
		//RedirectAttributes 객체에 일회성 데이터를 지정하여 전달
		rttr.addAttribute("page", pageRequest.getPage());
		rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());
		
		//검색 유형과 검색어를 뷰에 전달
		rttr.addAttribute("searchType", pageRequest.getSearchType());
		rttr.addAttribute("keyword", pageRequest.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/board/list";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
	public void modifyForm(int boardNo, @ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {
		//조회한 게시글 상세정보를 뷰에 전달
		Board board = service.read(boardNo);
								
		model.addAttribute(board);
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
	public String modify(Board board, PageRequest pageRequest, RedirectAttributes rttr) throws Exception {
		service.modify(board);
		
		//RedirectAttributes 객체에 일회성 데이터를 지정하여 전달
		rttr.addAttribute("page", pageRequest.getPage());
		rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());
		
		//검색 유형과 검색어를 뷰에 전달
		rttr.addAttribute("searchType", pageRequest.getSearchType());
		rttr.addAttribute("keyword", pageRequest.getKeyword());
				
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/board/list";
	}
	
	//댓글
	
	@RequestMapping(value = "/replyregister", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public String replyregister(Reply reply, int boardNo, Model model, Authentication authentication, RedirectAttributes rttr) throws Exception {
		replyService.register(reply);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/board/list";
	}
	
	/*
	@RequestMapping(value = "/replyregister", method = {RequestMethod.POST, RequestMethod.GET})
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public String register(Authentication authentication, Model model, RedirectAttributes rttr) throws Exception {
		CustomUser customUser = (CustomUser)authentication.getPrincipal();
		Member member = customUser.getMember();
		
		Reply reply = new Reply();
		
		reply.setWriter(member.getUserId());
		
		replyService.register(reply);
		
		model.addAttribute(reply);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/board/read";
	}
	*/
	
	/*
	@RequestMapping(value = "/replymodify", method = RequestMethod.GET)
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
	public void modifyForm(int boardNo, Model model) throws Exception {
		//조회한 게시글 상세정보를 뷰에 전달
		Board board = service.read(boardNo);
								
		model.addAttribute(board);
	}
	
	@RequestMapping(value = "/replymodify", method = RequestMethod.POST)
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
	public String modify(Board board, PageRequest pageRequest, RedirectAttributes rttr) throws Exception {
		service.modify(board);
		
		//RedirectAttributes 객체에 일회성 데이터를 지정하여 전달
		rttr.addAttribute("page", pageRequest.getPage());
		rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());
		
		//검색 유형과 검색어를 뷰에 전달
		rttr.addAttribute("searchType", pageRequest.getSearchType());
		rttr.addAttribute("keyword", pageRequest.getKeyword());
				
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/board/list";
	}
	
	@RequestMapping(value = "/replyremove", method = RequestMethod.POST)
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
	public String remove(int boardNo, PageRequest pageRequest, RedirectAttributes rttr) throws Exception {
		service.remove(boardNo);
		
		//RedirectAttributes 객체에 일회성 데이터를 지정하여 전달
		rttr.addAttribute("page", pageRequest.getPage());
		rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());
		
		//검색 유형과 검색어를 뷰에 전달
		rttr.addAttribute("searchType", pageRequest.getSearchType());
		rttr.addAttribute("keyword", pageRequest.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/board/list";
	}
	*/
}