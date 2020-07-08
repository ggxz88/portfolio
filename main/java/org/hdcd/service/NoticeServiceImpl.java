package org.hdcd.service;

import java.util.List;

import org.hdcd.common.domain.PageRequest;
import org.hdcd.domain.Notice;
import org.hdcd.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	private final NoticeMapper mapper;
	
	@Autowired
	public NoticeServiceImpl(NoticeMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public void register(Notice notice) throws Exception {
		mapper.create(notice);
	}
	
	@Override
	public Notice read(int noticeNo) throws Exception {
		return mapper.read(noticeNo);
	}
	
	@Override
	public void modify(Notice notice) throws Exception {
		mapper.update(notice);
	}
	
	@Override
	public void remove(int noticeNo) throws Exception {
		mapper.delete(noticeNo);
	}
	
	@Override
	public List<Notice> list(PageRequest pageRequest) throws Exception {
		return mapper.list(pageRequest);
	}

	@Override
	public int count(PageRequest pageRequest) throws Exception {
		return mapper.count(pageRequest);
	}
}