package org.hdcd.mapper;

import java.util.List;

import org.hdcd.domain.Coin;
import org.hdcd.domain.PayCoin;

public interface CoinMapper {
	
	public void create(Coin coin) throws Exception;
	
	public void charge(Coin coin) throws Exception;
	
	public List<Coin> list(String userId) throws Exception;
	
	// 구매 내역 생성
	public void createPayHistory(PayCoin payCoin) throws Exception;
	
	// 구매 내역 반환
	public List<PayCoin> listPayHistory(String userId) throws Exception;
	
	// 상품 구매에 대한 코인 지급 처리
	public void pay(PayCoin payCoin) throws Exception;
}