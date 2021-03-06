package com.erp.common.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import javax.jws.WebService;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.springframework.transaction.annotation.Transactional;

import com.erp.common.IDAO.IUserDAO;
import com.erp.common.IService.IUserService;
import com.erp.common.model.User;
import com.erp.common.util.Const;

@Transactional
public class UserService implements IUserService {
	
	private IUserDAO userDAO;

	public IUserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(IUserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public User getOneUser(String userId) {
		return userDAO.selectByPrimaryKey(userId);
	}

	public List<String> getRoles(String userId) {
		User user = userDAO.selectByPrimaryKey(userId);
		String ro = user.getRole();
		List<String> roles = new ArrayList<String>();
		if(ro.contains(",")){
			String sroles[] = user.getRole().split(",");
			for(String s:sroles){
				roles.add(s.trim());
			}
		}else{
			roles.add(ro);
		}
		
		return roles;
	}

	@Override
	public int changePass(User user, String oldPass, String newPass) {
		String md5OldPass = new Md5Hash(oldPass).toString();
		if(md5OldPass.equals(user.getPassword())){
			String md5NewPass = new Md5Hash(newPass).toString();
			user.setPassword(md5NewPass);
			userDAO.updateOneUser(user);
		}else{
			throw new RuntimeException("旧密码输入错误,请重新输入!");
		}
		return 0;
	}

	@Override
	public List<User> getUserList() {
		// TODO Auto-generated method stub
		return userDAO.selectUserList();
	}

	@Override
	public int addOneUser(User user) {
		User tbUser = userDAO.selectByPrimaryKey(user.getUserId());
		if(null != tbUser){
			throw new RuntimeException("用户已经存在!");
		}
		String password = new Md5Hash(Const.DEFAULT_PASS_WORD).toString();
		user.setPassword(password);
		user.setStatus("1");
		user.setRole("stockman");
		return userDAO.insertOneUser(user);
	}

	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		User tbUser = userDAO.selectByPrimaryKey(user.getUserId());
		user.setPassword(tbUser.getPassword());
		if(null == user.getRole()){
			user.setRole(tbUser.getRole());
		}
		return userDAO.updateOneUser(user);
	}

	@Override
	public int deleteOneUser(String userId) {
		// TODO Auto-generated method stub
		if(userId.equals("admin")){
			throw new RuntimeException("系统管理员账户不可删除!");
		}
		return userDAO.deleteByPrimaryKey(userId);
	}

	@Override
	public int resetPass(User user, String userId) {
		if(!user.getUserId().equals("admin")){
			throw new RuntimeException("非系统管理员账户不可重置他人密码!");
		}
		if(user.getUserId().equals(userId)){
			throw new RuntimeException("不可重置本人密码!");
		}
		User tbUser = userDAO.selectByPrimaryKey(userId);
		if(null != tbUser){
			String password = new Md5Hash(Const.DEFAULT_PASS_WORD).toString();
			tbUser.setPassword(password);
			return userDAO.updateOneUser(tbUser);
		}else{
			return Const.FAILURE;
		}
	}

	@Override
	public int login(String userName, String password) {
		char[] passwd = new Md5Hash(password).toString().toCharArray();
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken();
		token.setUsername(userName);
		token.setPassword(passwd);
		token.setRememberMe(false);
		subject.login(token);
		
		return Const.SUCCESS;
	}

	

}
