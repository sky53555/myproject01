package com.mycom.game.market.dao;

import java.util.List;

import com.mycom.game.market.dto.MarketDto;


public interface MarketDao {
	public List<MarketDto> getList();	//상품 목록을 리턴해주는 메소드
	public void minusCount(int num);	//상품 재고를 감소 시키는 메소드
	public void minusMoney(MarketDto dto);	//잔고 감소
	public void plusPoint(MarketDto dto);	//포인트 증가
	public int getPrice(int num);	//상품의 가격을 리턴해주는 메소드
	public void insert(MarketDto dto);
}

