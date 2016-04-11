package com.erp.common.IService;

import java.util.List;
import javax.jws.WebService;

import com.erp.common.model.User;

@WebService
public interface IUserService {
	
	public abstract User getOneUser(String userId);
	
	public abstract List<String> getRoles(String userId);
	
	public abstract int changePass(User user,String oldPass,String newPass);
	
	public abstract List<User> getUserList();
	
	public abstract int addOneUser(User user);
	
	public abstract int updateUser(User user);
	
	public abstract int deleteOneUser(String userId);
	
	public abstract int resetPass(User user,String userId);
	
	public abstract int login(String userName,String password);

}
