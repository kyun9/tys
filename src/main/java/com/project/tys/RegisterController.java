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
import com.project.service.GetInfoService;
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
	@Autowired
	GetInfoService getInfoService;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView register() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("auth/register");
		mav.addObject("dept", getInfoService.getDeptList());
		mav.addObject("position", getInfoService.getPositionList());
		return mav;
	}

	//회원등록하기
	@RequestMapping(value = "/registerUser", method = RequestMethod.POST)
	public ModelAndView registerUser(String user_id, String user_pwd, String user_name, String user_email, int user_deptno, int user_position, MultipartFile user_image) throws IOException {
		String fileName = user_image.getOriginalFilename();

		UserVO user = new UserVO();
		user.setUser_id(user_id);;
		user.setUser_pwd(user_pwd);
		user.setUser_name(user_name);
		user.setUser_email(user_email);
		user.setUser_deptno(user_deptno);
		user.setUser_position(user_position);
		
		System.out.println(fileName+"///fileName");
		//이미지 파일을 업로드안했을때
		if(fileName.equals("")) {
			user.setUser_image("default.png");
		}else { //이미지 파일 업로드되었을 때
			user.setUser_image(fileName);
			imageUploadService.getUsersImagePath(user_image);
		}
		System.out.println(user);
		ModelAndView mav = new ModelAndView();
		dao.setUser(user);
		mav.addObject("text", "성공적으로 수정되었습니다.");
		mav.setViewName("redirect:/board/list");
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
	public  String  imgConfirm(MultipartFile user_image) throws IOException {
		String fileName = user_image.getOriginalFilename();
		imageUploadService.setTempImage(user_image);

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
