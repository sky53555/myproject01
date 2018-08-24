package com.mycom.game.market.dao;

import com.mycom.game.market.dto.OrderDto;

public interface OrderDao {
	public void addOrder(OrderDto dto);	//배송 정보를 추가하는 메소드
}
