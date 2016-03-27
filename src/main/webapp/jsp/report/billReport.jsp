<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">
$(document).ready(function(){
	
	
	 $('.info').on('click',function () {
         var $tr = $(this).parents('tr');
         var billNo = $tr.find("td").eq(2).html();

         var url = "billReportDetail.action?billNo=" + billNo;
      
         window.open(
             url, 
            'newwindow', 
            'height=500px, width=900px, top=100,left=200,location=no ,scrollbars=yes, resizable=yes');
     });
});
function getPageData(index){
	var htmlAddr = "billReportQuery.action?index=" + index;
	document.queryForm.action = htmlAddr;
	document.queryForm.submit();
}
</script>
<body>
<div class="title_right">
    <strong>单据查询</strong>
</div>

<div style="width:900px; margin:auto;">
  <s:form name="queryForm" method="post" action="billReportQuery" namespace="/report" theme="simple">
  <table class="table table-bordered">
    <tr>
      
      <td width="20%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">开单日期：</td>
      <td width="30%">
        <s:textfield name="startDate" class="span1-1 easyui-datebox" />
        ~<s:textfield name="endDate" cssClass="span1-1 easyui-datebox"/>
      </td>
      <td width="20%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">单据类型：</td>
      <td width="30%">
           <s:select name="type" list="#{'0':'未用退库','1':'采购入库','2':'生产入库','3':'采购退货','4':'领用退库'}" class="span1-1" theme="simple" headerKey="" headerValue="全部" />
      </td>
    </tr>
  </table>
  </s:form>
  <table  class="margin-bottom-10 table  no-border" >
    <tr>
      <td class="text-center"><input type="button" value="查询" class="btn btn-info " style="width:80px;" onclick="getPageData(1)"/></td>
    </tr>
  </table>
  <div style="width:900px; height:340px; margin:auto; overflow-y:auto;">
  <table class="table table-bordered table-hover table-striped">
    <tbody>
      <tr align="center">
        <td nowrap="nowrap"><strong>序号</strong></td>
        <td nowrap="nowrap"><strong>单据类型</strong></td>
        <td nowrap="nowrap"><strong>单号</strong></td>
        <td nowrap="nowrap"><strong>审核状态</strong></td>
        <td nowrap="nowrap"><strong>制单人</strong></td>
        <td nowrap="nowrap"><strong>审核人</strong></td>
        <td nowrap="nowrap"><strong>制单时间</strong></td>
        <td nowrap="nowrap"><strong>审核时间</strong></td>
        <td nowrap="nowrap"><strong>详细</strong></td>
      </tr>
      <s:set name="sn" value="1"/>
      <s:iterator var="pageData" value="%{page.pageData}">
      <tr align="center">
        <td nowrap="nowrap"><s:property value="#sn"/></td>
        <td nowrap="nowrap">
          <s:property value="#pageData.type"/>
        </td>
        <td nowrap="nowrap" id="billNo"><s:property value="#pageData.billNo"/></td>
        <td nowrap="nowrap">
          <s:if test="%{#pageData.status==0}"><span style="color:#f00;">未审核</span></s:if>
          <s:if test="%{#pageData.status==1}">已审核</s:if>
        </td>
        <td nowrap="nowrap"><s:property value="#pageData.registrant"/></td>
        <td nowrap="nowrap"><s:property value="#pageData.auditor"/></td>
        <td nowrap="nowrap"><s:property value="#pageData.writeDate"/></td>
        <td nowrap="nowrap"><s:property value="#pageData.confirmDate"/></td>
        <td nowrap="nowrap"><a class="btn btn-mini btn-primary info">详细</a></td>
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

