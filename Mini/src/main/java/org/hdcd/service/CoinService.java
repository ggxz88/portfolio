package org.hdcd.service;

import java.util.List;

import org.hdcd.domain.Coin;
import org.hdcd.domain.PayCoin;

public interface CoinService {
	
	public void charge(Coin coin) throws Exception;
	
	public List<Coin> list(String userId) throws Exception;
	
	public List<PayCoin> listPayHistory(String userId) throws Exception;

}