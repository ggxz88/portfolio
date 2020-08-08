package org.hdcd.domain;

import java.io.Serializable;
import java.util.Date;

public class UserItem implements Serializable {

	private static final long serialVersionUID = 6841106458474066704L;
	
	private int userItemNo;
	private String userId;
	
	private int itemId;
	private String itemName;
	private Integer price;
	private String description;
	private String pictureUrl;
	
	private Date regDate;
	
	private int row_num;

	public int getUserItemNo() {
		return userItemNo;
	}

	public void setUserItemNo(int userItemNo) {
		this.userItemNo = userItemNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPictureUrl() {
		return pictureUrl;
	}

	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getRow_num() {
		return row_num;
	}

	public void setRow_num(int row_num) {
		this.row_num = row_num;
	}
	
	
}