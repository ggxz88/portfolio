package org.hdcd.service;

import java.util.List;

import org.hdcd.domain.Cart;
import org.hdcd.domain.Item;
import org.hdcd.domain.Member;

public interface CartService {
	
	public void register(Member member, Item item) throws Exception;
	
	//public Cart read(Integer cartNo) throws Exception;
	
	public void modify(Cart cart) throws Exception;
	
	public void remove(Integer cartNo) throws Exception;
	
	//public void removeAll() throws Exception;
	
	public List<Cart> list(String userId) throws Exception;

	public int priceAll() throws Exception;

}