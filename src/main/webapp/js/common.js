$main = window.top.$;
$mainDialog = window.top.$("#parent_win");

$.extend($.fn.validatebox.defaults.rules, {
    minLength: {
        validator: function(value, param){
            return value.length >= param[0];
        },
        message: '请输入至少 {0}个字符.'
    },
    supplierId: {
    	validator: function(value){
    		var reg = /^DW[0-9][0-9][0-9]$/;
            return reg.test(value);
        },
        message: '请输入合法的供应商ID.'
    },
    mobile: {
        validator: function (value){
        	var reg = /^(?:13\d|15\d|18\d)-?\d{5}(\d{3}|\*{3})$/;
            return reg.test(value);
        },
        message: '手机号码格式不正确.'
    },
    tel:{
        validator:function(value){
        	var reg = /^(\d{3}-|\d{4}-)?(\d{8}|\d{7})?(-\d{1,6})?$/;
            return reg.test(value);
        },
        message:'电话号码格式不正确'
    },
    mobileAndTel: {
        validator: function (value){
        	var reg = /(^([0\+]\d{2,3})\d{3,4}\-\d{3,8}$)|(^([0\+]\d{2,3})\d{3,4}\d{3,8}$)|(^([0\+]\d{2,3}){0,1}13\d{9}$)|(^\d{3,4}\d{3,8}$)|(^\d{3,4}\-\d{3,8}$)/;
            return reg.test(value);
        },
        message: '请正确输入电话号码'
    }
});


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


/**
window.onload=function(){
	$(".datagrid-mask").remove();  
    $(".datagrid-mask-msg").remove();  
}

$('form').on('submit',function(){
	$("<div class=\"datagrid-mask\"></div>").css({display:"block",width:"100%",height:$(window).height()}).appendTo("body"); 
	$("<div class=\"datagrid-mask-msg\"></div>").html("正在处理，请稍候。。。").appendTo("body").css({display:"block",left:($(document.body).outerWidth(true) - 190) / 2,top:($(window).height() - 45) / 2}); 
});
*/


