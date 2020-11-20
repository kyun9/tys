package com.project.dao;

import java.util.List;

import com.project.vo.BoardVO;
import com.project.vo.PagingVO;

// 게시판DAO인터페이스
public interface BoardDAOI {

	// 게시글 모두 불러오기
	public List<BoardVO> selectAll() throws Exception;

	// 게시글 조회하기
	public BoardVO boardDetail(int b_num);

	// 게시글 삭제하기
	public int boardDelete(int b_num);

	// 게시글 등록하기
	public void create(BoardVO vo) throws Exception;

	// 게시글 수정하기
	public void update(BoardVO vo);

	// 조회수 증가하기
	public void update(int b_num);

	// 게시글 검색하기
	public List<BoardVO> listAll(String searchOption, String keyword , String start, String end);

	public List<BoardVO> searchTypeList(String searchType, String keyword,String start, String end);

	// 전체 게시물 갯수
	public int countBoard() throws Exception;

	// 게시물 목록
	public List<BoardVO> selectBoard(PagingVO vo) throws Exception;
	
	//부서검색
	public List<BoardVO> searchTeam(int num);
	

}
