<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="/struts-tags"%>
<script type="text/javascript">
function logout(){
	$.messager.confirm('注销系统', '你确定要注销退出系统吗?', function(r){
		if (r){
			location.href= "<%=request.getContextPath()%>/logout";
		}
	});
}
function changePassword(){
	$('#passWordDlg').dialog('open');
}
function changePasswordSubmit(){
	var oldpass = $("#oldpass").val();
	var newpass = $("#newpass").val();
	var confirmnewpass = $("#confirmnewpass").val();
	if(newpass==confirmnewpass){
		if($("#passForm").form('enableValidation').form('validate')){
			$.messager.confirm('密码修改', '确定要修改密码?', function(r){
				if (r){
					$.ajax({
					    cache:false,   
				        url:'<%=request.getContextPath()%>/common/passChange.action',   
					    type:'post',   
					    dataType:'json',   
					    data:{oldpass:oldpass,newpass:newpass},   
					    success:showMessage
				    });
				}
			});
		}
	}else{
		$.messager.alert('系统提示','两次新密码输入不一致,请重新输入!','error');
	}
	
}
function showMessage(msg){
	$.messager.alert('系统提示',msg,'info');
	$('#passWordDlg').dialog('close');
}
</script>
<div class="logo">
    
    <img src="<%=request.getContextPath()%>/img/logo.png" />
 
</div>
<div class="header-right">
    <i class="icon-user icon-white"></i><span>欢迎你！<s:property value="%{#session.user.userName}" /></span>
    <i class="icon-lock icon-white"></i><a href="#" onclick="changePassword()">修改密码</a> 
	<i class="icon-off icon-white"></i> <a href="#" onclick="logout();">注销</a>
</div>
<div id="passWordDlg" class="easyui-dialog" title="密码修改" 
    data-options="
      iconCls:'icon-edit',
      closed:'true',
      modal:'true',
      buttons:'#passWordDlg-buttons'" 
    style="width:300px;height:200px;padding:20px">
    <form id="passForm" class="easyui-form" method="post" data-options="novalidate:true">
	    <table id="passTable"class="table table-bordered">
		    <tr>
			    <td align="right">旧密码:</td>
				<td align="left">
				    <input type="password" id="oldpass" class="span2 easyui-validatebox"
						   data-options="required:true"/>[*]</td>
			</tr>
			<tr>
				<td align="right">新密码:</td>
				<td align="left">
				    <input type="password" id="newpass" class="span2 easyui-validatebox" 
				           data-options="required:true"/>[*]</td>
			</tr>
			<tr>
				<td align="right">确认新密码:</td>
				<td align="left">
				    <input type="password" id="confirmnewpass" class="span2 easyui-validatebox" 
				           data-options="required:true"/>[*]</td>
			</tr>
		</table>
	</form>
</div>
<div id="passWordDlg-buttons">
    <a href="javascript:void(0)" class="btn btn-small" style="width:40px" onclick="javascript:$('#passWordDlg').dialog('close')">取消</a>
    <a href="javascript:void(0)" class="btn btn-small btn-primary" style="width:40px" onclick="javascript:changePasswordSubmit();">确定</a>
</div>