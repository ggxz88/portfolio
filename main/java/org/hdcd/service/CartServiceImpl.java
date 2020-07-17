package org.hdcd.service;

import java.util.List;

import org.hdcd.domain.Cart;
import org.hdcd.domain.Item;
import org.hdcd.domain.Member;
import org.hdcd.mapper.CartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CartServiceImpl implements CartService {
	
	private final CartMapper mapper;
	
	@Autowired
	public CartServiceImpl(CartMapper mapper) {
		this.mapper = mapper;
	}
	
	@Transactional
	@Override
	public void register(Member member, Item item) throws Exception {
		String userId = member.getUserId();
		
		int itemId = item.getItemId();
		
		Cart cart = new Cart();
		cart.setUserId(userId);
		cart.setItemId(itemId);
		
		mapper.create(cart);
	}
	
	@Override
	public Cart read(int cartNo) throws Exception {
		return mapper.read(cartNo);
	}

	
	@Override
	public void modify(Cart cart) throws Exception {
		mapper.update(cart);
	}
	
	@Override
	public void remove(int cartNo) throws Exception {
		mapper.delete(cartNo);
	}
	
	@Override
	public void removeAll(String userId) throws Exception {
		mapper.deleteAll(userId);
	}
	
	@Override
	public List<Cart> list(String userId) throws Exception {
		return mapper.list(userId);
	}

	@Override
	public int priceAll(String userId) throws Exception {
		return mapper.priceAll(userId);
	}
	
	@Override
	public int countItem(int itemId, String userId) throws Exception {
		return mapper.countItem(itemId, userId);
	}
}