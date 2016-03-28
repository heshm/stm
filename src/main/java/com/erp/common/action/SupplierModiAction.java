package com.erp.common.action;

import com.erp.common.IService.ISupplierService;
import com.erp.common.model.Supplier;
import com.erp.common.util.Const;

public class SupplierModiAction extends CmAction{
	
	private Short update;
	private String supplierId;
	private Supplier supplier;
	
	private ISupplierService supplierService;
	
	public String init(){
		if(update.equals(Const.UPDATE_RECORD)){
			supplier = supplierService.getOneSupplier(supplierId);
		}
		return SUCCESS;
	}
	
	public String add(){
		try{
			supplierService.addOneSupplier(supplier);
			this.addActionMessage("数据新增成功,请返回查看!");
		}catch(RuntimeException e){
			this.addActionError(e.getMessage());
		}
		return SUCCESS;
	}
	
	public String update(){
		supplierService.updateOneSupplier(supplier);
		this.addActionMessage("往来单位数据更新成功!");
		return SUCCESS;
	}
	
	public String delete(){
		supplierService.deleteOneSupplier(supplierId);
		return SUCCESS;
	}

	public Short getUpdate() {
		return update;
	}

	public void setUpdate(Short update) {
		this.update = update;
	}

	public String getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public ISupplierService getSupplierService() {
		return supplierService;
	}

	public void setSupplierService(ISupplierService supplierService) {
		this.supplierService = supplierService;
	}

}
