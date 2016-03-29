<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="/struts-tags"%>
<script type="text/javascript">
<!--

//-->
</script>
<div title="数据查询" style="padding: 0px;">
    <ul id="menuTree" class="easyui-tree menuTree" data-options="animate:true,lines:true">
	    <li data-options="iconCls:'icon-doc',attributes:{'url':'<%=request.getContextPath()%>/report/inventoryReportInit.action'}">库存查询</li>
		<li data-options="iconCls:'icon-doc',attributes:{'url':'<%=request.getContextPath()%>/report/billReportInit.action'}">单据查询</li>
	</ul>
</div>
<div title="库存管理" style="padding: 0px;">
    <ul id="menuTree" class="easyui-tree menuTree" data-options="animate:true,lines:true">
	    <li data-options="iconCls:'icon-folder'"><span>入库登记</span>
	        <ul>
		        <li data-options="iconCls:'icon-doc',attributes:{'url':'<%=request.getContextPath()%>/stm/receiptBillInit.action?docketType=1'}">采购入库</li>
				<li data-options="iconCls:'icon-doc',attributes:{'url':'<%=request.getContextPath()%>/stm/receiptBillInit.action?docketType=2'}">生产入库</li>
				<li data-options="iconCls:'icon-doc',attributes:{'url':'<%=request.getContextPath()%>/stm/receiptBillInit.action?docketType=0'}">其它入库</li>
			</ul>
		</li>
		<li data-options="iconCls:'icon-folder'"><span>出库登记</span>
	        <ul>
		        <li data-options="iconCls:'icon-doc',attributes:{'url':'<%=request.getContextPath()%>/stm/deliveryBillInit.action?docketType=3'}">采购退货</li>
				<li data-options="iconCls:'icon-doc',attributes:{'url':'<%=request.getContextPath()%>/stm/deliveryBillInit.action?docketType=4'}">领用退库</li>
				<li data-options="iconCls:'icon-doc',attributes:{'url':'<%=request.getContextPath()%>/stm/deliveryBillInit.action?docketType=5'}">其它出库</li>
			</ul>
		</li>
	</ul>
</div>
<div title="基础资料" style="padding: 0px;">
    <ul id="menuTree" class="easyui-tree menuTree" data-options="animate:true,lines:true">
	    <li data-options="iconCls:'icon-doc',attributes:{'url':'<%=request.getContextPath()%>/common/supplierInit.action'}">往来单位管理</li>
		<li data-options="iconCls:'icon-folder'"><span>货品管理</span>
	        <ul>
		        <li data-options="iconCls:'icon-doc',attributes:{'url':'<%=request.getContextPath()%>/common/productGroupInit.action'}">货品大类</li>
				<li data-options="iconCls:'icon-doc',attributes:{'url':'<%=request.getContextPath()%>/common/productTypeInit.action'}">货品小类</li>
			</ul>
		</li>
	</ul>
</div>
<div title="系统管理" data-options="selected:true" style="padding: 0px;">
    <ul id="menuTree" class="easyui-tree menuTree" data-options="animate:true,lines:true">
	    <li data-options="iconCls:'icon-doc',attributes:{'url':'<%=request.getContextPath()%>/common/userInit.action'}">用户管理</li>
	</ul>
</div>