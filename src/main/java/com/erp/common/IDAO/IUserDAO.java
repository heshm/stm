package com.erp.common.IDAO;
import java.util.List;

import com.erp.common.model.User;

public interface IUserDAO {
	
	public static final String SELECT_ONE_USER = "selectOneUser";
	
	public static final String UPDATE_ONE_USER = "updateOneUser";
	
	public static final String SELECT_USER_LIST = "selectUserList";
	
	public static final String INSERT_ONE_USER = "insertOneUser";
	
	public static final String DELETE_ONE_USER = "deleteOneUser";
	
	public abstract int deleteByPrimaryKey(String userId);

	public abstract User selectByPrimaryKey(String userId);

	public abstract int updateOneUser(User user);
	
	public abstract List<User> selectUserList();
	
	public abstract int insertOneUser(User user);

}
