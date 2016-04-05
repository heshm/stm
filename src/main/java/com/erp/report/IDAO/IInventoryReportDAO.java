package com.erp.report.IDAO;

import java.util.Map;

import com.erp.common.IDAO.IPageDAO;
import com.erp.report.model.DeliveryReport;
import com.erp.report.model.ReceiptReport;

public interface IInventoryReportDAO extends IPageDAO{
	
	public static final String SELECT_INVENTORY_REPORT_PAGECNT = "selectInventoryReportPageCnt";
	
	public static final String SELECT_INVENTORY_REPORT_CURRENT_PAGEDATA = "selectInventoryReportCurrentPageData";
	
	public static final String SELECT_RECEIPT_REPORT = "selectReceiptReport";
	
	public static final String SELECT_DELIVERY_REPORT = "selectDeliveryReport";
	
	public abstract ReceiptReport selectReceiptReport(Map map);
	
	public abstract DeliveryReport selectDeliveryReport(Map map);

}
