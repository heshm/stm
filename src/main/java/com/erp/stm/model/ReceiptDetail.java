package com.erp.stm.model;

import java.io.Serializable;
import java.math.BigDecimal;

import org.apache.ibatis.type.Alias;

import com.erp.common.model.ProductType;

@Alias("ReceiptDetail")
public class ReceiptDetail implements Serializable {

	private String depotId;
	private String receiptNo;
	private String commodityType;
	private BigDecimal unitPrice;
	private Float quantity;
	private BigDecimal amount;
	private BigDecimal taxRate;
	private BigDecimal taxAmt;
	private String norm;
	private String brand;
	private String groupId;
	private String typeId;
	private ProductType productType;

	public String getDepotId() {
		return depotId;
	}

	public void setDepotId(String depotId) {
		this.depotId = depotId;
	}

	public String getReceiptNo() {
		return receiptNo;
	}

	public void setReceiptNo(String receiptNo) {
		this.receiptNo = receiptNo;
	}

	public String getCommodityType() {
		return commodityType;
	}

	public void setCommodityType(String commodityType) {
		this.commodityType = commodityType;
	}

	public BigDecimal getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(BigDecimal unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Float getQuantity() {
		return quantity;
	}

	public void setQuantity(Float quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public BigDecimal getTaxRate() {
		return taxRate;
	}

	public void setTaxRate(BigDecimal taxRate) {
		this.taxRate = taxRate;
	}

	public BigDecimal getTaxAmt() {
		return taxAmt;
	}

	public void setTaxAmt(BigDecimal taxAmt) {
		this.taxAmt = taxAmt;
	}

	public String getNorm() {
		return norm;
	}

	public void setNorm(String norm) {
		this.norm = norm;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public ProductType getProductType() {
		return productType;
	}

	public void setProductType(ProductType productType) {
		this.productType = productType;
	}

}
