package com.erp.stm.action;

import java.util.HashMap;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import com.erp.common.action.CmAction;
import com.erp.common.model.User;
import com.erp.common.util.CommonUtil;
import com.erp.common.util.Const;
import com.erp.stm.IService.IDeliveryBillService;
import com.erp.stm.IService.IDeliveryService;
import com.erp.stm.model.Delivery;
import com.erp.stm.model.form.DeliveryBillForm;

public class DeliveryBillModiAction extends CmAction{
	
	private String deliveryNo;
    private String docketType;
	private Short update;
	private DeliveryBillForm deliveryBillForm;
	private IDeliveryBillService deliveryBillService;
	private IDeliveryService deliveryService;
	private char print;
	
	public String init(){
		if(Const.UPDATE_RECORD == update){
			Map<String,String> map = new HashMap<String,String>();
			map.put("depotId", Const.DEFAULT_DEPOT_ID);
			map.put("deliveryNo", deliveryNo);
			deliveryBillForm = deliveryBillService.getOneDeliveryBillForm(map);
		}else{
			deliveryBillForm = new DeliveryBillForm(new Delivery());
			String seqNo = deliveryService.getDeliverySeq(Const.DEFAULT_DEPOT_ID);
			deliveryBillForm.getDelivery().setDeliveryNo(CommonUtil.getNextCKSeqNo(seqNo));
			deliveryBillForm.getDelivery().setWriteDate(CommonUtil.getCurrentDate());
		}
		return SUCCESS;
		
	}
	
	public String modi(){
		try{
			Session session = this.getSession();
	        User user = (User)session.getAttribute("user");
	        String type = (String)session.getAttribute("docketType");
	        deliveryBillForm.getDelivery().setType(type);
	        deliveryBillForm.getDelivery().setDepotId(Const.DEFAULT_DEPOT_ID);
	        deliveryBillService.updateOneDeliveryBill(deliveryBillForm, user);
	        
	        if(print == '1'){
	        	return PRINT;
	        }else{
	            this.addActionMessage("单据号为(" + deliveryBillForm.getDelivery().getDeliveryNo() + ")的单据修改成功!");
	            deliveryNo = deliveryBillForm.getDelivery().getDeliveryNo();
	            Map<String,String> map = new HashMap<String,String>();
			    map.put("depotId", Const.DEFAULT_DEPOT_ID);
			    map.put("deliveryNo", deliveryNo);
			    deliveryBillForm = deliveryBillService.getOneDeliveryBillForm(map);
	        }
		}catch(RuntimeException e){
			this.addActionError(e.getMessage());
		}
		return SUCCESS;
	}

	public String getDeliveryNo() {
		return deliveryNo;
	}

	public void setDeliveryNo(String deliveryNo) {
		this.deliveryNo = deliveryNo;
	}

	public String getDocketType() {
		return docketType;
	}

	public void setDocketType(String docketType) {
		this.docketType = docketType;
	}

	public Short getUpdate() {
		return update;
	}

	public void setUpdate(Short update) {
		this.update = update;
	}

	public DeliveryBillForm getDeliveryBillForm() {
		return deliveryBillForm;
	}

	public void setDeliveryBillForm(DeliveryBillForm deliveryBillForm) {
		this.deliveryBillForm = deliveryBillForm;
	}

	public IDeliveryBillService getDeliveryBillService() {
		return deliveryBillService;
	}

	public void setDeliveryBillService(IDeliveryBillService deliveryBillService) {
		this.deliveryBillService = deliveryBillService;
	}

	public IDeliveryService getDeliveryService() {
		return deliveryService;
	}

	public void setDeliveryService(IDeliveryService deliveryService) {
		this.deliveryService = deliveryService;
	}

	public char getPrint() {
		return print;
	}

	public void setPrint(char print) {
		this.print = print;
	}


}
