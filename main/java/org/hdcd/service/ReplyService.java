package org.hdcd.service;

import java.util.List;

import org.hdcd.domain.Reply;

public interface ReplyService {
	
	public void register(Reply reply) throws Exception;
	
	public List<Reply> list(int boardNo) throws Exception;
	
	public void modify(Reply reply) throws Exception;
	
	public void remove(int replyNo) throws Exception;
	
	public Reply read(int replyNo) throws Exception;
	
}