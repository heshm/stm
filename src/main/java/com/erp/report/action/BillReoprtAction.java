package com.erp.report.action;

import java.util.HashMap;
import java.util.Map;

import com.erp.common.action.CmAction;
import com.erp.common.model.Page;
import com.erp.common.util.CommonUtil;
import com.erp.common.util.Const;
import com.erp.report.IService.IBillReportService;
import com.erp.report.model.InventoryReport;
import com.erp.stm.IService.IDeliveryBillService;
import com.erp.stm.IService.IReceiptBillService;
import com.erp.stm.model.form.DeliveryBillForm;
import com.erp.stm.model.form.ReceiptBillForm;

public class BillReoprtAction extends CmAction {
	
	private String startDate;
	private String endDate;
	private String type;
	private Page<InventoryReport> page;
	private Integer index;
	private String billNo;
	private ReceiptBillForm receiptBillForm;
	private DeliveryBillForm deliveryBillForm;
	
	private IBillReportService billReportService;
	private IReceiptBillService receiptBillService;
	private IDeliveryBillService deliveryBillService;
	
	public String init(){
		startDate = CommonUtil.getFirstDayOfTheMonth();
		endDate = CommonUtil.getCurrentDate();
		page = new Page<InventoryReport>();
		
		
		
		return SUCCESS;
	}
	
	public String query(){
		System.out.println("startDate:" + startDate);
		System.out.println("endDate:" + endDate);
		Map<String,String> map = new HashMap<String,String>();
		map.put("depotId", Const.DEFAULT_DEPOT_ID);
		map.put("type", type);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		page = billReportService.getIndexPage(index, map);
		return SUCCESS;
	}
	
	public String getInfo(){
		if(billNo.startsWith("RK")){
			Map<String,String> map = new HashMap<String,String>();
			map.put("depotId", Const.DEFAULT_DEPOT_ID);
			map.put("receiptNo", billNo);
			receiptBillForm = receiptBillService.getOneReceiptBillForm(map);
			return "receipt";
		}
		if(billNo.startsWith("CK")){
			Map<String,String> map = new HashMap<String,String>();
			map.put("depotId", Const.DEFAULT_DEPOT_ID);
			map.put("deliveryNo", billNo);
			deliveryBillForm = deliveryBillService.getOneDeliveryBillForm(map);
			return "delivery";
		}
		return ERROR;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public Page<InventoryReport> getPage() {
		return page;
	}

	public void setPage(Page<InventoryReport> page) {
		this.page = page;
	}

	public IBillReportService getBillReportService() {
		return billReportService;
	}

	public void setBillReportService(IBillReportService billReportService) {
		this.billReportService = billReportService;
	}

	public Integer getIndex() {
		return index;
	}

	public void setIndex(Integer index) {
		this.index = index;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getBillNo() {
		return billNo;
	}

	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}

	public IReceiptBillService getReceiptBillService() {
		return receiptBillService;
	}

	public void setReceiptBillService(IReceiptBillService receiptBillService) {
		this.receiptBillService = receiptBillService;
	}

	public IDeliveryBillService getDeliveryBillService() {
		return deliveryBillService;
	}

	public void setDeliveryBillService(IDeliveryBillService deliveryBillService) {
		this.deliveryBillService = deliveryBillService;
	}

	public ReceiptBillForm getReceiptBillForm() {
		return receiptBillForm;
	}

	public void setReceiptBillForm(ReceiptBillForm receiptBillForm) {
		this.receiptBillForm = receiptBillForm;
	}

	public DeliveryBillForm getDeliveryBillForm() {
		return deliveryBillForm;
	}

	public void setDeliveryBillForm(DeliveryBillForm deliveryBillForm) {
		this.deliveryBillForm = deliveryBillForm;
	}

}
