<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jsp/error/themes/error_all.css">
<script type="text/javascript">
function closeCurrent(){
	var title = top.$('#tabs').tabs('getSelected').panel('options').title;
	top.$('#tabs').tabs('close', title);
}
</script>
</head>
<body class="error-404">
<div id="doc_main">
	<section class="bd clearfix">
		<div class="module-error">
			<div class="error-main clearfix">
				<div class="label"></div>
				<div class="info">
					<h3 class="title">啊哦，你没有权限使用该功能！</h3>
					<div class="reason">
						<p>可能的原因：</p>
						<p>你的用户权限不够</p>
						<!--  <p>2.你点击的某个链接已过期。</p> -->
					</div>
					<div class="oper">
						<p><a href="javascript:closeCurrent();">关闭该页面&gt;</a></p>
						<p><a href="javascript:history.back();">返回上一页面&gt;</a></p>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>

</body></html>
