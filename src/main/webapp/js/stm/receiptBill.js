function getPageData(index){
	var htmlAddress = "receiptBillQuery.action?index=" + index;
	document.queryForm.action = htmlAddress;
	document.queryForm.submit();

}
function getBillDetail(billNo){
	var docketType = $("#docketType").val();
	var htmlAddress = "receiptBillModiInit.action?update=1&receiptNo=" + billNo + "&docketType=" + docketType;
	location.href = htmlAddress;
}
function deleteOneReceipt(billNo){
	var index = $('#currentPage').val();
	var htmlAddress = "receiptBillDelete.action?receiptNo=" + billNo + "&index=" + index;
	var msg = "确定删除单号为:" + billNo + "的记录?";
	
	$main.messager.confirm('系统提示', msg, function(r){
		if (r){
			document.queryForm.action=htmlAddress;
			document.queryForm.submit();
		}
	});
}
function checkOneReceipt(billNo){
	var index = $('#currentPage').val();
	var htmlAddress = "receiptBillCheck.action?receiptNo=" + billNo + "&index=" + index;
	var msg = "确定审核单号为:" + billNo + "的记录?";
	$main.messager.confirm('系统提示', msg, function(r){
		if (r){
			document.queryForm.action = htmlAddress;
			document.queryForm.submit();
		}
	});

}
function unCheckOneReceipt(billNo){
	var index = $('#currentPage').val();
	var htmlAddress = "receiptBillUnCheck.action?receiptNo=" + billNo + "&index=" + index;
	var msg = "确定反审核单号为:" + billNo + "的记录?";
	
	$main.messager.confirm('系统提示', msg , function(r){
		if (r){
			document.queryForm.action=htmlAddress;
			document.queryForm.submit();
		}
	});
}