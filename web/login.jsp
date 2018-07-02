<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>学生管理系统登录页</title>
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
	$(function () {
        $("#dlogin").dialog({
            title: "登陆",
            width: 400,
            height: 200,
            closed: false,
            cache: false,
            closable:false,
            href: "${pageContext.request.contextPath}/loginform.jsp",
            modal: false,
            toolbar:[{
                text:'注册',
                iconCls:'icon-add',
                handler:function(){
                    $("#dregister").dialog({
                        title: "注册",
                        width: 400,
                        height: 200,
                        closed: false,
                       	cache: false,
                        href: "${pageContext.request.contextPath}/registerform.jsp",
                        modal: true,
                    });
                },
			}]
		});
    });

</script>
</head>

<body>
<img src="img/20140506011702261.jpg" width="1366" height="768">
<div id="dregister"></div>
<div id="dlogin"></div>
</body>

</html>