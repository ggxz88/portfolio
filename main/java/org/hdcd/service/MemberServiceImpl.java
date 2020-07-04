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
		
		String userId = member.getUserId();
		
		mapper.deleteAuth(userId);
		
		List<MemberAuth> authList = member.getAuthList();
		
		for (int i = 0; i <authList.size(); i++) {
			MemberAuth memberAuth = authList.get(i);
			
			String auth = memberAuth.getAuth();
			
			if (auth == null) {
				continue;
			}
			
			if (auth.trim().length() == 0) {
				continue;
			}
			
			memberAuth.setUserId(userId);
			
			mapper.createAuth(memberAuth);
		}
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
}