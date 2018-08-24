package com.mycom.game.market.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.game.data.dto.DataDto;
import com.mycom.game.market.service.MarketService;

@Controller
public class MarketController {
	@Autowired
	private MarketService marketService;
	
	//상품 목록 보기 요청 처리
		@RequestMapping("/market/list")
		public ModelAndView list(ModelAndView mView) {
			
			marketService.getList(mView);
			
			mView.setViewName("market/list");
			return mView;
		}
		
		//상품 구매하기 요청 처리
		@RequestMapping("/market/buy")
		public ModelAndView authBuy(HttpServletRequest request, ModelAndView mView) {
			marketService.buy(request, mView);
			mView.setViewName("market/buy");
			return mView;
		}
		
		//상품정보 업데이트 폼
		@RequestMapping("/market/uploadform")
		public ModelAndView uploadForm() {
			return new ModelAndView("market/uploadform");
		}
		
		//상품정보 업데이트
		@RequestMapping("/market/update")
		public ModelAndView Update(HttpServletRequest request, DataDto dto) {
			marketService.insert(request, dto);
			return new ModelAndView("redirect:/market/list.do");
		}
}
