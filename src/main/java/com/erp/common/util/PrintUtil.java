package com.erp.common.util;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import com.erp.stm.model.DeliveryDetail;
import com.erp.stm.model.form.DeliveryBillForm;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.AcroFields;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;

public class PrintUtil {
	
	public static void createDeliveryBill(String contentPath,DeliveryBillForm billForm) throws DocumentException, IOException{
		String template = contentPath + "META-INF/print/template/outBillTemplate.pdf";
		//System.out.println(template);
		PdfReader reader = new PdfReader(template);
		
		String dest = contentPath + "META-INF/print/result/"
		    + billForm.getDelivery().getDeliveryNo() + ".pdf";
		
		PdfStamper stamper = new PdfStamper(reader, new FileOutputStream(dest));
        AcroFields form = stamper.getAcroFields();
        
        String fieldName = new String("");
        BaseFont baseFont = BaseFont.createFont(contentPath + "META-INF/SIMYOU.TTF",BaseFont.IDENTITY_H,BaseFont.NOT_EMBEDDED); 
        
        //BaseFont baseFont = BaseFont.createFont( "STSong-Light",   "UniGB-UCS2-H",   BaseFont.NOT_EMBEDDED);

        
        Iterator iterator = form.getFields().keySet().iterator();
        
        //String fieldName = new String("");
        while(iterator.hasNext()){
        	fieldName = iterator.next().toString();
        	form.setFieldProperty(fieldName, "textfont", baseFont, null);
        	//System.out.println(fieldName);
        }
        
        if (Const.DOCKET_TYPE_4.equals(billForm.getDelivery().getType())){
        	form.setField("billType", "领用退库");
        }else{
        	form.setField("billType", "采购退货");
        }
        form.setField("billNo", billForm.getDelivery().getDeliveryNo());
        form.setField("outDate", billForm.getDelivery().getOutDate().substring(0, 10));
        form.setField("consumer", billForm.getDelivery().getConsumer());
        form.setField("supplier", billForm.getDelivery().getSupplier());
        form.setField("usage", billForm.getDelivery().getUseFor());
        form.setField("remark", billForm.getDelivery().getRemark());
        
        List detailList = billForm.getDeliveryDetailList();
        
        int seq = 0;
        for (int i = 1 ; i<= 10 ; i++){
        	if (i <= detailList.size()){
        		DeliveryDetail detail = (DeliveryDetail)detailList.get(i-1);
        		for (int j = 1;j<= 11; j++){
        			seq = (i -1)*11 + j;
        			fieldName = "fill_" + seq;
        			switch (j){
        			case 1 : form.setField(fieldName, ""+i); break;
        			case 2 : form.setField(fieldName, detail.getProductType().getName()); break;
        			case 3 : form.setField(fieldName, detail.getProductType().getProductGroup().getGroupName()); break;
        			case 4 : form.setField(fieldName, detail.getBrand()); break;
        			case 5 : form.setField(fieldName, detail.getNorm()); break;
        			case 6 : form.setField(fieldName, detail.getProductType().getUnit()); break;
        			case 7 : form.setField(fieldName, detail.getQuantity().toString()); break;
        			case 8 : form.setField(fieldName, detail.getUnitPrice().toString()); break;
        			case 9 : form.setField(fieldName, detail.getAmount().toString()); break;
        			case 10 : form.setField(fieldName, detail.getTaxRate().toString()); break;
        			case 11 : form.setField(fieldName, detail.getTaxAmt().toString()); break;
        			default : break;
        			}
        		}
        	}else{
        		break;
        	}
        }
        form.setField("sumQuantity", billForm.getSumQuantity().toString());
        form.setField("sumAmt", billForm.getSumAmount().toString());
        form.setField("sumTaxAmt", billForm.getSumTaxAmt().toString());
        form.setField("jingbanren", billForm.getDelivery().getRegistrant());
        form.setField("shenheren", billForm.getDelivery().getAuditor());
        form.setField("printTime", CommonUtil.getCurrentDate());
        form.setField("bigSumAmt", CommonUtil.digitUppercase(billForm.getSumAmount()));
        form.setField("bigSumTaxAmt", CommonUtil.digitUppercase(billForm.getSumTaxAmt()));
        
        stamper.setFormFlattening(true);
        stamper.close();
        
	}

}
