package com.avengors.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



//DAO구현하는 클래스
@Repository
public class BoardDAOimpl implements BoardDAO{
	
	@Autowired
	private SqlSessionTemplate sql;
	
	//목록
	@Override
	public List<BoardDTO> boardList() {
		return sql.selectList("boardList");
	}
	@Override
	public void save(BoardDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertBoard(BoardDTO boardto) {
		sql.insert("insertBoard",boardto);
		
	}

	@Override
	public BoardDTO selectOne(int idx) {
		return sql.selectOne("selectOne",idx);
	}
	//삭제
	@Override
	public int deleteBoard(int idx) {
		return sql.delete("deleteBoard",idx);
		
	}
	//수정
	@Override
	public int updateBoard(BoardDTO boardto) {
		return sql.update("updateBoard", boardto);
	}
	
	

}
