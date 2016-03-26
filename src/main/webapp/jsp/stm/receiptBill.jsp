<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<head>
<script type="text/javascript">
$(document).ready(function(){
	
});
function getPageData(index){
	var htmlAddress = "receiptBillQuery.action?index=" + index;
	document.queryForm.action = htmlAddress;
	document.queryForm.submit();

}
function getBillDetail(billNo){
	var docketType = $("#docketType").val();
	var htmlAddress = "receiptBillModiInit.action?update=1&receiptNo=" + billNo + "&docketType=" + docketType;
	location.href = htmlAddress;
}
function deleteOneReceipt(billNo){
	var index = $('#currentPage').val();
	var htmlAddress = "receiptBillDelete.action?receiptNo=" + billNo + "&index=" + index;
	var msg = "确定删除单号为:" + billNo + "的记录?";
	
	$main.messager.confirm('系统提示', msg, function(r){
		if (r){
			document.queryForm.action=htmlAddress;
			document.queryForm.submit();
		}
	});
}
function checkOneReceipt(billNo){
	var index = $('#currentPage').val();
	var htmlAddress = "receiptBillCheck.action?receiptNo=" + billNo + "&index=" + index;
	var msg = "确定审核单号为:" + billNo + "的记录?";
	$main.messager.confirm('系统提示', msg, function(r){
		if (r){
			document.queryForm.action = htmlAddress;
			document.queryForm.submit();
		}
	});

}
function unCheckOneReceipt(billNo){
	var index = $('#currentPage').val();
	var htmlAddress = "receiptBillUnCheck.action?receiptNo=" + billNo + "&index=" + index;
	var msg = "确定反审核单号为:" + billNo + "的记录?";
	
	$main.messager.confirm('系统提示', msg , function(r){
		if (r){
			document.queryForm.action=htmlAddress;
			document.queryForm.submit();
		}
	});
}

</script>
</head>
<body>
<div class="title_right">
  <s:if test="%{docketType==1}">
    <span class="pull-right margin-bottom-5"><a class="btn btn-info btn-small" href="receiptBillModiInit?update=0&docketType=1"><i class="icon-plus icon-white"></i>新建采购入库单</a></span>
    <strong>采购入库单查询</strong>
  </s:if>
  <s:if test="%{docketType==2}">
    <span class="pull-right margin-bottom-5"><a class="btn btn-info btn-small" href="receiptBillModiInit?update=0&docketType=2"><i class="icon-plus icon-white"></i>新建生产入库单</a></span>
    <strong>生产入库单查询</strong>
  </s:if>
