package com.project.vo;

import org.springframework.stereotype.Repository;

@Repository
public class UserVO {
	String user_id;
	String user_pwd;
	String user_name;
	String user_email;
	String user_image;
	int user_deptno;
	int user_position;
	int user_checkn;
	
	String user_deptname;
	String user_posiname;
	
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_image() {
		return user_image;
	}
	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}
	public int getUser_deptno() {
		return user_deptno;
	}
	public void setUser_deptno(int user_deptno) {
		this.user_deptno = user_deptno;
	}
	
	public int getUser_position() {
		return user_position;
	}
	public void setUser_position(int user_position) {
		this.user_position = user_position;
	}
	public int getUser_checkn() {
		return user_checkn;
	}
	public void setUser_checkn(int user_checkn) {
		this.user_checkn = user_checkn;
	}
	public String getUser_deptname() {
		return user_deptname;
	}
	public void setUser_deptname(String user_deptname) {
		this.user_deptname = user_deptname;
	}
	public String getUser_posiname() {
		return user_posiname;
	}
	public void setUser_posiname(String user_posiname) {
		this.user_posiname = user_posiname;
	}
	
	
	
	public UserVO() {
		
	}
	public UserVO(String user_id, String user_pwd, String user_name, String user_email, String user_image,
			int user_deptno, int user_position, int user_checkn) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_image = user_image;
		this.user_deptno = user_deptno;
		this.user_position = user_position;
		this.user_checkn = user_checkn;
	}
	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", user_pwd=" + user_pwd + ", user_name=" + user_name + ", user_email="
				+ user_email + ", user_image=" + user_image + ", user_deptno=" + user_deptno + ", user_position="
				+ user_position + ", user_checkn=" + user_checkn + ", user_deptname=" + user_deptname
				+ ", user_posiname=" + user_posiname + "]";
	}
	
	
	
}
