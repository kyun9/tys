package com.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.vo.NoticeBoardVO;
import com.project.vo.PagingVO;

// @Repository : 현재 클래스를 스프링에서 관리하는 dao bean으로 설정
@Repository
public class NoticeBoardDAOImpl implements NoticeBoardDAOI {

	@Autowired
	private SqlSession sqlSession;

	// 게시판 글 모두 불러오기
	@Override
	public List<NoticeBoardVO> selectAll() throws Exception {
		return sqlSession.selectList("noticeBoard.selectAll");
	}

	// 게시글 조회하기
	@Override
	public NoticeBoardVO boardDetail(int n_num) {
		return sqlSession.selectOne("noticeBoard.noticeBoardDetail", n_num);
	}

	// 게시글 삭제하기
	@Override
	public int boardDelete(int n_num) {
		return sqlSession.delete("noticeBoard.noticeBoardDelete", n_num);
	}

	// 게시글 등록하기
	@Override
	public void create(NoticeBoardVO vo) throws Exception {
		sqlSession.insert("noticeBoard.insert", vo);
	}

	// 게시글 수정하기
	@Override
	public void update(NoticeBoardVO vo) {
		sqlSession.update("noticeBoard.updateArticle", vo);
	}

	// 조회수 증가하기
	@Override
	public void update(int n_num) {
		sqlSession.update("noticeBoard.updateHit", n_num);
	}

	// 게시글 검색하기
	@Override
	public List<NoticeBoardVO> listAll(String searchOption, String keyword) {
		// 검색옵션, 키워드 맵에 저장
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectList("noticeBoard.listAll", map);
	}

	@Override
	public List<NoticeBoardVO> searchTypeList(String searchOption, String keyword) {
		// 검색옵션, 키워드 맵에 저장
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectList("noticeBoard.listAll", map);
	}

	// 전체 게시물 갯수
	@Override
	public int countBoard() throws Exception {
		int count = sqlSession.selectOne("noticeBoard.selectPageCount", null);

		return count;
	}

	// 게시물 목록
	@Override
	public List<NoticeBoardVO> selectBoard(PagingVO vo) throws Exception {
		return sqlSession.selectList("noticeBoard.selectBoard", vo);
	}

}