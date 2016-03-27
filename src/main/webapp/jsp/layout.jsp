<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="/struts-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>仓库管理系统</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css">
<!--<link rel="stylesheet" type="text/css" href="./demo.css"> -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-2.2.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//var $currTab = $('#tabs').tabs('getSelected');
	//alert($currTab.find('iframe').attr("src"));
	$(".menuTree").each(function(){
		//alert("sss");
		
		$(this).tree({onClick:function(node){
			var url = node.attributes.url;
			var title = node.text;
			if(!$('#tabs').tabs('exists', title)){
				$('#tabs').tabs('add', {
	                title: title,
	                content:'<iframe src="'+ node.attributes.url+'" frameBorder="0" border="0" scrolling="auto" style="width: 100%; height: 100%;"/>',  
	                closable: true});  
			}else{
				$('#tabs').tabs('select', title);
			}
		}});
	});
});



</script>
</head>
<body class="easyui-layout">
<div data-options="region:'north',border:false" class="header">
    <tiles:insertAttribute name="head"/>
</div>
<div id="menu" data-options="region:'west',split:true,title:'导航菜单'" style="width: 200px; padding: 1px;">
	<div class="easyui-accordion" data-options="fit:true,border:false">
	    <tiles:insertAttribute name="menu"/>
	</div>
</div>
<div data-options="fit:false,region:'center',border:false">
	<div id="tabs" class="easyui-tabs" data-options="fit:true,border:false" >
		<tiles:insertAttribute name="main"/>
	</div>
</div>
<!--<div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">east region</div>-->
<div data-options="region:'south',border:false" class="footer">
	Copyright&copy;2016 版权所有
</div>
<div id="parent_win">
    
</div>

</body>
</html>