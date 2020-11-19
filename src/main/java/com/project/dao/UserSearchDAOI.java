package com.project.dao;

import java.util.List;

import com.project.vo.PagingVO;
import com.project.vo.PagingVO1;
import com.project.vo.UserVO;

public interface UserSearchDAOI {
	//전체 회원수
	public int countUser() throws Exception;
		
	//전체 회원 목록
	public List<UserVO> selectUser(PagingVO vo) throws Exception;
	
	
	//일반 회원수
	public int countUser1(int user_deptno) throws Exception;
	//일반 회원 목록
	public List<UserVO> selectUser1(PagingVO1 vo1) throws Exception;
		
	
	//회원 삭제(관리자)
	public int deleteUser(String user_id) throws Exception;
	
	//회원정보 수정
	public void updateUser(UserVO vo) throws Exception;
	
	//회원정보 상세조회(수정하기 위함)
	public UserVO userDetail(String user_id);

}
