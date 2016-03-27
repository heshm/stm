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
    		$main.messager.confirm('系统提示', '确定删除选中货品记录?' , function(r){
    			if (r){
    				$("#data").find("input[type='checkbox']").each(function(){
        				if($(this).prop("checked")){
        					var $_tr = $(this).parents('tr');
        					$_tr.remove(); 
        					tableResort($("#data"));
        				}
        			});
    			}
    		});
    	}
	});
	$("#checkAll").click(function(){
		if(this.checked){
			$("input[type='checkbox']").prop("checked",true);
		}else{
			$("input[type='checkbox']").prop("checked",false);
		}
	});
	
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
		    	//alert(name);
		    	name = name.replace(/\[.*\]/,seqNo);
		        $input.attr('name',name);
		        
		    }
			j++;
		});
		i++;
	});
}



