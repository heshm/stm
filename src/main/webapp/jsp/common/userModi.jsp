<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">
$(document).ready(function() {

});
function userFormSubmit(){
	$main.messager.confirm('系统提示', '确认输入无误?', function(r){
		if (r){
			document.userForm.submit();
		}
	});
}
</script>
<body>
	<div id="mainArea" style="width: 400px; margin: auto;">
		<div style="width: 400px; height: auto; margin: auto; text-align: center">
			<h5>用户更新</h5>
		</div>
		<s:form id="userForm" name="userForm" method="post" action="userModi" namespace="/common" theme="simple">
		<table class="table table-bordered" >
			<tr>
				<td width="50%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">登录名：</td>
				<s:if test="%{update==1}">
				<td width="50%">
				    <s:hidden name="user.userId"/>
				    <s:property value="%{user.userId}"/>
				</td>
				</s:if>
				<s:else>
				<td width="50%"><s:textfield name="user.userId" class="span2" data-options="required:true"/></td>
				</s:else>

			</tr>
			<tr>
				<td width="50%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">姓名：</td>
				<td width="50%"><s:textfield name="user.userName" class="span2" data-options="required:true" /></td>

			</tr>
			<tr>
				<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">电子邮箱：</td>
				<td><s:textfield name="user.email" class="span2 form-control"/></td>

			</tr>
			<tr>
				<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">手机：</td>
				<td colspan="3"><s:textfield name="user.telNo" class="span2" data-options="required:true"/></td>
			</tr>
		</table>
		<s:hidden name="user.role"/>
		<s:hidden name="user.status"/>
		<s:hidden name="update"/>
		</s:form>
		<table class="margin-bottom-20  table no-border">
		<tr>
			<td class="text-center">
			   <a href="#" class="easyui-linkbutton" data-dismiss="modal"  style="width:80px" onclick="userFormSubmit();">保存</a> 
               <a href="userInit.action" class="easyui-linkbutton" data-dismiss="modal"style="width:80px">返回</a> 
			</td>
		</tr>
	    </table>
	</div>
</body>
