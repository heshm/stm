package com.erp.report.ServiceImpl;

import java.util.List;
import java.util.Map;

import com.erp.common.model.Page;
import com.erp.common.util.Const;
import com.erp.report.IDAO.IBillReportDAO;
import com.erp.report.IService.IBillReportService;
import com.erp.report.model.BillReport;

public class BillReportService implements IBillReportService{

	private IBillReportDAO billReportDAO;
	
	public IBillReportDAO getBillReportDAO() {
		return billReportDAO;
	}

	public void setBillReportDAO(IBillReportDAO billReportDAO) {
		this.billReportDAO = billReportDAO;
	}

	public Page<BillReport> getIndexPage(int pageIndex, Map parmMap) {
		Page<BillReport> page = new Page<BillReport>(pageIndex,Const.DEFAULT_BILL_PAGE_SIZE);
		int offset = (pageIndex - 1) * Const.DEFAULT_BILL_PAGE_SIZE;
		
		@SuppressWarnings("unchecked")
		int totleCnt = billReportDAO.selectTotleCount(parmMap);
		
		parmMap.put("offset", offset);
		parmMap.put("limit", Const.DEFAULT_BILL_PAGE_SIZE);
		List<BillReport> result = billReportDAO.selectPageList(parmMap);
		page.setPageData(result);
		
	
		if((offset + Const.DEFAULT_BILL_PAGE_SIZE) >= totleCnt){
			page.setHasNextPage(false);
		}else{
			page.setHasNextPage(true);
		}
		
		if(totleCnt%Const.DEFAULT_BILL_PAGE_SIZE ==0){
			page.setPageCnt(totleCnt/Const.DEFAULT_BILL_PAGE_SIZE);
		}else{
			page.setPageCnt(totleCnt/Const.DEFAULT_BILL_PAGE_SIZE + 1);
		}
		return page;
	}

}
