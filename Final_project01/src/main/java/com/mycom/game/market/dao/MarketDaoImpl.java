package com.mycom.game.market.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycom.game.data.dto.DataDto;
import com.mycom.game.market.dto.MarketDto;

@Repository
public class MarketDaoImpl implements MarketDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<MarketDto> getList() {
		//상품 목록 리턴해주기
		return session.selectList("market.getList");
	}

	@Override
	public void minusCount(int num) {
		//재고 개수 -1
		session.update("market.minusCount", num);
	}

	@Override
	public void minusMoney(MarketDto dto) {
		//고객의 잔고를 상품의 가격만큼 감소 시키기
		session.update("market.minusMoney", dto);
	}

	@Override
	public void plusPoint(MarketDto dto) {
		//상품 가격의 10%를 포인트로 적립 시키기
		session.update("market.plusPoint", dto);
	}

	@Override
	public int getPrice(int num) {
		//인자로 전달된 상품 번호에 해당하는 상품의 가격을 리턴하는 메소드
		return session.selectOne("market.getPrice",num);
	}

	@Override
	public void insert(MarketDto dto) {
		session.insert("market.insert", dto);
	}

}
