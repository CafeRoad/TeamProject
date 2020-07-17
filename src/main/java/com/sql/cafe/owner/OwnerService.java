package com.sql.cafe.owner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class OwnerService {
	@Autowired
	private OwnerMapper ownerMapper;
	
	public OwnerDTO getSpecificRow(String owner_id) {
		return this.ownerMapper.getSpecificRow(owner_id);

	}
}
