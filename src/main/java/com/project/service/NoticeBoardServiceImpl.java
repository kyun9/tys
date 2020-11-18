package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.NoticeBoardDAOI;
import com.project.vo.NoticeBoardVO;
import com.project.vo.PagingVO;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardServiceI {

	@Autowired
	NoticeBoardDAOI noticeBoardDao;

	// 게시글 전체 목록 조회하기
	@Override
	public List<NoticeBoardVO> selectAll() throws Exception {
		return noticeBoardDao.selectAll();
	}

	// 클릭한 게시글 상세조회하기
	@Override
	public NoticeBoardVO boardDetail(int n_num) {
		return noticeBoardDao.boardDetail(n_num);
	}

	// 게시글 삭제하기
	@Override
	public boolean boardDelete(int n_num) {

		if (noticeBoardDao.boardDelete(n_num) > 0) {
			return true;
		}
		return false;
	}

	// 게시물 작성하기
	@Override
	public void create(NoticeBoardVO vo) throws Exception {
		noticeBoardDao.create(vo);
	}

	// 게시글 수정하기
	public void update(NoticeBoardVO vo) throws Exception {
		noticeBoardDao.update(vo);
	}

	// 조회수 증가
	@Override
	public void hitUp(int n_num) {
		noticeBoardDao.update(n_num);
	}

	// 게시글 검색하기
	// 게시글 전체 목록 boardDAO.listAll메서드 호출
	@Override
	public List<NoticeBoardVO> listAll(String searchOption, String keyword) throws Exception {
		return noticeBoardDao.listAll(searchOption, keyword);
	}

	// 페이징처리
	@Override
	public int countBoard() throws Exception {
		return noticeBoardDao.countBoard();
	}

	@Override
	public List<NoticeBoardVO> selectBoard(PagingVO vo) throws Exception {

		return noticeBoardDao.selectBoard(vo);
	}
}
