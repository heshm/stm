$(document).ready(function(){
	var status = $("#status").val();
	if(status==1){
		$('form input').each(function(){
			$(this).prop("readonly","readonly");
		});
		$('form a').each(function(){
			$(this).addClass("disabled");
		});
        $('.save').addClass("disabled");
        $('.save').prop("disabled","disabled");
	};

    $('.del').on('click',function(){
    	if(status!=1){
    		//var $_tr = $(this).parents('tr');
    		if (confirm("确定删除选中货品记录？")) { 
    			//var $_tbody = $_tr.parents('tbody');
    			//$_tr.remove(); 
    			//tableResort($_tbody);
    			$("#data").find("input[name='sel']").each(function(){
    				if($(this).prop("checked")){
    					var $_tr = $(this).parents('tr');
    					$_tr.remove(); 
    					tableResort($("#data"));
    				}
    			});
    		}
    	}
	});
	
	$("#checkAll").click(function(){
		if(this.checked){
			$("input[name='sel']").prop("checked",true);
		}else{
			$("input[name='sel']").prop("checked",false);
		}
	})
	
});
function tableResort($obj){
	var i = 0;
	$obj.find('tr').each(function(){
		var j =0;
		$(this).find('td').each(function(){
			var name = "";
			var seqNo = 0;
			if(j==1){
			    seqNo = i + 1;
				seqNo = "" + seqNo;
				$(this).html(seqNo);
			}
		    if((j==2||j==5||j==6||j==7||j>=9)&&j<=12){
		    	$input = $(this).find('input');
		    	name = $input.attr('name');
		    	seqNo = "[" + i + "]";
		    	name = name.replace(/\[.*\]/,seqNo);
		        $input.attr('name',name);
		        
		    }
			j++;
		});
		i++;
	});
}
function addNewOutProduct(){
	if(top.$("#lookUpForm").form('enableValidation').form('validate')){
		var exist = false;  //记录是否存在标志
		
		var groupId = top.$("#groupId").val();
		var groupName = top.$("#groupName").text();
		var typeId = top.$("#typeId").val();
		var hpmc = top.$("#hpmc").text();
		var ppmc = top.$("#ppmc").val();
		var guige = top.$("#guige").val();
		var danjia = top.$("#danjia").val();
		var shuliang = top.$("#shuliang").val();
		var taxRate = top.$("#taxRate").val();
		var danwei = top.$("#danwei").val();
		var code = groupId + typeId;
		
		var jine = danjia * shuliang;
		jine = jine.toFixed(2);
		
		var shuie = danjia * shuliang * taxRate / 100;
		shuie = shuie.toFixed(2);
		
		$("#data").find('tr').each(function(){
			$td = $(this).children("td");
			var text = $.trim($td.eq(2).text());
			if(text == code){
				var msg = "货品编码为(" + code + ")的记录已经存在!";
				$main.messager.alert('系统提示',msg,'warning');
				exist = true;
				return;
			}	
		});
		
		//alert(groupId);alert(groupName);alert(typeId);alert(hpmc);alert(ppmc);
		//alert(guige);alert(danjia);alert(shuliang);alert(taxRate);
		var newRow = "<tr>" +
        "<td align='center'><input name='sel' type='checkbox'></td>" +
		"<td align='center'>1</td>" +
		"<td align='center'>" + code +
		"<input type='hidden' name='deliveryBillForm.deliveryDetailList[0].commodityType' value='" + code + "'/>" +
		"</td>" +
		"<td align='center'>" + hpmc + "</td>" +
		"<td align='center'>" + groupName + "</td>" +
	    "<td align='center'><input type='text' name='deliveryBillForm.deliveryDetailList[0].brand' value='" + ppmc + "' id='input6' class='span1 text-center'/></td>" +
		"<td align='center'><input type='text' name='deliveryBillForm.deliveryDetailList[0].norm' value='" + guige + "' id='input6' class='span1 text-center'/></td>" +
		"<td align='center'><input type='text' name='deliveryBillForm.deliveryDetailList[0].quantity' value='" + shuliang+ "' id='input8' class=' span1 text-center'/></td>" +
		"<td align='center'>" + danwei + "</td>" +
	    "<td align='center'><input type='text' name='deliveryBillForm.deliveryDetailList[0].unitPrice' value='" + danjia + "' id='input8' class=' span1 text-center'/></td>" +
		"<td align='center'><input type='text' name='deliveryBillForm.deliveryDetailList[0].amount' value='" + jine + "' id='input8' class=' span1-1 text-center'/></td>" +
		"<td align='center'><input type='text' name='deliveryBillForm.deliveryDetailList[0].taxRate' value='" + taxRate + "' id='input8' class=' span1 text-center'/>%</td>" +
		"<td align='center'><input type='text' name='deliveryBillForm.deliveryDetailList[0].taxAmt' value='" + shuie + "' id='input8' class=' span1-1 text-center'/></td>" +
        "</tr>";
        //alert(newRow);
        if(!exist){
        	 $("#data").append(newRow);
        	 tableResort($("#data"));
        }		
	}
}

