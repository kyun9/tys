package com.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.vo.*;

@Repository
public class LoginDAO {
	@Autowired
	SqlSession session = null;

	// 회원정보 가져오기
	public UserVO getUser(UserVO vo) {
		String statement = "LoginMapper.getStep1";
		vo = session.selectOne(statement, vo.getUser_id());
		return vo;
	}
	public PositionVO getPosition(UserVO vo) {
		String statement = "LoginMapper.getPositionName";
		PositionVO position = session.selectOne(statement, vo.getUser_id());
		return position;
	}
	public DeptVO getDept(UserVO vo) {
		String statement = "LoginMapper.getDeptName";
		DeptVO dept = session.selectOne(statement, vo.getUser_id());
		System.out.println(dept);
		return dept;
	}
	// 로그인실패 카운트
	public void getStep2(UserVO vo) {
		String statement = "LoginMapper.getStep2";
		session.update(statement, vo.getUser_id());
	}

	// 로그인 성공하면 횟수 초기화하기
	public void updateChk(UserVO vo) {
		String statement = "LoginMapper.updateChk";
		session.update(statement, vo.getUser_id());
	}
}
