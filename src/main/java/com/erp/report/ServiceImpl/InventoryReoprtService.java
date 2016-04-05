package com.erp.report.ServiceImpl;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.erp.common.model.Page;
import com.erp.common.util.CommonUtil;
import com.erp.common.util.Const;
import com.erp.report.DAOImpl.InventoryReportDAO;
import com.erp.report.IService.IInventoryReportService;
import com.erp.report.model.DeliveryReport;
import com.erp.report.model.InventoryReport;
import com.erp.report.model.ReceiptReport;

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
		
		String cutDate = (String)parmMap.get("cutDate");
		String currentDate = CommonUtil.getCurrentDate();
		
		if((null != cutDate)&&(!"".equals(cutDate))&&(currentDate.compareTo(cutDate) > 0)){
			Map<String,String> queryMap = new HashMap<String,String>();
			for(InventoryReport inventory : result){
				queryMap.put("depotId", inventory.getDepotId());
				queryMap.put("commodityType", inventory.getCommodityType());
				queryMap.put("endDate", cutDate);
				ReceiptReport receiptReport = inventoryReportDAO.selectReceiptReport(queryMap);
				DeliveryReport deliveryReport = inventoryReportDAO.selectDeliveryReport(queryMap);
				if (null != receiptReport){
					inventory.setInQuantity(inventory.getInQuantity() - receiptReport.getInQuantity());
					inventory.setInAmount(inventory.getInAmount().subtract(receiptReport.getInAmount()));
					inventory.setInTaxAmt(inventory.getInTaxAmt().subtract(receiptReport.getInTaxAmt()));
					
					if(inventory.getInQuantity() == 0f){
						inventory.setInAveragePrice(new BigDecimal("0.00"));
					}else{
						BigDecimal inQuantity = new BigDecimal(inventory.getInQuantity().toString());
						inventory.setInAveragePrice(inventory.getInAmount().divide(inQuantity,Const.DEFAULT_DEC_NO,BigDecimal.ROUND_HALF_UP));
					}
					if(inventory.getInAmount().intValue() == 0){
						inventory.setInAverageTaxRate(new BigDecimal("0.000"));
					}else{
						inventory.setInAverageTaxRate(
								inventory.getInTaxAmt().
								multiply(new BigDecimal("100")).
								divide(inventory.getInAmount(),3,BigDecimal.ROUND_HALF_UP));
					}
				}
				if (null != deliveryReport){
					inventory.setOutQuantity(inventory.getOutQuantity() - deliveryReport.getOutQuantity());
					inventory.setOutAmount(inventory.getOutAmount().subtract(deliveryReport.getOutAmount()));
					inventory.setOutTaxAmt(inventory.getOutTaxAmt().subtract(deliveryReport.getOutTaxAmt()));
					
					if(inventory.getOutQuantity() == 0f){
						inventory.setOutAveragePrice(new BigDecimal("0.00"));
					}else{
						BigDecimal outQuantity = new BigDecimal(inventory.getOutQuantity().toString());
						inventory.setOutAveragePrice(
								inventory.getOutAmount().
								divide(outQuantity,Const.DEFAULT_DEC_NO,BigDecimal.ROUND_HALF_UP));
					}
					if(inventory.getOutAmount().intValue() == 0){
						inventory.setOutAverageTaxRate(new BigDecimal("0.000"));
					}else{
						inventory.setOutAverageTaxRate(
								inventory.getOutTaxAmt().
								multiply(new BigDecimal("100")).
								divide(inventory.getOutAmount(),3,BigDecimal.ROUND_HALF_UP));	
					}
				}
			}
		}
		
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
