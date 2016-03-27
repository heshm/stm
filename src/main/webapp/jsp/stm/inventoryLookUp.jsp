<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">

function computeOneAmt(){
	var danjia = $("#danjia").val();
	var shuliang = $("#shuliang").val();
	var jine = danjia * shuliang;
	jine = jine.toFixed(2);
	$("#jine").text(jine);
}
function computeTaxAmt(){
	var danjia = $("#danjia").val();
	var shuliang = $("#shuliang").val();
	var taxRate = $("#taxRate").val();
	var taxAmt = danjia * shuliang * taxRate / 100;
	taxAmt = taxAmt.toFixed(2);
	$("#taxAmt").text(taxAmt);
}
</script>
<div id="inventory" style="width:350px; margin: 20px auto auto auto;">
<form action="#" id="lookUpForm">
  <table class="table table-bordered">
    <tr>
      <td width="30%" align="right" bgcolor="#eaf2ff">货品类别:</td>
      <td width="70%" align="left">
        <span id="groupName"><s:property value="%{productType.productGroup.groupName}"/></span>
        <s:hidden id="groupId" name="productType.groupId"/>
      </td>
    </tr>
    <tr>
      <td width="30%" align="right" bgcolor="#eaf2ff">货品名称:</td>
      <td width="70%" align="left">
        <span id="hpmc"><s:property value="%{productType.name}"/></span>
        <s:hidden id="typeId" name="productType.typeId"/>
      </td>
    </tr>
    <tr>
      <td width="30%" align="right" bgcolor="#eaf2ff">品牌名称:</td>
      <td width="70%" align="left">
        <input id="ppmc" type="text" class="span1-1 easyui-textbox" data-options="required:true"/>
      </td>
    </tr>
    <tr>
      <td width="30%" align="right" bgcolor="#eaf2ff">货品规格:</td>
      <td width="70%" align="left">
        <input id="guige" type="text" class="span1-1 easyui-textbox" data-options="required:true"/>
      </td>
    </tr>
    <tr title="参考入库价:<s:property value="%{productType.refInPrice}"/><br>参考出库价:<s:property value="%{productType.refOutPrice}"/>" class="easyui-tooltip">
      <td width="30%" align="right" bgcolor="#eaf2ff">单价:</td>
      <td width="70%" align="left">
        <input id="danjia" type="text" class="span1-1 easyui-numberbox" 
        data-options="precision:2,required:true,min:0"/>元/<s:property value="%{productType.unit}"/>
      </td>
    </tr>
    <tr>
      <td width="30%" align="right" bgcolor="#eaf2ff">数量:</td>
      <td width="70%" align="left">
        <input id="shuliang" type="text" class="span1-1 easyui-numberbox" 
        data-options="precision:<s:property value="%{productType.decNo}"/>,min:0,required:true,events:{blur: function(){computeOneAmt()}}"/>
        <s:property value="%{productType.unit}"/></td>
    </tr>
    <tr>
      <td width="30%" align="right" bgcolor="#eaf2ff">税率:</td>
      <td width="70%" align="left">
        <input id="taxRate" type="text" class="span1-1 easyui-numberbox" 
        data-options="precision:3,required:true,min:0,max:50,events:{blur: function(){computeTaxAmt()}}"/>%</td>
    </tr>
    <tr>
      <td width="30%" align="right" bgcolor="#eaf2ff">当前库存:</td>
      <td width="70%" align="left">
        <span><s:property value="%{inventory.inQuantity-inventory.outQuantity}"/></span>
        <span><s:property value="%{productType.unit}"/></span>
        <s:hidden id="danwei" name="productType.unit"/>
      </td>
    </tr>
  </table>
  <table class="table table-bordered">
    <tr>
      <td width="15%" align="right" bgcolor="#eaf2ff">金额:</td>
      <td width="35%" align="left"><span id="jine">0.00</span></td>
      <td width="15%" align="right" bgcolor="#eaf2ff">税额:</td>
      <td width="35%" align="left"><span id="taxAmt">0.00</span></td>
    </tr>
  </table>
</form>
</div>


