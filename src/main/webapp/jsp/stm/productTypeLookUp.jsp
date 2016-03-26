<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<head>
<script type="text/javascript">
$(document).ready(function(){
	$("#productType").tree({onClick:function(node){
		var articalNo = node.articalNo;
		if(!(articalNo === undefined)){
		    var htmlAddr = "<%=request.getContextPath()%>/stm/inventoryLookUpInit.action?commodityType=" + articalNo;
		    $("#content").panel({
	            href: htmlAddr
		    });
	    }
	}});
});

</script>
</head>
<div class="easyui-layout" fit="true">
    <div region="west" split="true" style="width:200px;">
		<ul id="productType" class="easyui-tree menuTree" data-options="animate:true,lines:true">
		    <li data-options="iconCls:'icon-folder'">
		        <span>货品选择</span>
		        <ul>
		            <s:iterator var="parent" value="%{menuList}">
		            <li data-options="iconCls:'icon-folder',state:'closed'">
		                <span><s:property value="#parent.productGroup.groupName"/></span>
		                <ul>
		                    <s:iterator var="children" value="#parent.productTypeList">
		                    <li data-options="iconCls:'icon-doc',articalNo:'<s:property value="#children.groupId"/><s:property value="#children.typeId"/>'">
		                        <span><s:property value="#children.name"/></span>
		                    </li>
		                    </s:iterator>
		                </ul>
		            </li>
		            </s:iterator>
			    </ul>
		    </li>
	    </ul>   
	</div>
	<div id="content" region="center" border="false" class="easyui-panel">
        
	</div>
</div>


