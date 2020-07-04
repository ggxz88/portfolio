package org.hdcd.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import org.hibernate.validator.constraints.NotBlank;

public class Member implements Serializable {

	private static final long serialVersionUID = -8850847423161672356L;
	
	@NotBlank
	private String userId;
	
	@NotBlank
	private String userPw;
	
	@NotBlank
	private String userName;
	
	private int coin;
	
	private String email;
	private String phone;
	
	private boolean enabled;
	
	private Date regDate;
	private Date updDate;
	
	private List<MemberAuth> authList;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getCoin() {
		return coin;
	}

	public void setCoin(int coin) {
		this.coin = coin;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getUpdDate() {
		return updDate;
	}

	public void setUpdDate(Date updDate) {
		this.updDate = updDate;
	}

	public List<MemberAuth> getAuthList() {
		return authList;
	}

	public void setAuthList(List<MemberAuth> authList) {
		this.authList = authList;
	}

	
	
	
}