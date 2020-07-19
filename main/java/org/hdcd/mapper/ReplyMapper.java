package org.hdcd.mapper;

import java.util.List;

import org.hdcd.domain.Reply;

public interface ReplyMapper {
	
	public void create(Reply reply) throws Exception;
	
	public void update(Reply reply) throws Exception;
	
	public void delete(Integer replyNo) throws Exception;
	
	public List<Reply> list(Integer boardNo) throws Exception;
	
}