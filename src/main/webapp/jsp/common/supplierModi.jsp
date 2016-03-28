<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="/struts-tags"%>

<script type="text/javascript">
$(document).ready(function(){
	
});
function supplierFormSubmit(){
	if($("#supplierForm").form('enableValidation').form('validate')){
		var update = $('#update').val();
		$main.messager.confirm('系统提示', '确认输入无误?', function(r){
			if (r){
				if(update == 0){
					document.supplierForm.action = "supplierAdd.action";
				}else{
					document.supplierForm.action = "supplierUpdate.action";
				}
				$('#supplierForm').submit();
			}
		});
	}
}
</script>
<body>
<div style="width: 600px; margin: auto;">
  <div style="width: 600px; height: auto; margin: auto; text-align: center">
    <h5>供应商更新</h5>
  </div>
  <s:form id="supplierForm" name="supplierForm" method="post" action="supplierAction" namespace="/common" theme="simple">
  <s:hidden id="update" name="update" />
  <table class="table table-bordered">
    <tr>
      <td width="30%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">供应商ID：</td>
      <td width="70%"><s:textfield name="supplier.supplierId" class="span1 easyui-textbox" data-options="required:true"/></td>
    </tr>
    <tr>
      <td width="30%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">供应商名称：</td>
      <td width="70%"><s:textfield name="supplier.supplierName" class="span5 easyui-textbox" data-options="required:true"/></td>
    </tr>
    <tr>
      <td width="30%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">供应商电话：</td>
      <td width="70%"><s:textfield name="supplier.supplierTel" class="span2" data-options="required:true"/></td>
    </tr>
    <tr>
      <td width="30%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">供应商地址：</td>
      <td width="70%"><s:textfield name="supplier.supplierAddress" class="span5" data-options="required:true"/></td>
    </tr>
    <tr>
      <td width="30%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">联系人：</td>
      <td width="70%"><s:textfield name="supplier.linkman" class="span1-1" data-options="required:true"/></td>
    </tr>
    <tr>
      <td width="30%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">联系人手机号：</td>
      <td width="70%">
        <s:textfield name="supplier.linkmanTel" class="span2" data-options="required:true"/>
      </td>
    </tr>
  </table>
  </s:form>
  <table class="margin-bottom-20  table no-border">
    <tr>
	  <td class="text-center">
	    <a href="#" class="easyui-linkbutton" style="width:80px" onclick="supplierFormSubmit();">保存</a> 
        <a href="supplierInit.action" class="easyui-linkbutton" style="width:80px">返回</a> 
	  </td>
    </tr>
  </table>
</div>
</body>

