package com.erp.common.DAOImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.erp.common.IDAO.ISupplierDAO;
import com.erp.common.model.Supplier;

public class SupplierDAO implements ISupplierDAO {

    private SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<Supplier> selectSupplierList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(SELECT_MUL_SUPPLIER);
	}

	@Override
	public Supplier selectOneSupplier(String supplierId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(SELECT_ONE_SUPPLIER,supplierId);
	}

	@Override
	public int insertOneSupplier(Supplier supplier) {
		// TODO Auto-generated method stub
		return sqlSession.insert(INSERT_ONE_SUPPLIER,supplier);
	}

	@Override
	public int updateOneSupplier(Supplier supplier) {
		// TODO Auto-generated method stub
		return sqlSession.update(UPDATE_ONE_SUPPLIER, supplier);
	}

	@Override
	public int deleteOneSupplier(String supplierId) {
		// TODO Auto-generated method stub
		return sqlSession.delete(DELETE_ONE_SUPPLIER, supplierId);
	}

}
