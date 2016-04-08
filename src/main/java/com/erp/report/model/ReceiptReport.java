package com.erp.report.model;

import java.math.BigDecimal;

import org.apache.ibatis.type.Alias;

@Alias("ReceiptReport")
public class ReceiptReport {
	
	private String depotId;
	
	private String commodityType;
	
	private Float inQuantity;
	
	private BigDecimal inAmount;

    private BigDecimal inTaxAmt;

	public String getDepotId() {
		return depotId;
	}

	public void setDepotId(String depotId) {
		this.depotId = depotId;
	}

	public String getCommodityType() {
		return commodityType;
	}

	public void setCommodityType(String commodityType) {
		this.commodityType = commodityType;
	}

	public Float getInQuantity() {
		return inQuantity;
	}

	public void setInQuantity(Float inQuantity) {
		this.inQuantity = inQuantity;
	}

	public BigDecimal getInAmount() {
		return inAmount;
	}

	public void setInAmount(BigDecimal inAmount) {
		this.inAmount = inAmount;
	}

	public BigDecimal getInTaxAmt() {
		return inTaxAmt;
	}

	public void setInTaxAmt(BigDecimal inTaxAmt) {
		this.inTaxAmt = inTaxAmt;
	}

}
