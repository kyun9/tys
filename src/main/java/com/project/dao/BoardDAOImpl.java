package com.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.vo.BoardVO;
import com.project.vo.PagingVO;

// @Repository : 현재 클래스를 스프링에서 관리하는 dao bean으로 설정
@Repository
public class BoardDAOImpl implements BoardDAOI {

	@Autowired
	private SqlSession sqlSession;

	// 게시판 글 모두 불러오기
	@Override
	public List<BoardVO> selectAll() throws Exception {
		return sqlSession.selectList("board.selectAll");
	}

	// 게시글 조회하기
	@Override
	public BoardVO boardDetail(int b_num) {
		return sqlSession.selectOne("board.boardDetail", b_num);
	}

	// 게시글 삭제하기
	@Override
	public int boardDelete(int b_num) {
		return sqlSession.delete("board.boardDelete", b_num);
	}

	// 게시글 등록하기
	@Override
	public void create(BoardVO vo) throws Exception {
		sqlSession.insert("board.insert", vo);
	}

	// 게시글 수정하기
	@Override
	public void update(BoardVO vo) {
		sqlSession.update("board.updateArticle", vo);
	}

	// 조회수 증가하기
	@Override
	public void update(int b_num) {
		sqlSession.update("board.updateHit", b_num);
	}

	// 게시글 검색하기
	@Override
	public List<BoardVO> listAll(String searchOption, String keyword , String start, String end) {
		// 검색옵션, 키워드 맵에 저장
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("board.listAll", map);
	}

	@Override
	public List<BoardVO> searchTypeList(String searchOption, String keyword, String start, String end) {
		// 검색옵션, 키워드 맵에 저장
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("board.listAll", map);
	}

	// 전체 게시물 갯수
	@Override
	public int countBoard() throws Exception {
		int count = sqlSession.selectOne("board.selectPageCount", null);

		return count;
	}

	// 검색 게시물 갯수
//	@Override
//	public int countSearchBoard() throws Exception {
//		int count = sqlSession.selectOne("board.listAllCount", null);
//	   
//		return count;
//	}
	// 게시물 목록
	@Override
	public List<BoardVO> selectBoard(PagingVO vo) throws Exception {
		return sqlSession.selectList("board.selectBoard", vo);
	}

	@Override
	public List<BoardVO> searchTeam(int num) {
		return sqlSession.selectList("board.searchTeam", num);
	}

}