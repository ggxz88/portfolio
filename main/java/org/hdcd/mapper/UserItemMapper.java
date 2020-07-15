package org.hdcd.mapper;

import java.util.List;

import org.hdcd.domain.UserItem;

public interface UserItemMapper {
	
	public void create(UserItem userItem) throws Exception;
	
	public UserItem read(Integer userItemNo) throws Exception;
	
	public List<UserItem> listAll() throws Exception;

	public List<UserItem> list(String userId) throws Exception;
	
	public List<UserItem> rank(Integer itemId) throws Exception;
}