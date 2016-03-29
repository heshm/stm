package com.erp.common.IDAO;

import java.util.List;
import java.util.Map;

import com.erp.common.model.form.SimpleLookUpDataSet;

public interface ILookUpDAO {
	
	public abstract List<SimpleLookUpDataSet> selectSimpleResultList(String sqlId);

}
