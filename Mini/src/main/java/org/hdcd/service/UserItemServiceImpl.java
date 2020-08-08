package org.hdcd.service;

import java.util.List;

import org.hdcd.domain.Item;
import org.hdcd.domain.Member;
import org.hdcd.domain.PayCoin;
import org.hdcd.domain.UserItem;
import org.hdcd.exception.NotEnoughCoinException;
import org.hdcd.mapper.CoinMapper;
import org.hdcd.mapper.UserItemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserItemServiceImpl implements UserItemService {
	
	private final UserItemMapper mapper;
	private final CoinMapper coinMapper;
	
	@Autowired
	public UserItemServiceImpl(UserItemMapper mapper, CoinMapper coinMapper) {
		this.mapper = mapper;
		this.coinMapper = coinMapper;
	}
	
	@Transactional
	@Override
	public void register(Member member, Item item) throws Exception {
		String userId = member.getUserId();
		
		int coin = member.getCoin();
		
		int itemId = item.getItemId();
		
		int price = item.getPrice();
		
		UserItem userItem = new UserItem();
		userItem.setUserId(userId);
		userItem.setItemId(itemId);
		
		if(coin < price) {
			throw new NotEnoughCoinException("There is Not Enough Coin.");
		}
		
		PayCoin payCoin = new PayCoin();
		payCoin.setUserId(userId);
		payCoin.setItemId(itemId);
		payCoin.setAmount(price);
		
		coinMapper.pay(payCoin);
		coinMapper.createPayHistory(payCoin);
		
		mapper.create(userItem);
	}
	
	@Override
	public UserItem read(Integer userItemNo) throws Exception {
		return mapper.read(userItemNo);
	}
	
	@Override
	public List<UserItem> listAll() throws Exception {
		return mapper.listAll();
	}

	
	@Override
	public List<UserItem> list(String userId) throws Exception {
		return mapper.list(userId);
	}
	
	@Override
	public List<UserItem> rank(int itemId) throws Exception {
		return mapper.rank(itemId);
	}
}