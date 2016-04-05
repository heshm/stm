package com.erp.stm.action;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.session.Session;

import com.erp.common.action.CmAction;
import com.erp.common.model.Page;
import com.erp.common.model.User;
import com.erp.common.util.CommonUtil;
import com.erp.common.util.Const;
import com.erp.stm.IService.IDeliveryBillService;
import com.erp.stm.IService.IDeliveryService;
import com.erp.stm.model.Delivery;
import com.erp.stm.model.form.DeliverySearchForm;

public class DeliveryBillAction extends CmAction{
	
	private Integer index;
	private String docketType;
	private Page<Delivery> page;
	private String deliveryNo;
	private DeliverySearchForm searchForm;
	
	private IDeliveryService deliveryService; 
	private IDeliveryBillService deliveryBillService;
	
	public String init(){
		searchForm = new DeliverySearchForm();
	    searchForm.setStartDate(CommonUtil.getFirstDayOfTheMonth());
	    searchForm.setEndDate(CommonUtil.getCurrentDate());
	    index = Const.FIRST_PAGE_INDEX;
		return SUCCESS;
	}
	
	public String query(){
	    page = getIndexPage();
		return SUCCESS;
	}
	
	@RequiresRoles(value={"sysadmin","stockman"}, logical= Logical.OR)
	public String check(){
		try{
		    Session session = this.getSession();
		    User user = (User)session.getAttribute("user");
		    deliveryBillService.checkDelioveryBill(Const.DEFAULT_DEPOT_ID, deliveryNo, user);
		    this.addActionMessage("单据号为(" + deliveryNo + ")的单据审核成功!");
		    
			
		}catch(RuntimeException e){
			this.addActionError(e.getMessage());
		}
		page = getIndexPage();
		//startDate = CommonUtil.getFirstDayOfTheMonth();
	   // endDate = CommonUtil.getCurrentDate();
		
		return SUCCESS;
	}
	
	@RequiresRoles(value={"sysadmin"}, logical= Logical.OR)
	public String unCheck(){
		try{
		    Session session = this.getSession();
	        User user = (User)session.getAttribute("user");
	        deliveryBillService.unCheckDelioveryBill(Const.DEFAULT_DEPOT_ID, deliveryNo, user);
	        this.addActionMessage("单据号为(" + deliveryNo + ")的单据反审核成功!");
	    
		}catch(RuntimeException e){
			this.addActionError(e.getMessage());
		}
	    page = getIndexPage();
		return SUCCESS;
	}
	
	@RequiresRoles(value={"sysadmin"}, logical= Logical.OR)
	public String delete(){
		Map<String,String> parmMap = new HashMap<String,String>();
		parmMap.put("depotId", Const.DEFAULT_DEPOT_ID);
		parmMap.put("deliveryNo", deliveryNo);
		deliveryService.deleteOneDelivery(parmMap);
		this.addActionMessage("单号为(" + deliveryNo + ")的记录删除成功!");
		page = getIndexPage();
		return SUCCESS;
	}

	private Page<Delivery> getIndexPage(){
		 Map<String,Object> parmMap = new HashMap<String,Object>();
		 parmMap.put("depotId", Const.DEFAULT_DEPOT_ID);
		 parmMap.put("startDate", searchForm.getStartDate());
		 parmMap.put("endDate", searchForm.getEndDate());
		 parmMap.put("type", docketType);
		 parmMap.put("status", searchForm.getStatus());
		 parmMap.put("deliveryNo", searchForm.getDeliveryNo());
		 Page<Delivery> page = deliveryService.getIndexPage(index, parmMap);
		 return page;
	}

	public Integer getIndex() {
		return index;
	}

	public void setIndex(Integer index) {
		this.index = index;
	}

	public String getDocketType() {
		return docketType;
	}

	public void setDocketType(String docketType) {
		this.docketType = docketType;
	}

	public Page<Delivery> getPage() {
		return page;
	}

	public void setPage(Page<Delivery> page) {
		this.page = page;
	}

	public IDeliveryService getDeliveryService() {
		return deliveryService;
	}

	public void setDeliveryService(IDeliveryService deliveryService) {
		this.deliveryService = deliveryService;
	}

	public String getDeliveryNo() {
		return deliveryNo;
	}

	public void setDeliveryNo(String deliveryNo) {
		this.deliveryNo = deliveryNo;
	}

	public IDeliveryBillService getDeliveryBillService() {
		return deliveryBillService;
	}

	public void setDeliveryBillService(IDeliveryBillService deliveryBillService) {
		this.deliveryBillService = deliveryBillService;
	}

	public DeliverySearchForm getSearchForm() {
		return searchForm;
	}

	public void setSearchForm(DeliverySearchForm searchForm) {
		this.searchForm = searchForm;
	}

}
