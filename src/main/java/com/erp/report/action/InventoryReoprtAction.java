package com.erp.report.action;

import java.util.HashMap;
import java.util.Map;

import com.erp.common.action.CmAction;
import com.erp.common.model.Page;
import com.erp.common.util.Const;
import com.erp.report.IService.IInventoryReportService;
import com.erp.report.model.InventoryReport;

public class InventoryReoprtAction extends CmAction {
	
	private IInventoryReportService inventoryReportService;
	
	private Page<InventoryReport> page;
	
	private Integer index;
	
	private String commodityType;
	
	private String name;
	
	private String cutDate;
	
	public String init(){
		page = new Page<InventoryReport>();
		return SUCCESS;
	}
	
	public String query(){
		Map<String,String> map = new HashMap<String,String>();
		map.put("depotId", Const.DEFAULT_DEPOT_ID);
		map.put("commodityType", commodityType);
		map.put("name", name);
		page = inventoryReportService.getIndexPage(index, map);
		return SUCCESS;
	}

	public IInventoryReportService getInventoryReportService() {
		return inventoryReportService;
	}

	public void setInventoryReportService(IInventoryReportService inventoryReportService) {
		this.inventoryReportService = inventoryReportService;
	}

	public Page<InventoryReport> getPage() {
		return page;
	}

	public void setPage(Page<InventoryReport> page) {
		this.page = page;
	}

	public Integer getIndex() {
		return index;
	}

	public void setIndex(Integer index) {
		this.index = index;
	}

	public String getCommodityType() {
		return commodityType;
	}

	public void setCommodityType(String commodityType) {
		this.commodityType = commodityType;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCutDate() {
		return cutDate;
	}

	public void setCutDate(String cutDate) {
		this.cutDate = cutDate;
	}

}
