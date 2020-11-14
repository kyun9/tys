package com.project.tys;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.vo.UserVO;

@Controller
public class MypageController {
	@Autowired
	UserVO vo;

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public ModelAndView register(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		UserVO user = (UserVO) request.getSession().getAttribute("userInfo");
		
		mav.addObject("userInfo", user);
		mav.setViewName("/auth/mypage");
		
		return mav;
	}

}
