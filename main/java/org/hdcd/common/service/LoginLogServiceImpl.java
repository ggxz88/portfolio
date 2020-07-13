package org.hdcd.common.service;

import java.util.List;

import org.hdcd.common.domain.LoginLog;
import org.hdcd.common.mapper.LoginLogMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginLogServiceImpl implements LoginLogService {

	@Autowired
	private LoginLogMapper mapper;

	@Override
	public void register(LoginLog loginLog) throws Exception {
		mapper.create(loginLog);
	}

	@Override
	public List<LoginLog> list() throws Exception {
		return mapper.list();
	}

}
