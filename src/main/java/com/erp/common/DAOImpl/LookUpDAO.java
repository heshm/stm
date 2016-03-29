package com.erp.common.DAOImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.erp.common.IDAO.ILookUpDAO;
import com.erp.common.model.form.SimpleLookUpDataSet;

public class LookUpDAO implements ILookUpDAO {
	
    private SqlSession sqlSession;
	

	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<SimpleLookUpDataSet> selectSimpleResultList(String sqlId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(sqlId);
	}

}
