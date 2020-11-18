package com.project.tys;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.RegisterDAO;
import com.project.service.ImageUploadService;
import com.project.vo.UserVO;

@Controller
public class MypageController {
	@Autowired
	UserVO vo;
	@Autowired
	RegisterDAO dao;
	@Autowired
	ImageUploadService imageUploadService;

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public ModelAndView register(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		UserVO user = (UserVO) request.getSession().getAttribute("userInfo");

		mav.addObject("userInfo", user);
		mav.setViewName("/auth/mypage");

		return mav;
	}

	@RequestMapping(value = "/updateUserInfo", method = RequestMethod.POST)
	public ModelAndView updateUserInfo(HttpServletRequest request, HttpServletResponse response, String user_pwd,
			String user_email, MultipartFile user_image) throws IOException {
		ModelAndView mav = new ModelAndView();
		UserVO user = (UserVO) request.getSession().getAttribute("userInfo");
		
		System.out.println(user_pwd);
		//예외처리 필요
		if(!user_pwd.equals("") && user_pwd !=null) {
			user.setUser_pwd(user_pwd);
		}
		user.setUser_email(user_email);
		
		String fileName = user_image.getOriginalFilename();
		if(fileName.equals("")) {
			user.setUser_image("default.png");
		}else { //이미지 파일 업로드되었을 때
			user.setUser_image(fileName);
			imageUploadService.getUsersImagePath(user_image);
		}
		System.out.println(user);
		dao.updateUser(user);
		System.out.println();
		mav.setViewName("redirect:/board/list");

		return mav;
	}
}
