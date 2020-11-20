package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.BoardDAOI;
import com.project.vo.BoardVO;
import com.project.vo.PagingVO;


@Service
public class BoardServiceImpl implements BoardServiceI{

	@Autowired
	BoardDAOI boardDao;

	// 게시글 전체 목록 조회하기
	@Override
	public List<BoardVO> selectAll() throws Exception {
		return boardDao.selectAll();
	}

	// 클릭한 게시글 상세조회하기
	@Override
	public BoardVO boardDetail(int b_num) {
		return boardDao.boardDetail(b_num);
	}

	// 게시글 삭제하기
	@Override
	public boolean boardDelete(int b_num) {

		if(boardDao.boardDelete(b_num)>0) {
			return true;
		}
		return false;
	}

	//게시물 작성하기
	@Override
	public void create(BoardVO vo) throws Exception{
		boardDao.create(vo);
	}

	// 게시글 수정하기
	public void update(BoardVO vo) throws Exception{
		boardDao.update(vo);
	}

	// 조회수 증가
	@Override
	public void hitUp(int b_num) {
		boardDao.update(b_num);
	}
	
	// 게시글 검색하기
	// 게시글 전체 목록 boardDAO.listAll메서드 호출
	@Override
	public List<BoardVO> listAll(String searchOption, String keyword,String start, String end) throws Exception {
		return boardDao.listAll(searchOption, keyword, keyword, keyword);
	}
	
	//페이징처리
	@Override
	public int countBoard() throws Exception {
		return boardDao.countBoard();
	}
	
	@Override
	public List<BoardVO> selectBoard(PagingVO vo) throws Exception {
		
		return boardDao.selectBoard(vo);
	}
	
}
