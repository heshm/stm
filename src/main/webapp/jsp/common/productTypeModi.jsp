<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<head>
<script type="text/javascript">
function productTypeModiFormSubmit(){
	var flag = $("#isUpdate").val();
	if(flag == 1){
		document.productTypeModiForm.action = "productTypeUpdate";
		
	}else{
		document.productTypeModiForm.action = "productTypeInsert";
	}
	
	if($("#productTypeModiForm").form('enableValidation').form('validate')){
		$main.messager.confirm('系统提示', '确认输入无误?', function(r){
			if (r){
				$('#productTypeModiForm').submit();
			}
		});
	}

}
</script>
</head>

<body>
<div class="title_right">
  <strong>货品资料维护</strong>
</div> 
<div style="width:600px; margin:auto">
<s:form id="productTypeModiForm" name="productTypeModiForm" method="post" action="productTypeModi" namespace="/common" theme="simple">
<s:hidden id="isUpdate" name="isUpdate"/>
<table class="table table-bordered">
  <tbody>
    <tr>
      <td align="right" bgcolor="#f1f1f1">货品类别:</td>
      <td align="left">
        <s:if test="%{isUpdate==1}">
          <span><s:property value="%{productType.productGroup.groupName}"/></span>
          <s:hidden name="productType.groupId" value="%{productType.productGroup.groupId}"/>
        </s:if>
        <s:else>
          <s:select name="productType.groupId" list="%{#session.productGroup}" class="span2" listKey="groupId" listValue="groupName" theme="simple">
          </s:select>
        </s:else>
      </td>
      <td align="right" bgcolor="#f1f1f1">货品编码:</td>
      <td align="left" colspan="3">
      <s:if test="%{isUpdate==1}">
        <span><s:property value="%{productType.typeId}"/></span>
        <s:hidden name="productType.typeId"/>
      </s:if>
      <s:else>
        <s:textfield name="productType.typeId" cssClass="easyui-textbox" cssStyle="width:40px" maxlength="3" data-options="required:true,validType:'length[3,3]'" />[*]
      </s:else>
      </td>
    </tr>

    <tr>
      <td align="right" bgcolor="#f1f1f1">货品名称:</td>
      <td align="left"><s:textfield name="productType.name" class="span2 easyui-textbox" data-options="required:true" maxlength="60"/>[*]</td>
      <td align="right" bgcolor="#f1f1f1">货品规格:</td>
      <td align="left" colspan="3"><s:textfield name="productType.norm" cssClass="easyui-textbox" data-options="required:true" cssStyle="width:60px" maxlength="20"/>[*]</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#f1f1f1">单位:</td>
      <td align="left"><s:textfield name="productType.unit" cssClass="easyui-textbox" data-options="required:true" cssStyle="width:60px" maxlength="6"/>[*]</td>
      <td align="right" bgcolor="#f1f1f1">计量小数位数:</td>
      <td align="left" colspan="3"><s:textfield name="productType.decNo" cssStyle="width:50px" maxlength="5"/>[*]</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#f1f1f1">参考入库单价:</td>
      <td align="left"><s:textfield name="productType.refInPrice" class="span2 easyui-numberbox" precision="2" data-options="required:true" maxlength="10"/></td>
      <td align="right" bgcolor="#f1f1f1">参考出库单价:</td>
      <td align="left" colspan="3"><s:textfield name="productType.refOutPrice" class="span2 easyui-numberbox" precision="2" data-options="required:true" maxlength="10"/></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#f1f1f1">备注:</td>
      <td align="left" colspan="3"><s:textfield name="productType.remark" class="span3" maxlength="30"/></td>
    </tr>
  </tbody>
</table>
</s:form>
<table  class="margin-bottom-20 table  no-border" >
  <tr>
    <td class="text-center">
      <a class="easyui-linkbutton" href="#" style="width:80px" onclick="productTypeModiFormSubmit();">保存</a> 
      <a class="easyui-linkbutton" href="productTypeInit.action" style="width:80px">返回</a> 
    </td>
  </tr>
</table>
</div>
</body>


