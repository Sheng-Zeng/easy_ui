<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>学生管理系统</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
			$(function() {
				$("#out").linkbutton({
					iconCls: "icon-cancel",
					onClick: function() {
						$.messager.confirm('退出登录', '您确认想要退出登录吗？', function(res) {
							if(res) {
								alert('退出成功');
							}
						});
					},
				});
			});

			function showAll(obj) {
				//console.log(obj.text);
				var res = $("#tt").tabs("exists",obj.text);
				console.log(res);
				if(!res) {
					$("#tt").tabs("add",{
						title:obj.text,
						href:"${pageContext.request.contextPath}/button.jsp",
						closable:true,
					});
				} else {
					$("#tt").tabs("select",obj.text);
				}
			}
		</script>

</head>

<body>
	<div id="cc" class="easyui-layout" data-options="fit:true">
		<div
			data-options="region:'north',split:true,border:false,collapsible:false,minHeight:80">
			<h1 style="margin-top: -2px;">学生管理系统</h1>
			<a id="out" style="float:right;">退出登录</a>
		</div>
		<div data-options="region:'south',border:false"
			style="height:30px; text-align: center; font-family: '楷体';">
			<a style="color: red; font-size:20px;" class="easyui-linkbutton"
				data-options="plain:true">©北京百知科技有限公司</a>
		</div>
		<div
			data-options="region:'east',iconCls:'icon-reload',title:'East',split:true,border:false"
			style="width:100px;"></div>
		<div
			data-options="region:'west',title:'学生管理',split:true,border:false,minWidth:100"
			style="width: 200px;">
			<div id="aa" class="easyui-accordion" data-options="fit:true">
				<div title="学生信息"
					style="overflow:auto; padding:10px; text-align: center;">
					<a class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon-add'" style="width: 100%;"
						onclick="showAll(this)">浏览所有学生</a>
				</div>
				
				<div title="学生表现" style="overflow:auto; padding:10px; text-align: center;"></div>
				<div title="学生出勤记录" style="overflow:auto; padding:10px; text-align: center;"></div>
			</div>

		</div>
		<div data-options="region:'center',title:'主面板',border:false"
			style="padding:5px;background:#eee;">
			<div id="tt" class="easyui-tabs" style="width:500px;height:250px;"
				data-options="fit:true">
				<div title="主页" style="padding:20px;display:none;">
					<h1>欢迎来到学生管理系统</h1>
				</div>
			</div>

		</div>
	</div>

</body>

</html>