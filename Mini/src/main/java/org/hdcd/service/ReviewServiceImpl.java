package org.hdcd.service;

import java.util.List;

import org.hdcd.domain.Review;
import org.hdcd.mapper.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {
	
private final ReviewMapper mapper;
	
	@Autowired
	public ReviewServiceImpl(ReviewMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public void register(Review review) throws Exception {
		mapper.create(review);
	}
	
	@Override
	public List<Review> list(int itemId) throws Exception {
		return mapper.list(itemId);
	}
	
	
	@Override
	public void modify(Review review) throws Exception {
		mapper.update(review);
	}
	
	@Override
	public void remove(int reviewNo) throws Exception {
		mapper.delete(reviewNo);
	}
	
	@Override
	public Review read(int reviewNo) throws Exception {
		return mapper.read(reviewNo);
	}

	
}