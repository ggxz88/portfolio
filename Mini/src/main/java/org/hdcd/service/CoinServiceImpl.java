package org.hdcd.service;

import java.util.List;

import org.hdcd.domain.Coin;
import org.hdcd.domain.PayCoin;
import org.hdcd.mapper.CoinMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CoinServiceImpl implements CoinService {
	
	private final CoinMapper mapper;
	
	@Autowired
	public CoinServiceImpl(CoinMapper mapper) {
		this.mapper = mapper;
	}
	
	@Transactional
	@Override
	public void charge(Coin coin) throws Exception {
		mapper.charge(coin);
		mapper.create(coin);
	}
	
	@Override
	public List<Coin> list(String userId) throws Exception {
		return mapper.list(userId);
	}
	
	@Override
	public List<PayCoin> listPayHistory(String userId) throws Exception {
		return mapper.listPayHistory(userId);
	}

}