package org.hdcd.service;

import java.util.List;

import org.hdcd.common.domain.PageRequest;
import org.hdcd.domain.Notice;

public interface NoticeService {
	
	public void register(Notice notice) throws Exception;
	
	public Notice read(int noticeNo) throws Exception;
	
	public void modify(Notice notice) throws Exception;
	
	public void remove(int noticeNo) throws Exception;
	
	public List<Notice> list(PageRequest pageRequest) throws Exception;

	public int count(PageRequest pageRequest) throws Exception;
}