package com.erp.report.model;

import java.math.BigDecimal;

import org.apache.ibatis.type.Alias;

@Alias("DeliveryReport")
public class DeliveryReport {
	
    private String depotId;
	
	private String commodityType;
	
	private Float outQuantity;
	
	private BigDecimal outAmount;

    private BigDecimal outTaxAmt;

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

	public Float getOutQuantity() {
		return outQuantity;
	}

	public void setOutQuantity(Float outQuantity) {
		this.outQuantity = outQuantity;
	}

	public BigDecimal getOutAmount() {
		return outAmount;
	}

	public void setOutAmount(BigDecimal outAmount) {
		this.outAmount = outAmount;
	}

	public BigDecimal getOutTaxAmt() {
		return outTaxAmt;
	}

	public void setOutTaxAmt(BigDecimal outTaxAmt) {
		this.outTaxAmt = outTaxAmt;
	}

}
