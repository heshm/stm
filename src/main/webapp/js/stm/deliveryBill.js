function getPageData(index){
	var htmlAddress = "deliveryBillQuery.action?index=" + index;
	document.queryForm.action = htmlAddress;
	document.queryForm.submit();
}
function getBillDetail(billNo){
	var docketType = $("#docketType").val();
	var htmlAddress = "deliveryBillModiInit.action?update=1&" + "deliveryNo=" + billNo + "&docketType=" + docketType;;
	location.href = htmlAddress;
}
function checkOneDelivery(deliveryNo){
	var index = $('#currentPage').val();
	var htmlAddress = "deliveryBillCheck.action?deliveryNo=" + deliveryNo + "&index=" + index;
	var msg = "确定审核单号为:" + deliveryNo + "的单据?";
	
	$main.messager.confirm('系统提示',msg, function(r){
		if (r){
			document.queryForm.action = htmlAddress;
			document.queryForm.submit();
		}
	});
	
}
function unCheckOneDelivery(deliveryNo){
	var index = $('#currentPage').val();
	var htmlAddress = "deliveryBillUnCheck.action?deliveryNo=" + deliveryNo + "&index=" + index;
	var msg = "确定反审核单号为:" + deliveryNo + "的单据?";
	
	$main.messager.confirm('系统提示',msg, function(r){
		if (r){
			document.queryForm.action = htmlAddress;
			document.queryForm.submit();
		}
	});
}
function deleteOneDelivery(deliveryNo){
	var index = $('#currentPage').val();
	var htmlAddress = "deliveryBillDelete.action?deliveryNo=" + deliveryNo + "&index=" + index;
	var msg = "确定删除单号为:" + deliveryNo + "的单据?";
	
	$main.messager.confirm('系统提示',msg, function(r){
		if (r){
			document.queryForm.action = htmlAddress;
			document.queryForm.submit();
		}
	});
}