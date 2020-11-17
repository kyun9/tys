package com.project.service;

import java.util.List;

import com.project.vo.BoardVO;

public interface BoardServiceI {
	
	// 게시글 전체 목록 불러오기
	public List<BoardVO> selectAll() throws Exception;
	
	// 게시글 조회하기
	public BoardVO boardDetail(int b_num);
	
	// 게시글 삭제하기
	public boolean boardDelete(int b_num);

   // 게시물 작성하기
   public void create(BoardVO vo) throws Exception;
   
   // 게시글 수정하기
   public void update(BoardVO vo) throws Exception;
   
   // 조회수 증가
   public void hitUp(int b_num);
   
   // 게시글 검색하기
   public List<BoardVO> listAll(String searchOption, String keyword) throws Exception;
}