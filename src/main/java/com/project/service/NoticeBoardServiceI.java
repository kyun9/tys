package com.project.service;

import java.util.List;

import com.project.vo.BoardVO;
import com.project.vo.NoticeBoardVO;
import com.project.vo.PagingVO;

public interface NoticeBoardServiceI {

	// 게시글 전체 목록 불러오기
	public List<NoticeBoardVO> selectAll() throws Exception;

	// 게시글 조회하기
	public NoticeBoardVO boardDetail(int n_num);

	// 게시글 삭제하기
	public boolean boardDelete(int n_num);

	// 게시물 작성하기
	public void create(NoticeBoardVO vo) throws Exception;

	// 게시글 수정하기
	public void update(NoticeBoardVO vo) throws Exception;

	// 조회수 증가
	public void hitUp(int n_num);

	// 게시글 검색하기
	public List<NoticeBoardVO> listAll(String searchOption, String keyword) throws Exception;

	// 페이징처리
	// 전체 게시물 갯수
	public int countBoard() throws Exception;

	// 페이징 처리한 게시물 목록
	public List<NoticeBoardVO> selectBoard(PagingVO vo) throws Exception;
}
