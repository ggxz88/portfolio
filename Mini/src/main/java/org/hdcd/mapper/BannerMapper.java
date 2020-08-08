package org.hdcd.mapper;

import java.util.List;

import org.hdcd.domain.Banner;

public interface BannerMapper {

	public void create(Banner banner) throws Exception;
	
	public Banner read(Integer bannerNo) throws Exception;
		
	public void update(Banner banner) throws Exception;
	
	public void delete(Integer bannerNo) throws Exception;
	
	public List<Banner> list() throws Exception;
	
	public String getBannerPicture(Integer bannerNo) throws Exception;

}