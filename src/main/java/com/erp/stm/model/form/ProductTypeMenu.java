package com.erp.stm.model.form;

import java.io.Serializable;
import java.util.List;

import com.erp.common.model.ProductGroup;
import com.erp.common.model.ProductType;

public class ProductTypeMenu implements Serializable{
	
	private ProductGroup productGroup;
	private List<ProductType> productTypeList;
	
	public ProductTypeMenu(ProductGroup productGroup){
		this.productGroup = productGroup;
	}
	
	public ProductTypeMenu(ProductGroup productGroup,List<ProductType> productTypeList){
		this.productGroup = productGroup;
		this.productTypeList = productTypeList;
	}

	public ProductGroup getProductGroup() {
		return productGroup;
	}

	public void setProductGroup(ProductGroup productGroup) {
		this.productGroup = productGroup;
	}

	public List<ProductType> getProductTypeList() {
		return productTypeList;
	}

	public void setProductTypeList(List<ProductType> productTypeList) {
		this.productTypeList = productTypeList;
	}
	
	

}
