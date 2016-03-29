package com.erp.common.IService;

import java.util.List;
import java.util.Map;

import com.erp.common.model.form.SimpleLookUpDataSet;

public interface ILookUpService {
	
	public abstract List<SimpleLookUpDataSet> getSimpleResultList(String loouUpType);

}
