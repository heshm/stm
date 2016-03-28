package com.erp.common.IDAO;

import java.util.List;

import com.erp.common.model.Supplier;

public interface ISupplierDAO {
	
	public static final String SELECT_MUL_SUPPLIER = "selectMulSupplier";
	
	public static final String SELECT_ONE_SUPPLIER = "selectOneSupplier";
	
	public static final String INSERT_ONE_SUPPLIER = "insertOneSupplier";
	
	public static final String UPDATE_ONE_SUPPLIER = "updateOneSupplier";
	
	public static final String DELETE_ONE_SUPPLIER = "deleteOneSupplier";
	
	public abstract List<Supplier> selectSupplierList();
	
	public abstract Supplier selectOneSupplier(String supplierId);
	
	public abstract int insertOneSupplier(Supplier supplier);
	
	public abstract int updateOneSupplier(Supplier supplier);
	
	public abstract int deleteOneSupplier(String supplierId);

}
