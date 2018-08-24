package com.mycom.game.gallery.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.game.exception.ForbiddenException;
import com.mycom.game.gallery.dao.GalleryDao;
import com.mycom.game.gallery.dto.GalleryDto;


@Service
public class GalleryServiceImpl implements GalleryService{
	//한 페이지에 나타낼 로우의 갯수
	private static final int PAGE_ROW_COUNT=5;
	//하단 디스플레이 페이지 갯수
	private static final int PAGE_DISPLAY_COUNT=3;	
	
	@Autowired
	private GalleryDao dao;
	
	@Override
	public void getList(ModelAndView mView, HttpServletRequest request) {
		
		GalleryDto dto=new GalleryDto();

		//1. FileDto 객체를 전달해서 파일 목록을 불러온다 
		List<GalleryDto> list=dao.getList(dto);
//		dto = dao.getData(1);
		String realPath=request.getSession()
				.getServletContext().getRealPath("/upload");
		
		if(list.isEmpty()) {
			mView.addObject("isEmpty", "list 비어있다");
		}else {
			mView.addObject("isEmpty", "list가 null인건 아닌데");
		}
		//저장할 파일의 상세 경로
		String imgPath=realPath+File.separator;
		
//		mView.addObject("title", dto.getTitle());
		mView.addObject("list",list);
		mView.addObject("imgPath", imgPath);
		
	}

	@Override
	public void insert(HttpServletRequest request, GalleryDto dto) {
		//파일을 저장할 폴더의 절대 경로를 얻어온다.
		String realPath=request.getSession()
				.getServletContext().getRealPath("/upload");
		//콘솔에 경로 출력해보기
		
		//MultipartFile 객체의 참조값 얻어오기
		//FileDto 에 담긴 MultipartFile 객체의 참조값을 얻어온다.
		MultipartFile mFile=dto
				.getFile();
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
		
		//FileDao 객체를 이용해서 DB 에 저장하기
		dao.insert(dto);				
	}

	@Override
	public void getData(ModelAndView mView, int num) {
		//다운로드 시켜줄 파일의 정보를 얻어와서
		GalleryDto dto=dao.getData(num);
		//ModelAndView 객체에 담아준다.
		mView.addObject("dto", dto);
	}

	@Override
	public void delete(HttpServletRequest request, int num) {
		/*
		 *  이 요청을 한 클라이언트가 자신의 글을 지우는게 맞는지 
		 *  확인하기
		 */
		//세션에 저장된 아이디 
		String id=(String)request.getSession().getAttribute("id");
		
		//삭제할 파일의 정보 
		GalleryDto dto=dao.getData(num);
		if(!id.equals(dto.getWriter())) {
			//금지된 요청이라는 응답을 한다. 
			throw new ForbiddenException();
		}
		//1. 파일 시스템에서 파일 삭제
		String path=
			request.getServletContext().getRealPath("/upload")+
			File.separator+dto.getSaveFileName();
		try{
			new File(path).delete();
		}catch(Exception e){}
		//2. DB 에서 파일정보 삭제
		dao.delete(num);
	}

	@Override
	public void getRealPath(HttpServletRequest request, ModelAndView mView) {
		
		GalleryDto dto=new GalleryDto();
		List<GalleryDto> list=dao.getList(dto);
		
		String realPath = request.getServletContext().getRealPath("/upload")+
				File.separator+dto.getSaveFileName();
		mView.addObject("list",list);
		mView.addObject("realPath", realPath);
		
		
	}
	
	/*@Override
	public void getList(ModelAndView mView, int pageNum) {
		
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		//전체 row 의 갯수를 읽어온다.
		int totalRow=dao.getCount();
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}
		
		// startRowNum 과 endRowNum을 FileDto 에 담은 다음 
		GalleryDto dto=new GalleryDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		//1. FileDto 객체를 전달해서 파일 목록을 불러온다 
		List<GalleryDto> list=dao.getList(dto);
		
		mView.addObject("list",list);
		mView.addObject("pageNum", pageNum);
		mView.addObject("startPageNum", startPageNum);
		mView.addObject("endPageNum", endPageNum);
		mView.addObject("totalPageCount", totalPageCount);
				
	}*/

}
















