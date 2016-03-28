package com.erp.common.IService;

import java.util.List;

import com.erp.common.model.Supplier;

public interface ISupplierService {
	
    public abstract List<Supplier> getSupplierList();
	
	public abstract Supplier getOneSupplier(String supplierId);
	
	public abstract int addOneSupplier(Supplier supplier);
	
	public abstract int updateOneSupplier(Supplier supplier);
	
	public abstract int deleteOneSupplier(String supplierId);

}
