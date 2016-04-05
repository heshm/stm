<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/stm/deliveryBillModi.js"></script>
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
								addNewOutProduct();
							}
						  },{
							text:'取消',
							iconCls:'icon-cancel',
							handler:function(){
								$mainDialog.dialog('close');
							}
						  }]
			});
		}
	});
});



</script>
</head>
<s:hidden id="status" name="deliveryBillForm.delivery.status"/>
<div class="title_right">
    <s:if test="%{docketType==3}">
        <strong>采购退货单填写</strong>
    </s:if>
	<s:if test="%{docketType==4}">
       <strong>领用退库单填写</strong>
    </s:if>
    <s:if test="%{docketType==5}">
       <strong>其它出库单填写</strong>
    </s:if>
</div>
<div style="width: 900px; margin: auto;">
    <s:form id="deliveryBillForm" name="deliveryBillForm" method="post" action="deliveryBillModi" namespace="/stm" theme="simple">
	<s:hidden name="update"/>
	<s:hidden name="deliveryNo"/>
	<s:hidden id="docketType" name="docketType"/>
	<table class="table table-bordered">
		<tr>
			<td width="12%" align="right" nowrap="nowrap"bgcolor="#f1f1f1">单号：</td>
		    <td width="38%">	 
			   <span><s:property value="%{deliveryBillForm.delivery.deliveryNo}"/></span>
			   <s:hidden id="deliveryBillNo" name="deliveryBillForm.delivery.deliveryNo"/>
			</td>
			
			<td width="12%" align="right" nowrap="nowrap"bgcolor="#f1f1f1">制单日期：</td>
			<td width="38%"><s:property value="%{deliveryBillForm.delivery.writeDate.substring(0,10)}"/></td>	
		
		</tr>
		<tr>
			<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">领用人：</td>
			<td><s:textfield name="deliveryBillForm.delivery.consumer" class="span1-1 easyui-textbox" data-options="required:true" /></td>
			<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">出库日期：</td>
			<td><s:textfield name="deliveryBillForm.delivery.outDate" class="easyui-datebox span1-1"  data-options="required:true"/></td>
			
		</tr>
		<tr>
			<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">供应商：</td>
			<td><s:textfield name="deliveryBillForm.delivery.supplier" class="span3 easyui-textbox"
			    data-options="
			        prompt: '输入或者选择供应商',
			        iconWidth: 22,
			        icons: [{
			        	iconCls:'icon-search',
			        	handler: function(e){
			        		var v = $(e.data.target).textbox('getValue');
			        		var $obj = $(e.data.target);
			        		SimpleLookUp($obj,'supplier');
			        	}
			        }]"/></td>
			<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">用途：</td>
			<td><s:textfield name="deliveryBillForm.delivery.useFor" class="span3 easyui-textbox" data-options="required:true"/></td>
			
		</tr>
		<tr>
			<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">备注：</td>
			<td colspan="3"><s:textfield name="deliveryBillForm.delivery.remark" class="span8" /></td>
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
		<s:iterator var="dataList" value="%{deliveryBillForm.deliveryDetailList}" status="stat">
		<tr>
		    <td align="center"><input name="sel" type="checkbox"></td>
			<td align="center"><s:property value="#sn"/></td>
			<td align="center">
			  <s:property value="#dataList.commodityType"/>
			  <s:hidden name="deliveryBillForm.deliveryDetailList[%{#stat.index}].commodityType"/>
			</td>
			<td align="center"><s:property value="#dataList.productType.name"/></td>
			<td align="center"><s:property value="#dataList.productType.productGroup.groupName"/></td>
		    <td align="center"><s:textfield name="deliveryBillForm.deliveryDetailList[%{#stat.index}].brand" id="input6" class="span1 text-center"/></td>
			<td align="center"><s:textfield name="deliveryBillForm.deliveryDetailList[%{#stat.index}].norm" id="input6" class="span1 text-center"/></td>
			<td align="center"><s:textfield name="deliveryBillForm.deliveryDetailList[%{#stat.index}].quantity" id="input8" class=" span1 text-center"/></td>
			<td align="center"><s:property value="#dataList.productType.unit"/></td>
		    <td align="center"><s:textfield name="deliveryBillForm.deliveryDetailList[%{#stat.index}].unitPrice" id="input8" class=" span1 text-center"/></td>
			<td align="center"><s:textfield name="deliveryBillForm.deliveryDetailList[%{#stat.index}].amount" id="input8" class=" span1-1 text-center"/></td>
			<td align="center"><s:textfield name="deliveryBillForm.deliveryDetailList[%{#stat.index}].taxRate" id="input8" class=" span1 text-center"/>%</td>
			<td align="center"><s:textfield name="deliveryBillForm.deliveryDetailList[%{#stat.index}].taxAmt" id="input8" class=" span1-1 text-center"/></td>
            
		</tr>
		<s:set var="sn" value="#sn + 1"/>
		</s:iterator>
	  </tbody>
	</table>
	<table class="table table-bordered">
		<tr>
			<td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">合计</td>
			<td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">总数量：</td>
			<td width="23%"><s:property value="%{deliveryBillForm.sumQuantity}"/></td>
			<td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">总金额：</td>
			<td><s:property value="%{deliveryBillForm.sumAmount}"/></td>
		    <td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">总税额：</td>
			<td><s:property value="%{deliveryBillForm.sumTaxAmt}"/></td>
		</tr>
	</table>
    </s:form>
    
	<table class="margin-bottom-20  table no-border">
		<tr>
			<td class="text-center">
			   <a class="easyui-linkbutton" style="width:80px" onclick="deliveryBillUpdate();">保存</a> 
               <a class="easyui-linkbutton" style="width:80px" onclick="location.href='deliveryBillInit.action?docketType=<s:property value="%{docketType}"/>';">返回</a> 
			</td>
		</tr>
		<tr>
		    <td class="text-center">
		      <label class="checkbox inline">
		          <input name="print" type="checkbox" checked="checked"><span>保存后弹出打印</span>
		      </label>
		     
		    </td>
		</tr>
	</table>

	<div class="alert"> 
      <button type="button" class="close" data-dismiss="alert">&times;</button>
             温馨提示：按“TAB”键进行切换；&nbsp;&nbsp;按“F10”保存；&nbsp;&nbsp;
    </div>

</div>

