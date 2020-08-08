package org.hdcd.mapper;

import java.util.List;

import org.hdcd.domain.Review;

public interface ReviewMapper {
	
	public void create(Review review) throws Exception;
	
	public void update(Review review) throws Exception;
	
	public void delete(Integer replyNo) throws Exception;
	
	public List<Review> list(Integer boardNo) throws Exception;
	
	public Review read(Integer reviewNo) throws Exception;

}