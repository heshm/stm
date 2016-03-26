<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
function logout(){
	$.messager.confirm('注销系统', '你确定要注销退出系统吗?', function(r){
		if (r){
			location.href= "<%=request.getContextPath()%>/logout";
		}
	});
}
</script>
<div class="logo">
    
    <img src="<%=request.getContextPath()%>/img/logo.png" />
 
</div>
<div class="header-right">
    <i class="icon-user icon-white"></i> <a href="#">修改密码</a> 
	<i class="icon-off icon-white"></i> <a href="#" onclick="logout();">注销</a>
</div>