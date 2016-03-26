package com.erp.report.DAOImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.erp.report.IDAO.IInventoryReportDAO;

public class InventoryReportDAO implements IInventoryReportDAO {
	
    private SqlSession sqlSession;
	

	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List selectPageList(Map paramMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(SELECT_INVENTORY_REPORT_PAGEDATA, paramMap);
	}

	@Override
	public int selectTotleCount(Map paramMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(SELECT_INVENTORY_REPORT_PAGECNT, paramMap);
	}

}
