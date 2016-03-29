package com.erp.common.serviceImpl;

import java.util.List;
import java.util.Map;

import com.erp.common.IDAO.ILookUpDAO;
import com.erp.common.IService.ILookUpService;
import com.erp.common.model.form.SimpleLookUpDataSet;

public class LookUpService implements ILookUpService {
	
	private ILookUpDAO lookUpDAO;

	public ILookUpDAO getLookUpDAO() {
		return lookUpDAO;
	}

	public void setLookUpDAO(ILookUpDAO lookUpDAO) {
		this.lookUpDAO = lookUpDAO;
	}

	@Override
	public List<SimpleLookUpDataSet> getSimpleResultList(String loouUpType) {
		// TODO Auto-generated method stub
		String sqlId = getSqlId(loouUpType);
		return lookUpDAO.selectSimpleResultList(sqlId);
	}
	
	private String getSqlId(String loouUpType){
		String sqlId = "";
		if(loouUpType.equals("supplier")){
			sqlId = "SELECT_SUPPLIER_LIST";
		}
		return sqlId;
	}

}
