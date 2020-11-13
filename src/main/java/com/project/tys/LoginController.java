package com.project.tys;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.service.LoginService;
import com.project.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {
	@Autowired
	LoginService service;
	@Autowired
	UserVO vo;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("auth/login");
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/loginChk", method = RequestMethod.POST)
	public Object loginConfirm(UserVO vo) {
		
		Map<String, Integer> map = (Map<String, Integer>) service.checkUser(vo);
		
		return map;
	}
}
