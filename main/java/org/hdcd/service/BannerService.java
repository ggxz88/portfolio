package org.hdcd.service;

import java.util.List;

import org.hdcd.domain.Banner;

public interface BannerService {
	
	public void register(Banner banner) throws Exception;
	
	public Banner read(Integer bannerNo) throws Exception;
	
	public void modify(Banner banner) throws Exception;
	
	public void remove(Integer bannerNo) throws Exception;
	
	public List<Banner> list() throws Exception;
	
	public String getBannerPicture(Integer bannerNo) throws Exception;
}