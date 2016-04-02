package com.erp.common.action;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;

import com.erp.common.IService.IUserService;
import com.erp.common.model.User;
import com.erp.common.util.Const;


public class UserModiAction extends CmAction{
	
	
	
	private String userId;
	private Short update;
	private User user;
	private IUserService userService;
	
	@RequiresRoles(value={"sysadmin"}, logical= Logical.OR)
	public String init(){
		//System.out.println(userId);
		//System.out.println(update);
		if(update.equals(Const.UPDATE_RECORD)){
			user = userService.getOneUser(userId);
		}
		return SUCCESS;
	}
	
	@RequiresRoles(value={"sysadmin"}, logical= Logical.OR)
	public String modi(){
		//System.out.println("SSSS:" + update);
		if(Const.UPDATE_RECORD.equals(update)){
			userService.updateUser(user);
		}else{
			try{
			    userService.addOneUser(user);
			    this.addActionMessage("用户信息修改成功!");
			}catch(RuntimeException e){
				this.addActionError(e.getMessage());
				log.error(e.getMessage());
			}
		}
		
		return SUCCESS;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Short getUpdate() {
		return update;
	}

	public void setUpdate(Short update) {
		this.update = update;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

}
