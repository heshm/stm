package com.erp.common.serviceImpl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.erp.common.IDAO.ISupplierDAO;
import com.erp.common.IService.ISupplierService;
import com.erp.common.model.Supplier;

@Transactional
public class SupplierService implements ISupplierService{

	private ISupplierDAO supplierDAO;
	
	public ISupplierDAO getSupplierDAO() {
		return supplierDAO;
	}

	public void setSupplierDAO(ISupplierDAO supplierDAO) {
		this.supplierDAO = supplierDAO;
	}

	@Override
	public List<Supplier> getSupplierList() {
		// TODO Auto-generated method stub
		return supplierDAO.selectSupplierList();
	}

	@Override
	public Supplier getOneSupplier(String supplierId) {
		// TODO Auto-generated method stub
		return supplierDAO.selectOneSupplier(supplierId);
	}

	@Override
	public int addOneSupplier(Supplier supplier) {
		// TODO Auto-generated method stub
		Supplier temp = supplierDAO.selectOneSupplier(supplier.getSupplierId());
		if (null != temp){
			throw new RuntimeException("ID为(" + supplier.getSupplierId() + ")的记录已经存在!");
		}
		return supplierDAO.insertOneSupplier(supplier);
	}

	@Override
	public int updateOneSupplier(Supplier supplier) {
		// TODO Auto-generated method stub
		return supplierDAO.updateOneSupplier(supplier);
	}

	@Override
	public int deleteOneSupplier(String supplierId) {
		// TODO Auto-generated method stub
		return supplierDAO.deleteOneSupplier(supplierId);
	}
	
	

}
