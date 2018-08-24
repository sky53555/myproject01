package com.mycom.game.community.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycom.game.community.dto.CustomerServiceCommentDto;
import com.mycom.game.exception.DeleteFailException;
@Repository
public class CustomerServiceCommentDaoImpl implements CustomerServiceCommentDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public int getSequence() {
		//새로 저장할 댓글의 글번호를 미리 얻어와서
		int num=session.selectOne("customerServiceComment.getSequence");
		return num;
	}

	@Override
	public void insert(CustomerServiceCommentDto dto) {
		int flag=session.insert("customerServiceComment.insert", dto);
		if(flag<0) {//만일 삭제 실패라면
			throw new DeleteFailException("파일 삭제 실패!");
		}
	}

	@Override
	public List<CustomerServiceCommentDto> getList(int ref_group) {
		List<CustomerServiceCommentDto> list=session.selectList("customerServiceComment.getList", ref_group);
		return list;
	}
}
