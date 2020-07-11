package org.hdcd.service;

import java.util.List;

import org.hdcd.common.domain.PageRequest;
import org.hdcd.domain.Item;
import org.hdcd.mapper.ItemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemServiceImpl implements ItemService {
	
	private final ItemMapper mapper;
	
	@Autowired
	public ItemServiceImpl(ItemMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public void register(Item item) throws Exception {
		mapper.create(item);
	}
	
	@Override
	public Item read(Integer itemId) throws Exception {
		return mapper.read(itemId);
	}
	
	@Override
	public void modify(Item item) throws Exception {
		mapper.update(item);
	}
	
	@Override
	public void remove(Integer itemId) throws Exception {
		mapper.delete(itemId);
	}
	
	@Override
	public List<Item> list(PageRequest pageRequest) throws Exception {
		return mapper.list(pageRequest);
	}
	
	@Override
	public int count(PageRequest pageRequest) throws Exception {
		return mapper.count(pageRequest);
	}
	
	@Override
	public String getPicture(Integer itemId) throws Exception {
		return mapper.getPicture(itemId);
	}
	
	@Override
	public String getPreview(Integer itemId) throws Exception {
		return mapper.getPreview(itemId);
	}
	
}