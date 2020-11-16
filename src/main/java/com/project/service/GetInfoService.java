package com.project.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.vo.DeptVO;
import com.project.vo.PositionVO;

/**
 * Handles requests for the application home page.
 */
@Service
public class GetInfoService {
	@Autowired
	SqlSession session = null;
	
	public List<DeptVO> getDeptList() {
		String statement = "getInfoMapper.getDept";
		List<DeptVO> list = session.selectList(statement);
		return list;
	}

	public List<PositionVO> getPositionList() {
		String statement = "getInfoMapper.getPosition";
		List<PositionVO> list = session.selectList(statement);
		return list;
	}
}
