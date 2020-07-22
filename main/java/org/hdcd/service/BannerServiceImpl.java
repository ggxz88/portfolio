package org.hdcd.service;

import java.util.List;

import org.hdcd.domain.Banner;
import org.hdcd.mapper.BannerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BannerServiceImpl implements BannerService {
	
	private final BannerMapper mapper;
	
	@Autowired
	public BannerServiceImpl(BannerMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public void register(Banner banner) throws Exception {
		mapper.create(banner);
	}
	
	@Override
	public Banner read(Integer bannerNo) throws Exception {
		return mapper.read(bannerNo);
	}
	
	@Override
	public void modify(Banner banner) throws Exception {
		mapper.update(banner);
	}
	
	@Override
	public void remove(Integer bannerNo) throws Exception {
		mapper.delete(bannerNo);
	}
	
	@Override
	public List<Banner> list() throws Exception {
		return mapper.list();
	}
	
	@Override
	public String getBannerPicture(Integer bannerNo) throws Exception {
		return mapper.getBannerPicture(bannerNo);
	}
	
	
}