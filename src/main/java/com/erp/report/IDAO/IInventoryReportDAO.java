package com.erp.report.IDAO;

import com.erp.common.IDAO.IPageDAO;

public interface IInventoryReportDAO extends IPageDAO{
	
	public static final String SELECT_INVENTORY_REPORT_PAGECNT = "selectInventoryReportPageCnt";
	
	public static final String SELECT_INVENTORY_REPORT_PAGEDATA = "selectInventoryReportPageData";

}
