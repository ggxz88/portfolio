package org.hdcd.service;

import java.util.List;

import org.hdcd.common.domain.PageRequest;
import org.hdcd.domain.Board;


public interface BoardService {
	
	public void register(Board board) throws Exception;
	
	public Board read(int boardNo) throws Exception;
	
	public void modify(Board board) throws Exception;
	
	public void remove(int boardNo) throws Exception;
	
	//페이징요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환
	public List<Board> list(PageRequest pageRequest) throws Exception;
	
	//검색처리된 게시글 전체 건수 반환
	public int count(PageRequest pageRequest) throws Exception;
	
}