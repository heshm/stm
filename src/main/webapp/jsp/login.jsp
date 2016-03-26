<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>仓库管理系统</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" />
<style type="text/css">
body{ background:#0066A8 url(img/login_bg.png) no-repeat center 0px;}
li{list-style-type:none; color:red;}
.tit{ margin:auto; margin-top:170px; text-align:center; width:350px; padding-bottom:20px;}
.login-wrap{ width:220px; padding:30px 50px 0 330px; height:220px; background:#fff url(img/login_back.jpg) no-repeat 30px 40px; margin:auto; overflow: hidden;}
.login_input{ display:block;width:210px;}
.login_user{ background: url(img/input_icon_1.png) no-repeat 200px center; font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif}
.login_password{ background: url(img/input_icon_2.png) no-repeat 200px center; font-family:"Courier New", Courier, monospace}
.btn-login{ background:#40454B; box-shadow:none; text-shadow:none; color:#fff; border:none;height:35px; line-height:26px; font-size:14px; font-family:"microsoft yahei";}
.btn-login:hover{ background:#333; color:#fff;}
.copyright{ margin:auto; margin-top:10px; text-align:center; width:370px; color:#CCC}
@media (max-height: 700px) {.tit{ margin:auto; margin-top:100px; }}
@media (max-height: 500px) {.tit{ margin:auto; margin-top:50px; }}
</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-2.2.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var selfAddr = window.self.location;
	var topAddr = window.top.location;
	if(selfAddr != topAddr){
		window.top.location.href = selfAddr;
	}
});
</script>
</head>

<body>

<div class="tit"><img src="<%=request.getContextPath()%>/img/tit.png" alt="" /></div>
<div class="login-wrap">
  <s:form method="post" action="login" namespace="/"  name="loginForm" validate="true">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="25" valign="bottom"><label for="userName">用户名：</label></td>
    </tr>
    <tr>
      <td><s:textfield id="userName" name="userName" theme="simple" class="login_input login_user"/>
      </td>
    </tr>
    <tr>
      <td height="35" valign="bottom"><label for="passWord">密  码：</label></td>
    </tr>
    <tr>
      <td><s:password id="passWord" name="passWord" theme="simple" class="login_input login_password"/>
      </td>
    </tr>
    <tr>
      <td height="60" valign="bottom"><a href="javascript:document.loginForm.submit()" class="btn btn-block btn-login">登录</a></td>
    </tr>
    <tr>
      <td><s:actionerror/>
   <s:fielderror/> </td>
    </tr>
  </table>
  </s:form>
   
</div>
<div class="copyright">建议使用IE8以上版本或谷歌浏览器&nbsp;&nbsp;&nbsp;版本:V1.0</div>
</body>
</html>
