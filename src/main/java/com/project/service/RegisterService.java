package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.RegisterDAO;
import com.project.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Service
public class RegisterService {
	@Autowired
	RegisterDAO dao;
	@Autowired
	UserVO vo;

	public int idChk(String id) {
		int check = dao.checkUser(id);
		return check;
	}
}
