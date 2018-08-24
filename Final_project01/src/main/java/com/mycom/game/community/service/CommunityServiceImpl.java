package com.mycom.game.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.game.community.dao.CommunityDao;
import com.mycom.game.community.dto.CommunityDto;

@Service
public class CommunityServiceImpl implements CommunityService{

	@Autowired
	private CommunityDao dao;
	
	@Override
	public void getList(ModelAndView mView) {
		List<CommunityDto> list=dao.getList();
		mView.addObject("list",list);
	}

}
