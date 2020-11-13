package com.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.vo.*;

@Repository
public class RegisterDAO {
	@Autowired
	SqlSession session = null;

	// 회원등록
	public void setUser(UserVO vo) {
		String statement = "RegisterMapper.setUser";
		session.insert(statement, vo);
	}

}
