package com.project.tys;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.RegisterDAO;
import com.project.service.ImageUploadService;
import com.project.service.RegisterService;
import com.project.vo.UserVO;

@Controller
public class RegisterController {
	@Autowired
	RegisterDAO dao;
	@Autowired
	RegisterService service;
	@Autowired
	ImageUploadService imageUploadService;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register() {
		return "/auth/register";
	}

	//회원등록하기
	@RequestMapping(value = "/registerUser", method = RequestMethod.POST)
	public ModelAndView registerUser(String id, String pwd, MultipartFile img) throws IOException {
		String fileName = img.getOriginalFilename();

		UserVO user = new UserVO();
		user.setId(id);
		user.setPwd(pwd);
		
		System.out.println(fileName+"///fileName");
		//이미지 파일을 업로드안했을때
		if(fileName.equals("")) {
			user.setImg("default.png");
		}else { //이미지 파일 업로드되었을 때
			user.setImg(fileName);
			imageUploadService.getUsersImagePath(img);
		}
		ModelAndView mav = new ModelAndView();
		dao.setUser(user);
		mav.setViewName("redirect:/");
		return mav;
	}

	//아이디 중복체크
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.GET)
	public  int loginConfirm(String id) {
		int idChkNum = service.idChk(id);
		return idChkNum;
	}
	
	//임시 이미지 ajax통신
	@ResponseBody
	@RequestMapping(value = "/imgChk", method = RequestMethod.POST ,produces = "application/text; charset=UTF-8")
	public  String  imgConfirm(MultipartFile img) throws IOException {
		String fileName = img.getOriginalFilename();
		imageUploadService.setTempImage(img);

		return fileName;
	}
	
	
	//이미지 ajax통신
		@ResponseBody
		@RequestMapping(value = "/deleteImg", method = RequestMethod.POST ,produces = "application/text; charset=UTF-8")
		public  String  deleteImg(String url) throws IOException {
			System.out.println(url);
			imageUploadService.deleteTempImage(url);;
			return "사진이 삭제되었습니다.";
		}
}
