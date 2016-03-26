package com.erp.stm.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.session.Session;
import org.apache.struts2.ServletActionContext;

import com.erp.common.IService.IProductTypeService;
import com.erp.common.action.CmAction;
import com.erp.common.model.ProductGroup;
import com.erp.common.model.ProductType;
import com.erp.stm.model.form.ProductTypeMenu;

public class ProductTypeLookUpAction extends CmAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<ProductTypeMenu> menuList; 
	
	private IProductTypeService productTypeService;

	public String init(){
		menuList = new ArrayList<ProductTypeMenu>();
		Session session = this.getSession();
		List<ProductGroup> productGroupList = (List<ProductGroup>)session.getAttribute("productGroup");
		for(ProductGroup productGroup : productGroupList){
			Map<String,String> map = new HashMap<String,String>();
			map.put("groupId", productGroup.getGroupId());
			List<ProductType> productTypeList = productTypeService.getMulProductType(map);
			ProductTypeMenu oneMenu = new ProductTypeMenu(productGroup,productTypeList);
			menuList.add(oneMenu);
		}
		
		return SUCCESS;
	}

	public IProductTypeService getProductTypeService() {
		return productTypeService;
	}

	public void setProductTypeService(IProductTypeService productTypeService) {
		this.productTypeService = productTypeService;
	}

	public List<ProductTypeMenu> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<ProductTypeMenu> menuList) {
		this.menuList = menuList;
	}


}
