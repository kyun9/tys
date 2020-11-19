package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.UserSearchDAOI;
import com.project.vo.PagingVO;
import com.project.vo.PagingVO1;
import com.project.vo.UserVO;

@Service
public class UserSearchServiceImpl implements UserSearchServiceI {
	@Autowired
	UserSearchDAOI userSearchDao;
	
	//페이징처리
	@Override
	public int countUser() throws Exception {
		return userSearchDao.countUser();
	}
	@Override
	public int countUser1(int user_deptno) throws Exception {
		return userSearchDao.countUser1(user_deptno);
	}
	//회원조회
	@Override
	public List<UserVO> selectUser(PagingVO vo) throws Exception {
		
		return userSearchDao.selectUser(vo);
	}
	
	//일반회원조회
	@Override
	public List<UserVO> selectUser1(PagingVO1 vo1) throws Exception {
		return userSearchDao.selectUser1(vo1);
	}
	
	//회원 삭제
	@Override
	public boolean deleteUser(String user_id) throws Exception {

		if(userSearchDao.deleteUser(user_id)>0) {
			return true;
		}
		return false;
	}
	//회원 수정
	@Override
	public void updateUser(UserVO vo) throws Exception{
		userSearchDao.updateUser(vo);
	}
	
	//수정할 회원 상세조회
	@Override
	public UserVO userDetail(String user_id) {
		return userSearchDao.userDetail(user_id);
	}

}
