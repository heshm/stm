<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">
$(document).ready(function() {

});
function userFormSubmit(){
	if($("#userForm").form('enableValidation').form('validate')){
		$main.messager.confirm('系统提示', '确认输入无误?', function(r){
			if (r){
				document.userForm.submit();
			}
		});
	}
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
				<td width="50%"><s:textfield name="user.userId" class="span2 easyui-textbox" data-options="required:true"/></td>
				</s:else>
			</tr>
			<tr>
				<td width="50%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">姓名：</td>
				<td width="50%"><s:textfield name="user.userName" class="span2 easyui-textbox" data-options="required:true" /></td>

			</tr>
			<tr>
				<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">电子邮箱：</td>
				<td><s:textfield name="user.email" class="span2 easyui-validatebox" data-options="validType:'email'"/></td>

			</tr>
			<tr>
				<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">手机：</td>
				<td><s:textfield name="user.telNo" class="span2 easyui-textbox" data-options="required:true,validType:'length[11,14]'"/></td>
			</tr>
			<tr>
			    <td align="right" nowrap="nowrap" bgcolor="#f1f1f1">角色：</td>
				<td>
				    <s:set var="role" value="%{user.role}"/>
				    <div class="checkbox"> 
				        <label>
				            <s:if test="%{#role.contains('employee')}">
				              <input name="user.role" type="checkbox" value="employee" checked="checked">
				            </s:if>
				            <s:else>
				               <input name="user.role" type="checkbox" value="employee">
				            </s:else>
				            <span>一般员工</span>
				        </label>
				    </div>
				    <div class="checkbox"> 
				        <label>
				          <s:if test="%{#role.contains('stockman')}">
				            <input name="user.role" type="checkbox" value="stockman" checked="checked">
				          </s:if>
				          <s:else>
				            <input name="user.role" type="checkbox" value="stockman">
				          </s:else>
				          <span>仓库管理员</span>
				        </label>
				    </div>
				    <div class="checkbox"> 
				        <label><input name="user.role" type="checkbox" value="sysadmin" disabled="disabled"><span>系统管理员</span></label>
				    </div>
	            </td>
			</tr>
		</table>
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
