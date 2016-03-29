package com.erp.common.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.erp.common.IService.ILookUpService;
import com.erp.common.model.form.SimpleLookUpDataSet;

public class LookUpAction extends CmAction{
	
	private String loouUpType;
	private List<SimpleLookUpDataSet> resultList;
	private ILookUpService lookUpService;
	
    public String lookUpSimple(){
    	resultList = lookUpService.getSimpleResultList(loouUpType);
    	SimpleLookUpDataSet temp = (SimpleLookUpDataSet)resultList.get(0);
    	System.out.println(temp.getDataValue());
        return SUCCESS;
	}

	public String getLoouUpType() {
		return loouUpType;
	}

	public void setLoouUpType(String loouUpType) {
		this.loouUpType = loouUpType;
	}

	public List<SimpleLookUpDataSet> getResultList() {
		return resultList;
	}

	public void setResultList(List<SimpleLookUpDataSet> resultList) {
		this.resultList = resultList;
	}

	public ILookUpService getLookUpService() {
		return lookUpService;
	}

	public void setLookUpService(ILookUpService lookUpService) {
		this.lookUpService = lookUpService;
	}

}
