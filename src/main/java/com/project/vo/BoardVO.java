package com.project.vo;

import java.sql.Timestamp;

public class BoardVO extends PagingVO{
	
	private int b_num;			// 글번호
	private String b_title;		// 제목
	private String b_content;	// 내용
	private Timestamp b_date;	// 등록일자
	private int b_cnt;			// 조회수
	private String b_userid;	// 사용자id
	private int b_type;			// 부서타입
	private Timestamp b_update;	// 수정일자
	private String b_updateuser;// 수정자
	private String b_deptName;	// 부서명
	
	
	
	public BoardVO() {
		super();
	}
	
	public BoardVO(int b_num, String b_title, String b_content, Timestamp b_date, int b_cnt, String b_userid,
			int b_type, Timestamp b_update, String b_updateuser, String b_deptName) {
		super();
		this.b_num = b_num;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_date = b_date;
		this.b_cnt = b_cnt;
		this.b_userid = b_userid;
		this.b_type = b_type;
		this.b_update = b_update;
		this.b_updateuser = b_updateuser;
		this.b_deptName = b_deptName;
	}

	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public Timestamp getB_date() {
		return b_date;
	}
	public void setB_date(Timestamp b_date) {
		this.b_date = b_date;
	}
	public int getB_cnt() {
		return b_cnt;
	}
	public void setB_cnt(int b_cnt) {
		this.b_cnt = b_cnt;
	}
	public String getB_userid() {
		return b_userid;
	}
	public void setB_userid(String b_userid) {
		this.b_userid = b_userid;
	}
	public int getB_type() {
		return b_type;
	}
	public void setB_type(int b_type) {
		this.b_type = b_type;
	}
	public Timestamp getB_update() {
		return b_update;
	}
	public void setB_update(Timestamp b_update) {
		this.b_update = b_update;
	}
	public String getB_updateuser() {
		return b_updateuser;
	}
	public void setB_updateuser(String b_updateuser) {
		this.b_updateuser = b_updateuser;
	}

	public String getB_deptName() {
		return b_deptName;
	}

	public void setB_deptName(String b_deptName) {
		this.b_deptName = b_deptName;
	}

	@Override
	public String toString() {
		return "BoardVO [b_num=" + b_num + ", b_title=" + b_title + ", b_content=" + b_content + ", b_date=" + b_date
				+ ", b_cnt=" + b_cnt + ", b_userid=" + b_userid + ", b_type=" + b_type + ", b_update=" + b_update
				+ ", b_updateuser=" + b_updateuser + ", b_deptName=" + b_deptName + "]";
	}
	
	
	
}