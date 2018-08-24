package com.mycom.game.market.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.game.market.dao.MarketDao;
import com.mycom.game.market.dao.OrderDao;
import com.mycom.game.market.dto.MarketDto;
import com.mycom.game.market.dto.OrderDto;

@Service
public class MarketServiceImpl implements MarketService{
	@Autowired
	private MarketDao marketDao;
	@Autowired
	private OrderDao orderDao;
	
	@Override
	public void getList(ModelAndView mView) {
		//ShopDao 객체를 이용해서 상품 목록을 얻어와서
		List<MarketDto> list=marketDao.getList();
		//인자로 전달된 ModelAndView 객체에 담는다. (request 영역에 담기 위해)
		mView.addObject("list",list);
	}

	@Override
	public void buy(HttpServletRequest request, ModelAndView mView) {
		//로그인된 아이디
		String id=(String)request.getSession().getAttribute("id");
		//구입할 상품 번호
		int num=Integer.parseInt(request.getParameter("num"));
		
		//1. 상품의 가격 정보 얻어오기
		int price=marketDao.getPrice(num);
		//2. 가격 만큼 계좌 잔액을 줄인다.
		MarketDto dto=new MarketDto();
		dto.setPrice(price);
		dto.setNum(num);
		dto.setId(id);
		marketDao.minusMoney(dto);
		//3. 가격의 10%를 포인트로 적립
		marketDao.plusPoint(dto);
		//4. 재고의 개수를 -1 줄인다.
		marketDao.minusCount(num);
		//5. 배송 요청 정보를 입력한다.
		OrderDto orderDto=new OrderDto();
		orderDto.setId(id);
		orderDto.setCode(num);
		orderDto.setAddr("노량진");
		orderDao.addOrder(orderDto);
	}

	@Override
	public void insert(HttpServletRequest request, MarketDto dto) {
			//파일을 저장할 폴더의 절대 경로를 얻어온다.
			String realPath=request.getSession().getServletContext().getRealPath("/upload");
			//콘솔에 경로 출력해보기
			//MultipartFile 객체의 참조값 얻어오기
			//FileDto 에 담긴 MultipartFile 객체의 참조값을 얻어온다.
			MultipartFile mFile=dto.getFile();
			//원본 파일명
			String orgFileName=mFile.getOriginalFilename();
			//파일 사이즈
			long fileSize=mFile.getSize();
			//저장할 파일의 상세 경로
			String filePath=realPath+File.separator;
			//디렉토리를 만들 파일 객체 생성
			File file=new File(filePath);
			if(!file.exists()){//디렉토리가 존재하지 않는다면
				file.mkdir();//디렉토리를 만든다.
			}
			//파일 시스템에 저장할 파일명을 만든다. (겹치치 않게)
			String saveFileName=System.currentTimeMillis()+orgFileName;
			try{
				//upload 폴더에 파일을 저장한다.
				mFile.transferTo(new File(filePath+saveFileName));
			}catch(Exception e){
				e.printStackTrace();
			}
			//FileDto 객체에 추가 정보를 담는다.
			dto.setOrgFileName(orgFileName);
			dto.setSaveFileName(saveFileName);
			dto.setFileSize(fileSize);
			
			//세션에서 작성자 정보를 얻어온다.
			String id=(String)request.getSession().getAttribute("id");
			//FileDto 객체에 작성자 정보를 담는다.
			dto.setWriter(id);
			
			dataDao.insert(dto);	
	}
	
}
