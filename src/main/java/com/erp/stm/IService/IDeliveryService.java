package com.erp.stm.IService;

import java.util.List;
import java.util.Map;

import com.erp.common.IService.IPageService;
import com.erp.stm.model.Delivery;

public interface IDeliveryService extends IPageService<Delivery>{
	
	public abstract List<Delivery> getMulDelivery(@SuppressWarnings("rawtypes") Map map);
	
	public abstract String getDeliverySeq(String depotId);
	
	public abstract int deleteOneDelivery(@SuppressWarnings("rawtypes") Map parmMap);

}
