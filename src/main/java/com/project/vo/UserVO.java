package com.project.vo;

import org.springframework.stereotype.Repository;

@Repository
public class UserVO {
	String id;
	String pwd;
	int checkn;
	String img;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getCheckn() {
		return checkn;
	}
	public void setCheckn(int checkn) {
		this.checkn = checkn;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", pwd=" + pwd + ", checkn=" + checkn + ", img=" + img + "]";
	}
}
