package com.erp.stm.action;

import java.util.HashMap;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.transaction.annotation.Transactional;

import com.erp.common.action.CmAction;
import com.erp.common.model.Page;
import com.erp.common.model.User;
import com.erp.common.util.CommonUtil;
import com.erp.common.util.Const;
import com.erp.stm.IService.IReceiptBillService;
import com.erp.stm.IService.IReceiptService;
import com.erp.stm.model.Receipt;
import com.erp.stm.model.form.ReceiptSearchForm;


public class ReceiptBillAction extends CmAction{
	
	private String docketType;
	private Page<Receipt> page;
	private String receiptNo;
	private ReceiptSearchForm searchForm;
	private Integer index;
	
	
	private IReceiptService receiptService;
	private IReceiptBillService receiptBillService;
	
	public String init(){
		searchForm = new ReceiptSearchForm();
	    searchForm.setStartDate(CommonUtil.getFirstDayOfTheMonth());
	    searchForm.setEndDate(CommonUtil.getCurrentDate());
	    index = Const.FIRST_PAGE_INDEX;
		return SUCCESS;
	}
	
	public String query(){
		System.out.println("docketType:" + docketType);
		
	    page = getIndexPage();
		return SUCCESS;
	}
	
	@RequiresRoles(value={"sysadmin"}, logical= Logical.OR)
	public String delete(){
		Map<String,Object> parmMap = new HashMap<String,Object>();
		parmMap.put("depotId", Const.DEFAULT_DEPOT_ID);
		parmMap.put("receiptNo", receiptNo);
		receiptService.deleteOneReceipt(parmMap);
		this.addActionMessage("单号为(" + receiptNo + ")的记录删除成功!");
		page = getIndexPage();
		return SUCCESS;
	}

	@RequiresRoles(value={"sysadmin","stockman"}, logical= Logical.OR)
	public String check(){
		try{
			Subject subject = SecurityUtils.getSubject();
		    Session session = subject.getSession();
		    User user = (User)session.getAttribute("user");
		    receiptBillService.checkReceiptBillForm(Const.DEFAULT_DEPOT_ID, receiptNo ,user);
		    this.addActionMessage("单据号为(" + receiptNo + ")的单据审核成功!");
		}catch(RuntimeException e){
			System.out.println(e.getMessage());
			this.addActionError(e.getMessage());
		}	
		page = getIndexPage();
		return SUCCESS;
	}
	
	@RequiresRoles(value={"sysadmin"}, logical= Logical.OR)
	public String unCheck(){
		try{
			Subject subject = SecurityUtils.getSubject();
		    Session session = subject.getSession();
		    User user = (User)session.getAttribute("user");
		    receiptBillService.unCheckReceiptBillForm(Const.DEFAULT_DEPOT_ID, receiptNo ,user);
		    this.addActionMessage("单据号为(" + receiptNo + ")的单据反审核成功!");
		}catch(RuntimeException e){
			this.addActionError(e.getMessage());
		}
		page = getIndexPage();
		return SUCCESS;
	}
	
	private Page<Receipt> getIndexPage(){
		Map<String,Object> parmMap = new HashMap<String,Object>();
		parmMap.put("depotId", Const.DEFAULT_DEPOT_ID);
		parmMap.put("startDate", searchForm.getStartDate());
		parmMap.put("endDate", searchForm.getEndDate());
		parmMap.put("receiptNo", searchForm.getReceiptNo());
		parmMap.put("type", docketType);
		parmMap.put("status", searchForm.getStatus());
		Page<Receipt> page = receiptService.getIndexPage(index, parmMap);
		return page;
	}

	public String getDocketType() {
		return docketType;
	}

	public void setDocketType(String docketType) {
		this.docketType = docketType;
	}

	public Page<Receipt> getPage() {
		return page;
	}

	public void setPage(Page<Receipt> page) {
		this.page = page;
	}


	public String getReceiptNo() {
		return receiptNo;
	}

	public void setReceiptNo(String receiptNo) {
		this.receiptNo = receiptNo;
	}

	public Integer getIndex() {
		return index;
	}

	public void setIndex(Integer index) {
		this.index = index;
	}

	public IReceiptService getReceiptService() {
		return receiptService;
	}

	public void setReceiptService(IReceiptService receiptService) {
		this.receiptService = receiptService;
	}

	public IReceiptBillService getReceiptBillService() {
		return receiptBillService;
	}

	public void setReceiptBillService(IReceiptBillService receiptBillService) {
		this.receiptBillService = receiptBillService;
	}

	public ReceiptSearchForm getSearchForm() {
		return searchForm;
	}

	public void setSearchForm(ReceiptSearchForm searchForm) {
		this.searchForm = searchForm;
	}

}
