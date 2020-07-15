package org.hdcd.mapper;

import java.util.List;

import org.hdcd.domain.Cart;

public interface CartMapper {
	
	public void create(Cart cart) throws Exception;
	
	//public Cart read(Integer cartNo) throws Exception;
	
	public void update(Cart cart) throws Exception;
	
	public void delete(Integer cartNo) throws Exception;
	
	public void deleteAll(String userId) throws Exception;
	
	public List<Cart> list(String userId) throws Exception;
	
	public int priceAll(String userId) throws Exception;
	
	public int countItem(Integer itemId, String userId) throws Exception;
	
}