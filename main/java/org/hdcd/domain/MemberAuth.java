package org.hdcd.domain;

import java.io.Serializable;

public class MemberAuth implements Serializable {
	
	private static final long serialVersionUID = 4412126630663591085L;

	private String userId;
	
	private String auth;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}
	
	
}