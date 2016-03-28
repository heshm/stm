package com.erp.common.action;

import java.util.List;

import com.erp.common.IService.ISupplierService;
import com.erp.common.model.Supplier;

public class SupplierAction extends CmAction {
	
	private List<Supplier> supplierList;
	private ISupplierService supplierService;
	
	public String init(){
		supplierList = supplierService.getSupplierList();
		return SUCCESS;
	}

	public List<Supplier> getSupplierList() {
		return supplierList;
	}

	public void setSupplierList(List<Supplier> supplierList) {
		this.supplierList = supplierList;
	}

	public ISupplierService getSupplierService() {
		return supplierService;
	}

	public void setSupplierService(ISupplierService supplierService) {
		this.supplierService = supplierService;
	}

}
