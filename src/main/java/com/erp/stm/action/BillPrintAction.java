package com.erp.stm.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.erp.common.action.CmAction;
import com.erp.common.util.CommonUtil;
import com.erp.common.util.Const;
import com.erp.common.util.PrintUtil;
import com.erp.stm.IService.IDeliveryBillService;
import com.erp.stm.model.form.DeliveryBillForm;
import com.itextpdf.text.DocumentException;

public class BillPrintAction extends CmAction{
	
	private String billNo;
	
	private String fileName;
	
	private String inputPath;
	
	private IDeliveryBillService deliveryBillService;
	
	public String printDeliveryBill() throws DocumentException, IOException{
		Map<String,String> map = new HashMap<String,String>();
		map.put("depotId", Const.DEFAULT_DEPOT_ID);
		map.put("deliveryNo", billNo);
		DeliveryBillForm deliveryBill = deliveryBillService.getOneDeliveryBillForm(map);
		String contentPath = ServletActionContext.getServletContext().getRealPath("/");
		
		//String src = "META-INF/print/template/outBillTemplate.pdf";
	    System.out.println(contentPath);
		PrintUtil.createDeliveryBill(contentPath, deliveryBill);
		fileName = deliveryBill.getDelivery().getDeliveryNo() + ".pdf";
		inputPath =  contentPath + "META-INF/print/result/"
			    + deliveryBill.getDelivery().getDeliveryNo() + ".pdf";
		return SUCCESS;
	}
	
	public InputStream getInputStream() throws Exception{
		//String contentPath = ServletActionContext.getServletContext().getRealPath("/");
		InputStream inputStream = new FileInputStream(inputPath);
		return inputStream;
	}

	public String getBillNo() {
		return billNo;
	}

	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}

	public void setDeliveryBillService(IDeliveryBillService deliveryBillService) {
		this.deliveryBillService = deliveryBillService;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getInputPath() {
		return inputPath;
	}

	public void setInputPath(String inputPath) {
		this.inputPath = inputPath;
	}


}
