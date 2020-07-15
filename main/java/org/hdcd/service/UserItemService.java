package org.hdcd.service;

import java.util.List;

import org.hdcd.domain.Item;
import org.hdcd.domain.Member;
import org.hdcd.domain.UserItem;

public interface UserItemService {
	
	public void register(Member member, Item item) throws Exception;
	
	public UserItem read(Integer userItemNo) throws Exception;
	
	public List<UserItem> listAll() throws Exception;
	
	public List<UserItem> list(String userId) throws Exception;
	
	public List<UserItem> rank(Integer itemId) throws Exception;
}