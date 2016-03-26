<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
function submitForm(){
	$('#productGroupModiForm').form('submit',{
		onSubmit:function(){
			return $(this).form('enableValidation').form('validate');
		},
		success:function(){
			$main.messager.confirm('系统提示', '确认输入无误?', function(r){
				if (r){
					$('#productGroupModiForm').submit();
				}
			});
			
		}
	});
}
</script>
<body>
<div class="title_right">
    <strong>货品大类新增</strong>
</div>

<div style="width:400px;margin:auto;padding:20px;">
<s:form id="productGroupModiForm" name="productGroupModiForm" method="post" action="productGroupModi" namespace="/common" theme="simple">
<table class="table table-bordered">
  <tbody>
    <tr>
      <td align="right">类别编码:</td>
      <td align="left">
        <s:textfield name="groupId" cssClass="easyui-textbox" style="width:30px" data-options="required:true,validType:'length[2,2]'" maxlength="2"/>[*]
      </td>
    </tr>
    <tr>
      <td align="right">类别名称:</td>
      <td align="left"><s:textfield name="groupName" class="span2 easyui-textbox" data-options="required:true" maxlength="60"/>[*]</td>
    </tr>
</tbody>
</table>
</s:form>
<table  class="margin-bottom-20 table  no-border" >
  <tr>
    <td class="text-center">
      <a href="#" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">保存</a> 
      <a href="productGroupInit.action" class="easyui-linkbutton" style="width:80px">返回</a>
    </td>
  </tr>
</table>
</div>
<body>