package com.project.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Service
public class ImageUploadService {
	@Autowired
	UserVO vo;
	@Autowired
	ServletContext context;

	//회원가입할때 이미지 경로 및 저장
	public void getUsersImagePath(MultipartFile img) throws IOException {
		String fileName = img.getOriginalFilename();
		
		System.out.println("이미지 저장되는 경로 : "+context.getRealPath("/") + "resources/users/" + fileName);
		File f = new File(context.getRealPath("/") + "resources/users/" + fileName);
		FileOutputStream fos = new FileOutputStream(f);
		
		fos.write(img.getBytes());
		fos.close();
	}
	
	
	//이미지 ajax 임시 업로드
	public void tempImagePath(MultipartFile img) throws IOException {
		String fileName = img.getOriginalFilename();
		
		System.out.println("이미지 저장되는 경로 : "+context.getRealPath("/") + "resources/temp/" + fileName);
		String filePath=context.getRealPath("/") + "resources/temp/" + fileName;
		File f = new File(filePath);
		FileOutputStream fos = new FileOutputStream(f);
		
		fos.write(img.getBytes());
		fos.close();
	}
}
