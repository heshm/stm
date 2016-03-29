<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">


</script>
<div style="width:350px; margin: 20px auto auto auto;">
    <ul id="lookUpData" class="easyui-datalist" lines="true">
    <s:iterator var="list" value="%{resultList}">
        <li value="<s:property value="#list.dataKey"/>"><s:property value="#list.dataValue"/></li>
    </s:iterator>
	</ul>
</div>


