package com.erp.report.ServiceImpl;

import java.util.List;
import java.util.Map;

import com.erp.common.model.Page;
import com.erp.common.util.Const;
import com.erp.report.DAOImpl.InventoryReportDAO;
import com.erp.report.IService.IInventoryReportService;
import com.erp.report.model.InventoryReport;

public class InventoryReoprtService implements IInventoryReportService{

	private InventoryReportDAO inventoryReportDAO;
	
	public InventoryReportDAO getInventoryReportDAO() {
		return inventoryReportDAO;
	}

	public void setInventoryReportDAO(InventoryReportDAO inventoryReportDAO) {
		this.inventoryReportDAO = inventoryReportDAO;
	}

	public Page<InventoryReport> getIndexPage(int pageIndex, Map parmMap) {
		Page<InventoryReport> page = new Page<InventoryReport>(pageIndex,Const.DEFAULT_BILL_PAGE_SIZE);
		int offset = (pageIndex - 1) * Const.DEFAULT_BILL_PAGE_SIZE;
		
		//temp.put("type", "1");
		int totleCnt = inventoryReportDAO.selectTotleCount(parmMap);
		
		parmMap.put("offset", offset);
		parmMap.put("limit", Const.DEFAULT_BILL_PAGE_SIZE);
		List<InventoryReport> result = inventoryReportDAO.selectPageList(parmMap);
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
