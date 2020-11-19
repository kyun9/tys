package com.project.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class NoticeBoardVO {

	private int n_num;
	private String n_title;
	private String n_content;
	private Timestamp n_date;
	private int n_cnt;
	private String n_userid;
	private int n_type;
	private Timestamp n_update;
	private String n_updateuser;
	private String n_deptName; // 부서명

	public NoticeBoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NoticeBoardVO(int n_num, String n_title, String n_content, Timestamp n_date, int n_cnt, String n_userid,
			int n_type, Timestamp n_update, String n_updateuser, String n_deptName) {
		super();
		this.n_num = n_num;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_date = n_date;
		this.n_cnt = n_cnt;
		this.n_userid = n_userid;
		this.n_type = n_type;
		this.n_update = n_update;
		this.n_updateuser = n_updateuser;
		this.n_deptName = n_deptName;
	}

	public int getN_num() {
		return n_num;
	}

	public void setN_num(int n_num) {
		this.n_num = n_num;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public Timestamp getN_date() {
		return n_date;
	}

	public void setN_date(Timestamp n_date) {
		this.n_date = n_date;
	}

	public int getN_cnt() {
		return n_cnt;
	}

	public void setN_cnt(int n_cnt) {
		this.n_cnt = n_cnt;
	}

	public String getN_userid() {
		return n_userid;
	}

	public void setN_userid(String n_userid) {
		this.n_userid = n_userid;
	}

	public int getN_type() {
		return n_type;
	}

	public void setN_type(int n_type) {
		this.n_type = n_type;
	}

	public Timestamp getN_update() {
		return n_update;
	}

	public void setN_update(Timestamp n_update) {
		this.n_update = n_update;
	}

	public String getN_updateuser() {
		return n_updateuser;
	}

	public void setN_updateuser(String n_updateuser) {
		this.n_updateuser = n_updateuser;
	}

	public String getN_deptName() {
		return n_deptName;
	}

	public void setN_deptName(String n_deptName) {
		this.n_deptName = n_deptName;
	}

}