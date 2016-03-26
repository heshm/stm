package com.erp.report.IDAO;

import com.erp.common.IDAO.IPageDAO;

public interface IBillReportDAO extends IPageDAO{
	
    public static final String SELECT_BILL_REPORT_PAGECNT = "selectBillReportPageCnt";
	
	public static final String SELECT_BILL_REPORT_PAGEDATA = "selectBillReportPageData"; 

}
