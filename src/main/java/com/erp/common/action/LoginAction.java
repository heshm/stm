package com.erp.common.action;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import com.erp.common.IService.IUserService;
import com.erp.common.model.User;
import com.erp.common.util.Const;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport{
	
	private String userName;
	private String passWord;
	private IUserService userService;
	
	public String login(){
		try{
			userService.login(userName, passWord);
		}catch(Exception e){
			this.addActionError(e.getMessage());
			//System.out.println(e.getMessage());
			return INPUT;
		}
		
		/*
		char[] passwd = new Md5Hash(passWord).toString().toCharArray();
		Subject subject = SecurityUtils.getSubject();
		//System.out.println("BBBB");
		UsernamePasswordToken token = new UsernamePasswordToken();
		token.setUsername(userName);
		token.setPassword(passwd);
		token.setRememberMe(false);
		
		try{
			//System.out.println("Login called");
			//System.out.println(token.getPassword());
			subject.login(token);
			//System.out.println(token.getPassword());
		}catch(AuthenticationException e){
			this.addActionError(e.getMessage());
			//System.out.println(e.getMessage());
			return INPUT;
		}
		*/
		
		return SUCCESS;
	}
	
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	

}
