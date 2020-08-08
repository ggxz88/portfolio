package org.hdcd.service;

import java.util.List;

import org.hdcd.domain.Member;
import org.hdcd.domain.MemberAuth;
import org.hdcd.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService {
	
	private final MemberMapper mapper;
	
	@Autowired
	public MemberServiceImpl(MemberMapper mapper) {
		this.mapper = mapper;
	}
	
	@Transactional
	@Override
	public void register(Member member) throws Exception {
		mapper.create(member);
		
		MemberAuth memberAuth = new MemberAuth();
		
		memberAuth.setUserId(member.getUserId());
		memberAuth.setAuth("ROLE_MEMBER");
		
		mapper.createAuth(memberAuth);
	}
	
	@Override
	public Member read(String userId) throws Exception {
		return mapper.read(userId);
	}
	
	@Transactional
	@Override
	public void modify(Member member) throws Exception {
		mapper.update(member);
		
	}
	
	@Transactional
	@Override
	public void remove(String userId) throws Exception {
		mapper.deleteAuth(userId);
		
		mapper.delete(userId);
	}
	
	@Override
	public List<Member> list() throws Exception {
		return mapper.list();
	}
	
	@Override
	public int getCoin(String userId) throws Exception {
		Member member = mapper.read(userId);
				
		return member.getCoin();
	}
	
	@Override
	public int countAll() throws Exception{
		return mapper.countAll();
	}
	
	@Transactional
	@Override
	public void setupAdmin(Member member) throws Exception {
		mapper.create(member);
		
		MemberAuth memberAuth = new MemberAuth();
		
		memberAuth.setUserId(member.getUserId());
		memberAuth.setAuth("ROLE_ADMIN");
		
		mapper.createAuth(memberAuth);
	}
	
	@Override
	public Member idChk(String userId) throws Exception {
		return mapper.idChk(userId);
	}
	
	@Override
	public Member findEmail(String email) throws Exception {
		return mapper.findEmail(email);
	}
	
	@Override
	public void modifyPw(Member member) throws Exception {
		mapper.updatePw(member);
	}

	
}