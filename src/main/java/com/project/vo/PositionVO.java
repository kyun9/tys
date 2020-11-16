package com.project.vo;

import org.springframework.stereotype.Repository;

@Repository
public class PositionVO {
	int p_num;
	String p_name;

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	@Override
	public String toString() {
		return "PositionVO [p_num=" + p_num + ", p_name=" + p_name + "]";
	}
	

}
