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
		vo = session.selectOne(statement, vo.getId());
		return vo;
	}


	// 로그인실패 카운트
	public void getStep2(UserVO vo) {
		String statement = "LoginMapper.getStep2";
		session.update(statement, vo.getId());
	}

	
}
