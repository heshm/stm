$main = window.top.$;
$mainDialog = window.top.$("#parent_win");

/**
 * EasyUI 选择
 * 
 */
function SimpleLookUp($obj,lookUpType){
	//alert(sqlId);
	var href = "./../common/SimpleLookUpInit.action?loouUpType=" +  lookUpType;
	//$obj.textbox('setValue','外星人');
	$mainDialog.dialog({
				iconCls: 'icon-edit',
				width:400,
				height:450,
				title:'资料选择',
				href : href,
				modal: 'true',
				buttons: [{
							text:'确定',
							iconCls:'icon-ok',
							handler:function(){	
								var $row = top.$('#lookUpData').datalist('getSelected');
								$obj.textbox('setValue',$row.text);
								$mainDialog.dialog('close');
							}
						  },{
							text:'取消',
							iconCls:'icon-cancel',
							handler:function(){
								$mainDialog.dialog('close');
							}
						  }]
			});
}