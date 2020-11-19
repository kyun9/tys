package com.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.vo.PagingVO;
import com.project.vo.PagingVO1;
import com.project.vo.UserVO;

//@Repository : 현재 클래스를 스프링에서 관리하는 dao bean으로 설정
@Repository
public class UserSearchDAOImpl implements UserSearchDAOI {
	
	@Autowired
	private SqlSession sqlSession;
	
	//전체 회원수
	@Override
	public int countUser() throws Exception {
		return (Integer)sqlSession.selectOne("userSearchMapper.UserCount");
	}
	
	//전체 회원 목록
	@Override
	public List<UserVO> selectUser(PagingVO vo) throws Exception {
	   return sqlSession.selectList("userSearchMapper.selectUser",vo);
	}
	
	//일반 회원수
	@Override
	public int countUser1(int user_deptno) throws Exception {
		return (Integer)sqlSession.selectOne("userSearchMapper.UserCount1",user_deptno);
	}
	//일반 회원 목록
		@Override
		public List<UserVO> selectUser1(PagingVO1 vo1) throws Exception {
		   return sqlSession.selectList("userSearchMapper.selectUser1",vo1);
		}

	//회원 삭제
	@Override
	public int deleteUser(String user_id) throws Exception {
		
		return sqlSession.delete("userSearchMapper.deleteUser", user_id);
	}
	
	
	//회원 상세조회
	@Override
	public UserVO userDetail(String user_id) {
		return sqlSession.selectOne("userSearchMapper.selectUpdateUser",user_id);
	}
	
	//회원 수정
		@Override
		public void updateUser(UserVO vo) throws Exception{
			sqlSession.update("userSearchMapper.updateUser",vo);
		}
	
}
