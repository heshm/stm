package com.erp.stm.action;

import com.erp.common.action.CmAction;

public class InventoryLookUpAction extends CmAction {
	
	private String commodityType;
	
	public String init(){
		return SUCCESS;
	}

	public String getCommodityType() {
		return commodityType;
	}

	public void setCommodityType(String commodityType) {
		this.commodityType = commodityType;
	}

}
