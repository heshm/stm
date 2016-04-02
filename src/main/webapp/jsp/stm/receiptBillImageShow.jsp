<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>仓库管理系统</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-2.2.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {

});
</script>
</head>
<body>

 
<table class="table table-bordered">
  <tr>
	<td colspan="2"><a href="javascript:history.back()" class="btn btn-warning btn-small print">返回</a></td>
  </tr>
  <tr align="center">
    <td width="40px" nowrap="nowrap"><strong>序号</strong></td>
    <td><strong>图片</strong></td>
  </tr>
  <s:set name="sn" value="1"/>
  <s:iterator value="fileArray" status="s">
    <tr align="center">
      <td><s:property value="#sn"/></td>
      <td>
        <img alt="图片已丢失" src="<%=request.getContextPath()%><s:property value="fileArray[#s.index]"/>"
             style="max-width:800px;"/>
      </td>
    </tr>
    <s:set var="sn" value="#sn + 1" />
  </s:iterator>
</table>

</body>
</html>
