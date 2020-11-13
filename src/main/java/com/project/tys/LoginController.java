package com.project.tys;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.LoginDAO;
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
	@Autowired
	LoginDAO dao;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("auth/login");
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/loginChk", method = RequestMethod.POST)
	public Object loginConfirm(HttpServletRequest request, HttpServletResponse response, UserVO vo) {
		Map<String, Integer> map = (Map<String, Integer>) service.checkUser(vo);

		if (map.get("status") == 9) {
			UserVO user = dao.getUser(vo);
			request.getSession().setMaxInactiveInterval(6000);
			request.getSession().setAttribute("userInfo", user);
		}
		return map;
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response, UserVO vo) {
		request.getSession().removeAttribute("userInfo");
		return "home";
	}

}
