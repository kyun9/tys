package com.project.tys;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.RegisterDAO;
import com.project.service.RegisterService;
import com.project.vo.UserVO;

@Controller
public class RegisterController {
	@Autowired
	RegisterDAO dao;
	@Autowired
	RegisterService service;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(HttpServletRequest request, HttpServletResponse response) {
		return "/auth/register";
	}

	@RequestMapping(value = "/registerUser", method = RequestMethod.POST)
	public ModelAndView registerUser(HttpServletRequest request, HttpServletResponse response, UserVO vo) {
		System.out.println(vo);
		ModelAndView mav = new ModelAndView();
		dao.setUser(vo);
		mav.setViewName("redirect:/");
		return mav;
	}

	@RequestMapping(value = "/idChk", method = RequestMethod.GET)
	public @ResponseBody  int loginConfirm(HttpServletRequest request, HttpServletResponse response, String id) {
		int idChkNum = service.idChk(id);
		return idChkNum;
	}

}
