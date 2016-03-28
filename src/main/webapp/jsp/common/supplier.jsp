<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="/struts-tags"%>

<script type="text/javascript">
$(document).ready(function(){
	
});
function getOneSupplier(supplierId){
	var htmlAddr = "supplierModiInit.action?update=1&supplierId=" + supplierId;
	location.href = htmlAddr;
}
function addOneSupplier(){
	var htmlAddr = "supplierModiInit.action?update=0" ;
	location.href = htmlAddr;
}
function deleteOneSupplier(supplierId){
	$main.messager.confirm('系统提示', '确认干掉这条数据?', function(r){
		if (r){
			var htmlAddr = "supplierDelete.action?supplierId=" + supplierId;
			location.href = htmlAddr;
		}
	});
}
</script>
<body>
<div class="title_right">
  <span class="pull-right margin-bottom-5"><a class="btn btn-primary btn-small" href="javascript:addOneSupplier();" role="button"><i class="icon-plus icon-white"></i>添加往来单位</a></span>
  <strong>往来单位查询</strong>
</div>  
<div style="width:900px; margin:auto">
  <table class="table table-bordered table-hover table-striped">
    <tbody>
      <s:set name="sn" value="1"/>
      <tr align="center">
        <td width="50" nowrap="nowrap"><strong>序号</strong></td>
        <td width="70" nowrap="nowrap"><strong>单位ID</strong></td>
        <td nowrap="nowrap"><strong>单位名称</strong></td>
        <td width="80" nowrap="nowrap"><strong>联系电话</strong></td>
        <td width="80" nowrap="nowrap"><strong>代理人名称</strong></td>
        <td width="80" nowrap="nowrap"><strong>代理人手机号</strong></td>
        <td width="80" nowrap="nowrap"><strong>操作</strong></td>
      </tr>
      <s:iterator var="supplier" value="%{supplierList}">
      <tr align="center">
        <td nowrap="nowrap"><s:property value="#sn"/></td>
        <td nowrap="nowrap"><s:property value="#supplier.supplierId"/></td>
        <td><a href="javascript:getOneSupplier('<s:property value="#supplier.supplierId"/>');"><s:property value="#supplier.supplierName"/></a></td>
        <td nowrap="nowrap"><s:property value="#supplier.supplierTel"/></td>
        <td nowrap="nowrap"><s:property value="#supplier.linkman"/></td>
        <td nowrap="nowrap"><s:property value="#supplier.linkmanTel"/></td>
        <td nowrap="nowrap">
          <a class="btn btn-danger btn-mini" href="javascript:deleteOneSupplier('<s:property value="#supplier.supplierId"/>');">删除</a> 
        </td>
      </tr>
      <s:set var="sn" value="#sn + 1" />  
      </s:iterator>
    </tbody>
  </table>
</div>
</body>

