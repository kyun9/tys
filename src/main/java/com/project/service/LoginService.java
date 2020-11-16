package com.project.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.LoginDAO;
import com.project.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Service
public class LoginService {
	@Autowired
	LoginDAO dao;
	@Autowired
	UserVO vo;

	public Object checkUser(UserVO vo) {
		UserVO user = dao.getUser(vo);
		int result = 0;
		int cnt = 0;
		if (user != null) {
			// 비활성화 여부 확인
			if (user.getUser_checkn() >= 5) {
				result=10;
			} else {
				if (vo.getUser_pwd().equals(user.getUser_pwd())) {
					// 로그인 성공 - 체크카운트 초기화
					dao.updateChk(vo);
					result = 9;
				} else {
					// 비밀번호 틀림
					// 로그인실패 횟수 확인
					cnt = user.getUser_checkn() + 1;
					if (cnt > 5) {
						result = 3;
					} else {
						// 로그인실패횟수 증가
						dao.getStep2(vo);
						result = 2;
					}
				}
			}
		} else {
			// 아이디 존재하지않음
			result = 1;
		}
		Map<String, Integer> map = new HashMap<>();
		map.put("status", result);
		map.put("checkCnt", cnt);

		return map;
	}
}
