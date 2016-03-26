<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/stm/receiptBillModi.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var status = $("#status").val();
	$('.add').bind('click',function(){
		if(status!=1){
			$mainDialog.dialog({
				iconCls: 'icon-edit',
				width:600,
				height:380,
				title:'新增货品',
				href : '<%=request.getContextPath()%>/stm/productTypeLookUpInit.action',
				modal: 'true',
				buttons: [{
							text:'添加',
							iconCls:'icon-add',
							handler:function(){
								alert('ok');
							}
						  },{
							text:'取消',
							iconCls:'icon-cancel',
							handler:function(){
								$mainDialog.dialog('destroy');
							}
						  }]
			});
		}
	});
});
function receiptBillUpdate(){
	$main.messager.confirm('系统提示', '输入无误,确认提交?', function(r){
		if (r){
			document.receiptBillForm.submit();
		}
	});
}
function getBack(){
	var docketType = $("#docketType").val();
	location.href = "receiptBillInit.action?docketType=" + docketType;
}
</script>
</head>

<body>
<div class="title_right">
    <s:if test="%{docketType==1}">
        <strong>采购入库单填写</strong>

    </s:if>
	<s:if test="%{docketType==2}">
       <strong>生产入库单填写</strong>
    </s:if>
</div>
<div style="width: 900px; margin: auto;">
    <s:form id="receiptBillForm" name="receiptBillForm" method="post" action="receiptBillModi" namespace="/stm" theme="simple">
    <s:hidden name="update"/>
    <s:hidden name="receiptBillForm.receipt.depotId"/>
    <s:hidden name="receiptNo"/>
    <s:hidden id="docketType" name="docketType"/>
	<table class="table table-bordered">
		<tr>
			<td width="15%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">单号：</td>
			<td width="35%">
			   <span><s:property value="%{receiptBillForm.receipt.receiptNo}"/></span>
			   <s:hidden name="receiptBillForm.receipt.receiptNo"/>
			</td>
			
			<td width="15%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">制单日期：</td>
			<td width="35%"><s:property value="%{receiptBillForm.receipt.writeDate.substring(0,10)}"/>
			<s:hidden name="receiptBillForm.receipt.writeDate" /></td>
			
		</tr>
		<tr>
		    <td width="15%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">入库人：</td>
			<td width="35%">
			  <s:textfield name="receiptBillForm.receipt.registrant" class="span1-1" />
			</td>
			<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">入库日期：</td>
			<td><s:textfield name="receiptBillForm.receipt.enterDate" class="laydate-icon span1-1" id="Calendar2" /></td>
			
		</tr>
		<tr>
			<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">审核状态：</td>
			<td><s:select id="status" name="receiptBillForm.receipt.status" list="#{'0':'未审核','1':'已审核'}" class="span1-1" theme="simple"/></td>
			<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">供应商/部门：</td>
			<td><s:textfield name="receiptBillForm.receipt.supplier"  class="span4" /></td>
			
		</tr>
		<tr>
			<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">备注：</td>
			<td colspan="3"><s:textfield name="receiptBillForm.receipt.remark" class="span8" /></td>
		</tr>
	</table>
	<table class="table table-bordered">
	  <thead>
	     <tr>
	      <td>
	        <a class="btn btn-mini btn-primary add">添加</a>
	      </td>
		  <td colspan="2">
		   
		    <a class="btn btn-mini btn-danger del">删除</a>
		  </td>
		  <td>
		    <a class="btn btn-mini btn-primary">发票扫描件上传</a>
		  </td>
		</tr>
		<tr>
		    <td align="center" bgcolor="#f1f1f1"><input id="checkAll" type="checkbox">全选</td>
			<td align="center" bgcolor="#f1f1f1"><strong>序号</strong></td>
			<td align="center" bgcolor="#f1f1f1"><strong>货品编码</strong></td>
			<td align="center" bgcolor="#f1f1f1"><strong>货品名称</strong></td>
			<td align="center" bgcolor="#f1f1f1"><strong>货品类别</strong></td>
			<td align="center" bgcolor="#f1f1f1"><strong>品牌名称</strong></td>
			<td align="center" bgcolor="#f1f1f1"><strong>货品规格</strong></td>
			<td align="center" bgcolor="#f1f1f1"><strong>数量</strong></td>
			<td align="center" bgcolor="#f1f1f1"><strong>单位</strong></td>
			<td align="center" bgcolor="#f1f1f1"><strong>单价</strong></td>
            <td align="center" bgcolor="#f1f1f1"><strong>金额</strong></td>
            <td align="center" bgcolor="#f1f1f1"><strong>税率</strong></td>
            <td align="center" bgcolor="#f1f1f1"><strong>税额</strong></td>
		</tr>
	  </thead>
	  <tbody id="data">
		<s:set name="sn" value="1"/>
		<s:iterator var="dataList" value="%{receiptBillForm.receiptDetail}" status="stat">
		<tr>
		    <td align="center"><input type="checkbox"></td>
			<td align="center"><s:property value="#sn"/></td>
			<td align="center">
			  <s:property value="#dataList.commodityType"/>
			  <s:hidden name="receiptBillForm.receiptDetail[%{#stat.index}].commodityType"/>
			</td>
			<td align="center"><s:property value="#dataList.productType.name"/></td>
			<td align="center"><s:property value="#dataList.productType.productGroup.groupName"/></td>
		    <td align="center"><s:textfield name="receiptBillForm.receiptDetail[%{#stat.index}].brand" id="input6" class="span1 text-center"/></td>
			<td align="center"><s:textfield name="receiptBillForm.receiptDetail[%{#stat.index}].norm" id="input6" class="span1 text-center"/></td>
			<td align="center"><s:textfield name="receiptBillForm.receiptDetail[%{#stat.index}].quantity" 
			    class="span1"/></td>
			<td align="center"><s:property value="#dataList.productType.unit"/></td>
		    <td align="center"><s:textfield name="receiptBillForm.receiptDetail[%{#stat.index}].unitPrice" id="input8" class=" span1 text-center"/></td>
			<td align="center"><s:textfield name="receiptBillForm.receiptDetail[%{#stat.index}].amount" id="input8" class=" span1-1 text-center"/></td>
			<td align="center"><s:textfield name="receiptBillForm.receiptDetail[%{#stat.index}].taxRate" id="input8" class=" span1 text-center"/>%</td>
			<td align="center"><s:textfield name="receiptBillForm.receiptDetail[%{#stat.index}].taxAmt" id="input8" class=" span1-1 text-center"/></td>
            
		</tr>
		<s:set var="sn" value="#sn + 1"/>
		</s:iterator>
	  </tbody>
	</table>
	<table class="table table-bordered">
		<tr>
			<td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">合计</td>
			<td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">总数量：</td>
			<td width="23%"><s:property value="%{receiptBillForm.sumQuantity}"/></td>
			<td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">总金额：</td>
			<td><s:property value="%{receiptBillForm.sumAmount}"/></td>
		    <td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">总税额：</td>
			<td><s:property value="%{receiptBillForm.sumTaxAmt}"/></td>
		</tr>
	</table>
    </s:form>
	<table class="margin-bottom-20  table no-border">
		<tr>
			<td class="text-center">
			   <a class="easyui-linkbutton" style="width:80px" onclick="receiptBillUpdate();">保存</a> 
               <a class="easyui-linkbutton" style="width:80px" onclick="getBack();">返回</a> 
			</td>
		</tr>
	</table>
	<!--  
	<div class="alert">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		温馨提示：按“Enter”键进行切换；&nbsp;&nbsp;按“F10”保存；&nbsp;&nbsp;按“F5”代收货款；&nbsp;&nbsp;按“F6”返款；
	</div>
	-->

</div>
</body>
