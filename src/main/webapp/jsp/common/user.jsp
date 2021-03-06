<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="/struts-tags"%>

<script type="text/javascript">
$(document).ready(function(){
	
});
function deleteOneUser(userId){
	var addr = "userDelete.action?userId=" + userId;
	$main.messager.confirm('用户删除', '你确定删除该用户?', function(r){
		if (r){
			window.location.href = addr;
		}
	});
}
function updateOneUser(userId){
	var url = "userModiInit.action?update=1&userId=" + userId;
	location.href = url;

}
function addOneUser(){
	var url = "userModiInit.action?update=0";
	location.href = url;
}
function resetPass(userId){
	var msg = "确地要重置(" + userId + ")的密码?";
	$main.messager.confirm('密码修改', msg , function(r){
		if (r){
			$.ajax({
			    cache:false,   
		        url:'<%=request.getContextPath()%>/common/passReset.action',   
			    type:'post',   
			    dataType:'json',   
			    data:{userId:userId},   
			    success:function(msg){
			    	$main.messager.alert('系统提示',msg,'info');
			    }
		    });
		}
	});
}
</script>
<body>
<div class="title_right">
  <span class="pull-right margin-bottom-5"><a class="btn btn-primary btn-small" href="javascript:addOneUser();" role="button"><i class="icon-plus icon-white"></i>添加用户</a></span>
  <strong>用户查询</strong>
</div>  
<div style="width:600px; margin:auto">
  <table class="table table-bordered table-hover table-striped">
    <tbody>
      <s:set name="sn" value="1"/>
      <tr align="center">
        <td nowrap="nowrap"><strong>序号</strong></td>
        <td width="70" nowrap="nowrap"><strong>登录名</strong></td>
        <td nowrap="nowrap"><strong>姓名</strong></td>
        <td nowrap="nowrap"><strong>电子邮箱</strong></td>
        <td nowrap="nowrap"><strong>联系电话</strong></td>
        <td width="80" nowrap="nowrap"><strong>操作</strong></td>
      </tr>
      <s:iterator var="user" value="%{userList}">
      <tr align="center">
        <td nowrap="nowrap"><s:property value="#sn"/></td>
        <td nowrap="nowrap"><s:property value="#user.userId"/></td>
        <td nowrap="nowrap"><a href="javascript:updateOneUser('<s:property value="#user.userId"/>');"><s:property value="#user.userName"/></a></td>
        <td nowrap="nowrap"><s:property value="#user.email"/></td>
        <td nowrap="nowrap"><s:property value="#user.telNo"/></td>
        <td nowrap="nowrap">
          <a class="btn btn-danger btn-mini" href="javascript:deleteOneUser('<s:property value="#user.userId"/>');">删除</a> 
          <a class="btn btn-info btn-mini" href="javascript:resetPass('<s:property value="#user.userId"/>');">重置密码</a>
        </td>
      </tr>
      <s:set var="sn" value="#sn + 1" />  
      </s:iterator>
    </tbody>
  </table>
</div>
</body>

