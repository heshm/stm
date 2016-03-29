package com.erp.common.action;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import com.erp.common.IService.IUserService;
import com.erp.common.model.User;

public class UserAction extends CmAction{
	
	private String oldpass;
	private String newpass;
	private String message;
	private String userId;
	private IUserService userService;
	private List<User> userList;
	
	@RequiresRoles(value={"sysadmin"}, logical= Logical.OR)
	public String init(){
		userList = userService.getUserList();
		return SUCCESS;
	}
	
	public String changePass(){
		//System.out.println(oldpass);
		//System.out.println(newpass);
		Subject subject = SecurityUtils.getSubject();
	    Session session = subject.getSession();
	    
	    User user = (User)session.getAttribute("user");
	    try{
	    	userService.changePass(user, oldpass, newpass);
	    	subject.logout();
	    	message = "密码修改成功,请重新登录!";
	    }catch(RuntimeException e){
	    	message = e.getMessage();
	    }
		return SUCCESS;
	}
	
	public String delete(){
		try{
	    	userService.deleteOneUser(userId);
	    	this.addActionMessage("用户删除成功!");
	    }catch(RuntimeException e){
	    	this.addActionError(e.getMessage());
	    }
		userList = userService.getUserList();
		return SUCCESS;
	}
	
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	
	public String getOldpass() {
		return oldpass;
	}

	public void setOldpass(String oldpass) {
		this.oldpass = oldpass;
	}

	public String getNewpass() {
		return newpass;
	}

	public void setNewpass(String newpass) {
		this.newpass = newpass;
	}
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
