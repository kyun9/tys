package com.project.dao;

import java.util.List;

import com.project.vo.BoardVO;
import com.project.vo.NoticeBoardVO;
import com.project.vo.PagingVO;

// 게시판DAO인터페이스
public interface NoticeBoardDAOI {

	// 게시글 모두 불러오기
	public List<NoticeBoardVO> selectAll() throws Exception;

	// 게시글 조회하기
	public NoticeBoardVO boardDetail(int n_num);

	// 게시글 삭제하기
	public int boardDelete(int n_num);

	// 게시글 등록하기
	public void create(NoticeBoardVO vo) throws Exception;

	// 게시글 수정하기
	public void update(NoticeBoardVO vo);

	// 조회수 증가하기
	public void update(int n_num);

	// 게시글 검색하기
	public List<NoticeBoardVO> listAll(String searchOption, String keyword);

	public List<NoticeBoardVO> searchTypeList(String searchType, String keyword);

	// 전체 게시물 갯수
	public int countBoard() throws Exception;

	// 게시물 목록
	public List<NoticeBoardVO> selectBoard(PagingVO vo) throws Exception;

}