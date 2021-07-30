package com.avengors.model;

import java.util.List;



public interface BoardDAO {

	void save(BoardDTO dto);

	//등록
	public void insertBoard(BoardDTO boardto);

	//목록
	public List<BoardDTO>boardList();

	//조회
	public BoardDTO selectOne(int idx) ;

	
	//삭제
	public int deleteBoard(int idx);

	
	//수정
	public int updateBoard(BoardDTO boardto) ;
	


}
