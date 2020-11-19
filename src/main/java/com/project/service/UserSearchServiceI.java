package com.project.service;

import java.util.List;

import com.project.vo.PagingVO;
import com.project.vo.PagingVO1;
import com.project.vo.UserVO;



public interface UserSearchServiceI {
	
	//페이징처리
	//전체 회원 수
	public int countUser() throws Exception;
	   
	//페이징 처리한 회원 목록
	public List<UserVO> selectUser(PagingVO vo) throws Exception;
	
	//일반 회원 수
	public int countUser1(int user_deptno) throws Exception;
	//페이징 처리한 일반회원 목록
	public List<UserVO> selectUser1(PagingVO1 vo1) throws Exception;
	
	// 회원 삭제하기
	public boolean deleteUser(String user_id) throws Exception;
	
	//회원 수정하기
	public void updateUser(UserVO vo) throws Exception;
	
	//수정할 회원 상세조회
	public UserVO userDetail(String user_id);

}
