package org.hdcd.mapper;

import java.util.List;

import org.hdcd.domain.Coin;

public interface CoinMapper {
	
	public void create(Coin coin) throws Exception;
	
	public void charge(Coin coin) throws Exception;
	
	public List<Coin> list(String userId) throws Exception;
}