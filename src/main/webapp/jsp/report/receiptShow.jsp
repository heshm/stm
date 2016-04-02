<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>仓库管理系统</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/css.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-2.2.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.print').on('click',function () {
		window.print();  
    });
});
function showBillImage(receiptNo){
	var url = "<%=request.getContextPath()%>/stm/receiptBillImageShow.action?receiptNo=" + receiptNo;
	location.href = url;
}
</script>
</head>
<body>
	<div id="mainArea" style="width: 900px; margin: auto;">
	    <div style="width: 900px;  height:auto ;margin: auto; text-align :center">
	        <s:if test="%{receiptBillForm.receipt.type==0}">
	            <h4>其它入库单</h4>
	        </s:if>
	        <s:if test="%{receiptBillForm.receipt.type==1}">
	            <h4>采购入库单</h4>
	        </s:if>
	        <s:if test="%{receiptBillForm.receipt.type==2}">
	            <h4>生产入库单</h4>
	        </s:if>
	    </div>
		<s:form id="receiptBillForm" name="receiptBillForm" method="post"
			action="receiptBillModi" namespace="/stm" theme="simple">
			<table class="table table-bordered">
				<tr>
					<td><a class="btn btn-warning btn-small print">打印</a></td>
				</tr>
				<tr>
					<td width="15%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">单号：</td>
					<td width="35%"><span><s:property
								value="%{receiptBillForm.receipt.receiptNo}" /></span></td>

					<td width="15%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">制单日期：</td>
					<td width="35%"><s:property
							value="%{receiptBillForm.receipt.writeDate.substring(0,10)}" />
				</tr>
				<tr>
					<td width="15%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">入库人：</td>
					<td width="35%"><s:property
							value="%{receiptBillForm.receipt.registrant}" /></td>
					<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">入库日期：</td>
					<td><s:property value="%{receiptBillForm.receipt.enterDate}" /></td>

				</tr>
				<tr>
					<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">审核状态：</td>
					<td><s:select id="status"
							name="receiptBillForm.receipt.status"
							list="#{'0':'未审核','1':'已审核'}" class="span1-1" theme="simple" /></td>
					<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">供应商/部门：</td>
					<td><s:property value="%{receiptBillForm.receipt.supplier}" /></td>

				</tr>
				<tr>
					<td align="right" nowrap="nowrap" bgcolor="#f1f1f1">备注：</td>
					<td colspan="3"><s:property
							value="%{receiptBillForm.receipt.remark}" /></td>
				</tr>
			</table>
			<table class="table table-bordered">
				<thead>
					<tr>
						<td colspan="4"><a href="javascript:showBillImage('<s:property value="%{receiptBillForm.receipt.receiptNo}"/>')">发票扫描件</a></td>
					</tr>
					<tr>
						<td align="center" width="30px" bgcolor="#f1f1f1"><strong>序号</strong></td>
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
					<s:set name="sn" value="1" />
					<s:iterator var="dataList" value="%{receiptBillForm.receiptDetail}"
						status="stat">
						<tr>
							<td align="center"><s:property value="#sn" /></td>
							<td align="center"><s:property
									value="#dataList.commodityType" /></td>
							<td align="center"><s:property
									value="#dataList.productType.name" /></td>
							<td align="center"><s:property
									value="#dataList.productType.productGroup.groupName" /></td>
							<td align="center"><s:property value="#dataList.brand" /></td>
							<td align="center"><s:property value="#dataList.norm" /></td>
							<td align="center"><s:property value="#dataList.quantity" /></td>
							<td align="center"><s:property
									value="#dataList.productType.unit" /></td>
							<td align="center"><s:property value="#dataList.unitPrice" /></td>
							<td align="center"><s:property value="#dataList.amount" /></td>
							<td align="center"><s:property value="#dataList.taxRate" />%</td>
							<td align="center"><s:property value="#dataList.taxAmt" /></td>

						</tr>
						<s:set var="sn" value="#sn + 1" />
					</s:iterator>
				</tbody>
			</table>
			<table class="table table-bordered">
				<tr>
					<td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">合计</td>
					<td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">总数量：</td>
					<td width="23%"><s:property
							value="%{receiptBillForm.sumQuantity}" /></td>
					<td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">总金额：</td>
					<td><s:property value="%{receiptBillForm.sumAmount}" /></td>
					<td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">总税额：</td>
					<td><s:property value="%{receiptBillForm.sumTaxAmt}" /></td>
				</tr>
			</table>
		</s:form>
	</div>
</body>
</html>
