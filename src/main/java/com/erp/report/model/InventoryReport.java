package com.erp.report.model;

import java.math.BigDecimal;

import org.apache.ibatis.type.Alias;

import com.erp.common.model.ProductType;

@Alias("InventoryReport")
public class InventoryReport {

	private String depotId;

    private String commodityType;

    private BigDecimal inAveragePrice;

    private Float inQuantity;

    private BigDecimal inAmount;

    private BigDecimal inTaxAmt;

    private BigDecimal inAverageTaxRate;

    private BigDecimal outAveragePrice;

    private Float outQuantity;

    private BigDecimal outAmount;

    private BigDecimal outTaxAmt;

    private BigDecimal outAverageTaxRate;
    
    private String groupName;
    
    private String name;
    
    private String unit;
    

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

    public BigDecimal getInAveragePrice() {
        return inAveragePrice;
    }

    public void setInAveragePrice(BigDecimal inAveragePrice) {
        this.inAveragePrice = inAveragePrice;
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

    public BigDecimal getInAverageTaxRate() {
        return inAverageTaxRate;
    }

    public void setInAverageTaxRate(BigDecimal inAverageTaxRate) {
        this.inAverageTaxRate = inAverageTaxRate;
    }

    public BigDecimal getOutAveragePrice() {
        return outAveragePrice;
    }

    public void setOutAveragePrice(BigDecimal outAveragePrice) {
        this.outAveragePrice = outAveragePrice;
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

    public BigDecimal getOutAverageTaxRate() {
        return outAverageTaxRate;
    }

    public void setOutAverageTaxRate(BigDecimal outAverageTaxRate) {
        this.outAverageTaxRate = outAverageTaxRate;
    }

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	
}
