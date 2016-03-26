package com.erp.auth.realm;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;

import com.erp.common.IService.IUserService;
import com.erp.common.model.User;

public class UserRealm extends AuthorizingRealm{

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principal) {
		//Subject subject = SecurityUtils.getSubject();
		//Session session = subject.getSession();
		String userId = (String) principal.getPrimaryPrincipal(); 
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		//char level = session.getAttribute("level").toString().charAt(0);
		authorizationInfo.addRoles(userService.getRoles(userId));
		return authorizationInfo;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
		Subject subject = SecurityUtils.getSubject();
	    Session session = subject.getSession();

		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		String password = String.valueOf(token.getPassword());
	
		User user = userService.getOneUser(token.getUsername());
		if(user == null){
			throw new UnknownAccountException("用户名不存在!");
		}else{
			
			session.setAttribute("user", user);
			if(user.getPassword().equals(password)){
				if(user.getStatus().equals("1")){
				    return new SimpleAuthenticationInfo(
						user.getUserId(),
						user.getPassword(),
						user.getUserName());
				}else{
					throw new IncorrectCredentialsException("该用户已失效!");
				}
			}else{
				throw new IncorrectCredentialsException("用户密码错误!");
			}
		}
	}
	
    private IUserService userService;

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	


}
