package com.project.vo;

import org.springframework.stereotype.Repository;

@Repository
public class DeptVO {
	int d_num;
	String d_name;

	public int getD_num() {
		return d_num;
	}

	public void setD_num(int d_num) {
		this.d_num = d_num;
	}

	public String getD_name() {
		return d_name;
	}

	public void setD_name(String d_name) {
		this.d_name = d_name;
	}

	@Override
	public String toString() {
		return "DeptVO [d_num=" + d_num + ", d_name=" + d_name + "]";
	}
	

}
