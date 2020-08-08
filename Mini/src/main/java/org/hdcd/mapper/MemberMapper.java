package org.hdcd.mapper;

import java.util.List;

import org.hdcd.domain.Member;
import org.hdcd.domain.MemberAuth;

public interface MemberMapper {
	
	public Member readByUserId(String userId);
	
	public void create(Member member) throws Exception;
	
	public Member read(String userId) throws Exception;
	
	public void update(Member member) throws Exception;
	
	public void delete(String userId) throws Exception;
	
	public List<Member> list() throws Exception;
	
	public void createAuth(MemberAuth memberAuth) throws Exception;
	
	public void deleteAuth(String userId) throws Exception;
	
	public int countAll() throws Exception;
	
	public Member idChk(String userId) throws Exception;
	
	public Member findEmail(String email) throws Exception;
	
	public void updatePw(Member member) throws Exception;
}