</div>  
<div style="width:900px; margin:auto;">
  <s:form id="queryForm" name="queryForm" method="post" action="receiptBillQuery" namespace="/stm" theme="simple">
  <s:hidden id="currentPage" value="%{page.currentPage}"/>
  <s:hidden id="docketType" name="docketType"/>
  <table class="table table-bordered">
    <tr>
      <td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">单据号码：</td>
      <td width="23%">
        <s:textfield name="searchForm.receiptNo" class="span2 easyui-validatebox" 
        data-options="validType:'length[14,14]'" theme="simple"/>
      </td>
      <td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">开单时间：<s:property value="%docketType"/></td>
      <td width="43%">
        <s:textfield name="searchForm.startDate" class="span1-1 easyui-datebox" id="Calendar1" theme="simple"/>
        <span>~</span>
        <s:textfield name="searchForm.endDate" class="span1-1 easyui-datebox" id="Calendar2" theme="simple"/>
      </td>
      <td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">审核状态：</td>
      <td>
        <s:select name="searchForm.status" list="#{'0':'未审核','1':'已审核'}" class="span1-1" headerKey="" headerValue="请选择"/>
      </td>
    </tr>
  </table>
  </s:form>
  <table  class="margin-bottom-20 table  no-border" >
    <tr>
      <td class="text-center">
        <a class="easyui-linkbutton" style="width:80px;" onclick="getPageData(1)">查询</a>
      </td>
    </tr>
  </table>
  <div style="width:900px; height:340px; margin:auto; overflow-y:auto;">
  <table class="table table-bordered table-hover table-striped">
    <tbody>
      <tr align="center">
        <td nowrap="nowrap"><strong>序号</strong></td>
        <td nowrap="nowrap"><strong>单据号码</strong></td>
        <td nowrap="nowrap"><strong>入库人</strong></td>
        <td nowrap="nowrap"><strong>审核人</strong></td>
        <td nowrap="nowrap"><strong>审核状态</strong></td>
        <td nowrap="nowrap"><strong>制单日期</strong></td>
        <td nowrap="nowrap"><strong>审核日期</strong></td>
        <td nowrap="nowrap"><strong>入库日期</strong></td>
        <td width="80" nowrap="nowrap"><strong> 操作 </strong></td>
      </tr>
      <s:set name="sn" value="1"/>
      <s:iterator var="pageData" value="%{page.pageData}">
      <tr align="center">
        <td nowrap="nowrap"><s:property value="#sn"/></td>
        <!--  
        <td nowrap="nowrap">
          <s:if test="%{#pageData.type==1}">采购入库</s:if>
          <s:if test="%{#pageData.type==2}">生产入库</s:if>
        </td>
        -->
        <td nowrap="nowrap"><s:property value="#pageData.receiptNo"/></td>
        <td nowrap="nowrap"><s:property value="#pageData.registrant"/></td>
        <td nowrap="nowrap"><s:property value="#pageData.auditor"/></td>
        <td nowrap="nowrap">
          <s:if test="%{#pageData.status==0}"><span style="color:#f00;">未审核</span></s:if>
          <s:if test="%{#pageData.status==1}">已审核</s:if>
        </td>
        <td nowrap="nowrap"><s:property value="#pageData.writeDate.substring(0,10)"/></td>
        <td nowrap="nowrap"><s:property value="#pageData.confirmDate.substring(0,10)"/></td>
        <td><s:property value="#pageData.enterDate"/></td>
        <td nowrap="nowrap">
          <s:if test="%{#pageData.status==0}">
            <a href="javascript:deleteOneReceipt('<s:property value="#pageData.receiptNo"/>');">删除</a> 
            <a href="javascript:getBillDetail('<s:property value="#pageData.receiptNo"/>')">详情</a>
            <a href="javascript:checkOneReceipt('<s:property value="#pageData.receiptNo"/>');">审核</a>
            <span style="color: #999999;cursor: default;background-color: transparent;">反审</span>
          </s:if>
          <s:else>
            <span style="color: #999999;cursor: default;background-color: transparent;">删除</span> 
            <a href="javascript:getBillDetail('<s:property value="#pageData.receiptNo"/>')">详情</a>
            <span style="color: #999999;cursor: default;background-color: transparent;">审核</span>
            <a href="javascript:unCheckOneReceipt('<s:property value="#pageData.receiptNo"/>');">反审</a>
          </s:else>
        </td>
      </tr>
      <s:set var="sn" value="#sn + 1" />
      </s:iterator>       
   
    </tbody>
  </table>
  </div>
</div>
<div class="pagination text-center">
  <ul>
    <s:set name="currentPage" value="%{page.currentPage}"/>
    <s:set name="lastIndex" value="#currentPage + 4" />
    <s:set name="preIndex" value="#currentPage - 1" />
    <s:set name="nextIndex" value="#currentPage + 1" />
    <s:set name="pageCnt" value="%{page.pageCnt}" />
    <s:set name="index" value="%{page.currentPage}" />
    
    <s:if test="#preIndex==0">
      <li class="disabled"><span>&laquo;</span></li>
      <li class="disabled"><span>上一页</span></li>
    </s:if>
    <s:else>
      <li><a href="javascript:getPageData(1)">&laquo;</a></li>
      <li><a href="javascript:getPageData(<s:property value="preIndex"/>)">上一页</a></li>
    </s:else>
    
    <s:bean name="org.apache.struts2.util.Counter">
      <s:param name="first" value="1"/>
     
      <s:param name="last" value="5"/>
      <s:iterator status="stat">
        
        <s:if test="#index<=#pageCnt">
          <li><a href="javascript:getPageData(<s:property value="#stat.index+#currentPage"/>)"><s:property value="#stat.index+#currentPage"/></a></li>
        </s:if>
        <s:else>
          <li class="disabled"><span><s:property value="#stat.index+#currentPage"/></span></li>
        </s:else>  
        <s:set var="index" value="#index + 1" />
      </s:iterator>
    </s:bean>
    
    <s:if test="#currentPage>=#pageCnt">
      <li class="disabled"><span>下一页</span></li>
      <li class="disabled"><span>&raquo;</span></li> 
    </s:if>
    <s:else>
      <li><a href="javascript:getPageData(<s:property value="nextIndex"/>)">下一页</a></li>
      <li><a href="javascript:getPageData(<s:property value="pageCnt"/>)">&raquo;</a></li> 
    </s:else>
  </ul>
</div>
</body>