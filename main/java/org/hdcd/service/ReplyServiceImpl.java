package org.hdcd.service;

import java.util.List;

import org.hdcd.domain.Board;
import org.hdcd.domain.Member;
import org.hdcd.domain.Reply;
import org.hdcd.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	private final ReplyMapper mapper;
	
	@Autowired
	public ReplyServiceImpl(ReplyMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public void register(Reply reply) throws Exception {
		mapper.create(reply);
	}
	
	@Override
	public List<Reply> list(int boardNo) throws Exception {
		return mapper.list(boardNo);
	}
	
	
	@Override
	public void modify(Reply reply) throws Exception {
		mapper.update(reply);
	}
	
	@Override
	public void remove(int replyNo) throws Exception {
		mapper.delete(replyNo);
	}
}