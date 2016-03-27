package com.erp.report.model;

import org.apache.ibatis.type.Alias;

import com.erp.common.util.Const;

@Alias("BillReport")
public class BillReport {
	
	private String depotId;
	private String billNo;
	private String type;
	private String status;
	private String registrant;
	private String auditor;
	private String writeDate;
	private String confirmDate;
	public String getDepotId() {
		return depotId;
	}
	public void setDepotId(String depotId) {
		this.depotId = depotId;
	}
	public String getBillNo() {
		return billNo;
	}
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = Const.DEFAULT_EMPTY_STRING;
		if (Const.DOCKET_TYPE_0.equals(type)){
			this.type = "未用退库";
		}
		if (Const.DOCKET_TYPE_1.equals(type)){
			this.type = "采购入库";
		}
		if (Const.DOCKET_TYPE_2.equals(type)){
			this.type = "生产入库";
		}
		if (Const.DOCKET_TYPE_3.equals(type)){
			this.type = "采购退货";
		}
		if (Const.DOCKET_TYPE_4.equals(type)){
			this.type = "领用退库";
		}
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRegistrant() {
		return registrant;
	}
	public void setRegistrant(String registrant) {
		this.registrant = registrant;
	}
	public String getAuditor() {
		return auditor;
	}
	public void setAuditor(String auditor) {
		this.auditor = auditor;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getConfirmDate() {
		return confirmDate;
	}
	public void setConfirmDate(String confirmDate) {
		this.confirmDate = confirmDate;
	}

}
