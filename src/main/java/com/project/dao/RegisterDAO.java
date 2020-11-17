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

	//아이디 중복체크
	public int checkUser(String id) {
		String statement = "RegisterMapper.checkUser";
		int result=0;
		if(session.selectOne(statement, id)!=null) {
			result=2;
		}else {
			result=1;
		}
		return result;
	}
	
	public void updateUser(UserVO vo) {
		String statement = "RegisterMapper.updateUser";
		System.out.println("registerdao"+ vo);
		if(session.update(statement, vo) !=1) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
	}
}
