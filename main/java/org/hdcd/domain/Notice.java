package org.hdcd.domain;

import java.io.Serializable;
import java.util.Date;

public class Notice implements Serializable {

	private static final long serialVersionUID = -4661124941050373649L;

	private int noticeNo;
	
	private String title;
	private String content;
	
	private Date regDate;

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
}