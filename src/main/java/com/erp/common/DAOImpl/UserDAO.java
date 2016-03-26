package com.erp.common.DAOImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.erp.common.IDAO.IUserDAO;
import com.erp.common.model.User;

public class UserDAO implements IUserDAO{
	
    private SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int deleteByPrimaryKey(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.delete(DELETE_ONE_USER, userId);
	}

	public User selectByPrimaryKey(String userId) {
		return sqlSession.selectOne(SELECT_ONE_USER, userId);
	}

	@Override
	public int updateOneUser(User user) {
		// TODO Auto-generated method stub
		return sqlSession.update(UPDATE_ONE_USER, user);
	}

	@Override
	public List<User> selectUserList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(SELECT_USER_LIST);
	}

	@Override
	public int insertOneUser(User user) {
		// TODO Auto-generated method stub
		return sqlSession.insert(INSERT_ONE_USER,user);
	}



}
