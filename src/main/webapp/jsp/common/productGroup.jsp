<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<head>
<script type="text/javascript">

function showproductGroupModi(){
	$mainDialog.dialog({
		iconCls: 'icon-edit',
		width:400,
		height:260,
		title:'新增货品大类',
		href : 'productGroupModiInit.action',
		modal: 'true',
		buttons: [{
			text:'确定',
			iconCls:'icon-ok',
			handler:function(){
				alert('ok');
			}
		},{
			text:'取消',
			iconCls: 'icon-cancel',
			handler:function(){
				alert('cancel');;
			}
		}]
	});
}
function deleteOneProductGroup(groupId){
	$main.messager.confirm('系统提示', '确定删除该条记录?', function(r){
		if (r){
			location.href= "productGroupDelete.action?groupId=" + groupId;
		}
	});
}
</script>
</head>
<body>
<div class="title_right">
    <span class="pull-right"><a class="btn btn-primary btn-small" href="productGroupModiInit.action"><i class="icon-plus icon-white"></i>添加货品大类</a></span>
    <strong>货品大类管理</strong>
</div>

<div style="width:500px;margin:auto;">
  <table class="table table-bordered table-hover table-striped">
    <s:set name="sn" value="1"/>
    <tbody>
    <tr align="center">
      <td><strong>No</strong></td>
      <td><strong>类别编码</strong></td>
      <td><strong>类别描述</strong></td>
      <td><strong>操作</strong></td>
    </tr>
    <s:iterator var="productGroup" value="%{productGroupList}">
    <tr align="center">
      <td><s:property value="#sn"/></td>
      <td><s:property value="#productGroup.groupId" /></td>
      <td><s:property value="#productGroup.groupName" /></td>
      <td nowrap="nowrap"><a class="btn btn-danger btn-mini" href="javascript:deleteOneProductGroup('<s:property value="#productGroup.groupId"/>');">删除</a></td>
    </tr>
    <s:set var="sn" value="#sn + 1" />  
    </s:iterator>
    </tbody>
  </table>
</div>
</body>