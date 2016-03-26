package com.erp.common.action;

import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import com.opensymphony.xwork2.ActionSupport;

public class CmAction extends ActionSupport{
	
	public static final String PRINT = "print";
	
	protected static Log log = LogFactory.getLog(CmAction.class); 

	//定义取得 shiro session方法
	protected Session session;
	
	protected Session getSession(){
		Subject subject = SecurityUtils.getSubject();
		session = subject.getSession();
		return session;
	}
}
