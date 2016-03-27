package com.erp.stm.action;

import java.util.HashMap;
import java.util.Map;

import com.erp.common.IService.IProductTypeService;
import com.erp.common.action.CmAction;
import com.erp.common.model.ProductType;
import com.erp.common.util.Const;
import com.erp.stm.IService.IInventoryService;
import com.erp.stm.model.Inventory;

public class InventoryLookUpAction extends CmAction {
	
	private String commodityType;
    private ProductType productType;
	private Inventory inventory;
	
	private IProductTypeService productTypeService;
	private IInventoryService inventoryService;
	
	public String init(){
		Map<String,String> map = new HashMap<String,String>();
		//System.out.println(commodityType.substring(0,2));
		//System.out.println(commodityType.substring(2));
		map.put("groupId", commodityType.substring(0,2));
		map.put("typeId", commodityType.substring(2));
		productType = productTypeService.getOneProductType(map);
		
		map.clear();
		map.put("depotId", Const.DEFAULT_DEPOT_ID);
		map.put("commodityType",commodityType);
		inventory = inventoryService.getOneInventory(map);
		if(null == inventory){
			inventory = new Inventory();
			inventory.setInQuantity(0f);
			inventory.setOutQuantity(0f);
		}
		return SUCCESS;
	}

	public String getCommodityType() {
		return commodityType;
	}

	public void setCommodityType(String commodityType) {
		this.commodityType = commodityType;
	}

	public ProductType getProductType() {
		return productType;
	}

	public void setProductType(ProductType productType) {
		this.productType = productType;
	}

	public Inventory getInventory() {
		return inventory;
	}

	public void setInventory(Inventory inventory) {
		this.inventory = inventory;
	}

	public IProductTypeService getProductTypeService() {
		return productTypeService;
	}

	public void setProductTypeService(IProductTypeService productTypeService) {
		this.productTypeService = productTypeService;
	}

	public IInventoryService getInventoryService() {
		return inventoryService;
	}

	public void setInventoryService(IInventoryService inventoryService) {
		this.inventoryService = inventoryService;
	}

}
