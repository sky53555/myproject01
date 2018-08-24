package com.mycom.game.community.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycom.game.community.dto.CommunityDto;
@Repository
public class CommunityDaoImpl implements CommunityDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<CommunityDto> getList() {
		return session.selectList("community.getList");
	}

}