function deliveryBillUpdate(){
	if($("#deliveryBillForm").form('enableValidation').form('validate')){
		$main.messager.confirm('系统提示', '输入无误,确认提交?', function(r){
			if (r){
				//document.deliveryBillForm.submit();
				if ($("input[name='print']").is(':checked')){
					var htmlAddr = "deliveryBillModi.action?print=1";
					document.deliveryBillForm.action=htmlAddr;
					document.deliveryBillForm.submit();
				}else{
					document.deliveryBillForm.submit();
				}
			}
		});
	}
}
/**
function addNewRow(){
	var groupId=$("#selectGroupId").val();
	var typeId=$("#groupType").val(); 
	if($.trim(groupId).length==0){
		alert("货品类别不能为空!")
		$("#selectGroupId").focus();
		return 0;
	}
	
	if($.trim(typeId).length==0){
		alert("货品名称不能为空!")
		$("#groupType").focus();
		return 0;
	}
	var exist = false;
	var code = groupId + typeId;
	
	$("#data").find('tr').each(function(){
		$td = $(this).children("td");
		var text = $.trim($td.eq(2).text());
		if(text == code){
			var msg = "货品编码为(" + code + ")的记录已经存在!";
			alert(msg);
			exist = true;
			return;
		}	
	});
	
	var hpmc = $("#groupType").find("option:selected").text();
	var hplb = $("#selectGroupId").find("option:selected").text();
	var ppmc = $("#pinpaimingcheng").val();
	var guige = $("#guige").val();
	var danwei = $("#danwei").val();
	var danjia = $("#danjia").val();
	var shuliang = $("#shuliang").val();
	var jine = $("#jine").text();
	var shuilv = $("#shuilv").val();
	var shuie = $("#shuie").text();
  
    var newRow = "<tr>" +
            "<td align='center'><input name='sel' type='checkbox'></td>" +
			"<td align='center'>1</td>" +
			"<td align='center'>" + code +
			"<input type='hidden' name='deliveryBillForm.deliveryDetailList[0].commodityType' value='" + code + "'/>" +
			"</td>" +
			"<td align='center'>" + hpmc + "</td>" +
			"<td align='center'>" + hplb + "</td>" +
		    "<td align='center'><input type='text' name='deliveryBillForm.deliveryDetailList[0].brand' value='" + ppmc + "' id='input6' class='span1 text-center'/></td>" +
			"<td align='center'><input type='text' name='deliveryBillForm.deliveryDetailList[0].norm' value='" + guige + "' id='input6' class='span1 text-center'/></td>" +
			"<td align='center'><input type='text' name='deliveryBillForm.deliveryDetailList[0].quantity' value='" + danjia + "' id='input8' class=' span1 text-center'/></td>" +
			"<td align='center'>" + danwei + "</td>" +
    	    "<td align='center'><input type='text' name='deliveryBillForm.deliveryDetailList[0].unitPrice' value='" + shuliang + "' id='input8' class=' span1 text-center'/></td>" +
			"<td align='center'><input type='text' name='deliveryBillForm.deliveryDetailList[0].amount' value='" + jine + "' id='input8' class=' span1-1 text-center'/></td>" +
			"<td align='center'><input type='text' name='deliveryBillForm.deliveryDetailList[0].taxRate' value='" + shuilv + "' id='input8' class=' span1 text-center'/>%</td>" +
			"<td align='center'><input type='text' name='deliveryBillForm.deliveryDetailList[0].taxAmt' value='" + shuie + "' id='input8' class=' span1-1 text-center'/></td>" +
      "</tr>";
      //alert(newRow);
    if(!exist){
    	 $("#data").append(newRow);
    	 tableResort($("#data"));
    } 
}
*/