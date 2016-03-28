<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="/struts-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-2.2.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>

</head>
<tiles:insertAttribute name="body"/>
<s:if test="hasActionErrors()">     
<script>   
   var message = "";
   <s:iterator value="actionErrors"> 
       message = message + "<s:property/>";
   </s:iterator>   
   $main.messager.alert('系统错误',message,'error');
</script>    
</s:if>   

<s:if test="hasActionMessages()">     
<script>   
   var message = "";
   <s:iterator value="actionMessages"> 
       message = message + "<s:property/>";
   </s:iterator>   
   $main.messager.alert('系统提示',message,'info');
</script>    
</s:if> 
</html>
