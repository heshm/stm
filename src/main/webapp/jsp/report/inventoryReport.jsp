<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">
function getPageData(index){
	var htmlAddr = "inventoryReportQuery.action?index=" + index;
	document.queryForm.action = htmlAddr;
	document.queryForm.submit();
}
</script>

<body>
<div class="title_right">
    <strong>库存查询</strong>
</div>
<div style="width:900px; margin:auto;">
   <s:form name="queryForm" method="post" action="inventoryReportQuery" namespace="/report" theme="simple">
  <table class="table table-bordered">
   
    <tr>
      
      <td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">货品类别：</td>
      <td width="23%">
        <s:select name="commodityType" list="%{#session.productGroup}" class="span2" listKey="groupId" listValue="groupName" theme="simple" headerKey="" headerValue="全部" />
      </td>
      <td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">货品名称：</td>
      <td width="23%"><s:textfield name="name"  class="span2" theme="simple"/></td>
      <td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">截止日期：</td>
      <td>
        <s:textfield name="cutDate" class="span1-1 easyui-datebox" theme="simple"/>
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
        <td nowrap="nowrap"><strong>类别</strong></td>
        <td nowrap="nowrap"><strong>品名</strong></td>
        <td nowrap="nowrap"><strong>库存数量</strong></td>
        <td nowrap="nowrap"><strong>单位</strong></td>
        <td nowrap="nowrap"><strong>平均入库价</strong></td>
        <td nowrap="nowrap"><strong>入库数量</strong></td>
        <td nowrap="nowrap"><strong>入库金额</strong></td>
        <td nowrap="nowrap"><strong>平均入库税率(%)</strong></td>
        <td nowrap="nowrap"><strong>入库税额</strong></td>
        <td nowrap="nowrap"><strong>平均出库价</strong></td>
        <td nowrap="nowrap"><strong>出库数量</strong></td>
        <td nowrap="nowrap"><strong>出库金额</strong></td>
        <td nowrap="nowrap"><strong>平均出库税率(%)</strong></td>
        <td nowrap="nowrap"><strong>出库税额</strong></td>
      </tr>
      <s:set name="sn" value="1"/>
      <s:iterator var="pageData" value="%{page.pageData}">
      <tr align="center">
        <td nowrap="nowrap"><s:property value="#sn"/></td>
        <td nowrap="nowrap"><s:property value="#pageData.groupName"/></td>
        <td nowrap="nowrap"><s:property value="#pageData.name"/></td>
        <td nowrap="nowrap"><s:property value="#pageData.inQuantity-#pageData.outQuantity"/></td>
        <td nowrap="nowrap"><s:property value="#pageData.unit"/></td>
        <td nowrap="nowrap"><s:property value="#pageData.inAveragePrice"/></td>
        <td nowrap="nowrap"><s:property value="#pageData.inQuantity"/></td>
        <td nowrap="nowrap"><s:property value="#pageData.inAmount"/></td>
        <td nowrap="nowrap"><s:property value="#pageData.inAverageTaxRate"/></td>
        <td nowrap="nowrap"><s:property value="#pageData.inTaxAmt"/></td>
        <td nowrap="nowrap"><s:property value="#pageData.outAveragePrice"/></td>
        <td nowrap="nowrap"><s:property value="#pageData.outQuantity"/></td>
        <td nowrap="nowrap"><s:property value="#pageData.outAmount"/></td>
        <td nowrap="nowrap"><s:property value="#pageData.outAverageTaxRate"/></td>
        <td nowrap="nowrap"><s:property value="#pageData.outTaxAmt"/></td>
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
