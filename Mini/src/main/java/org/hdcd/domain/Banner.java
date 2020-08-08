package org.hdcd.domain;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class Banner implements Serializable {

	private static final long serialVersionUID = -658212877339310217L;
	
	private Integer bannerNo;
	
	private String bannerName;
	
	private Integer itemId;
	private String itemName;
	
	private MultipartFile bannerPicture;
	
	private String bannerPictureUrl;

	public int getBannerNo() {
		return bannerNo;
	}

	public void setBannerNo(Integer bannerNo) {
		this.bannerNo = bannerNo;
	}
	
	public String getBannerName() {
		return bannerName;
	}

	public void setBannerName(String bannerName) {
		this.bannerName = bannerName;
	}
	
	public Integer getItemId() {
		return itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public MultipartFile getBannerPicture() {
		return bannerPicture;
	}

	public void setBannerPicture(MultipartFile bannerPicture) {
		this.bannerPicture = bannerPicture;
	}

	public String getBannerPictureUrl() {
		return bannerPictureUrl;
	}

	public void setBannerPictureUrl(String bannerPictureUrl) {
		this.bannerPictureUrl = bannerPictureUrl;
	}
	
}