package com.sql.cafe.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

	
	@Autowired
	private UserMapper userMapper;
	
	public UserDTO getSpecificRow(String user_id) {
		return this.userMapper.getSpecificRow(user_id);

	}
}
