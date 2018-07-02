<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function () {
        $("#user").textbox({
            prompt : "请输入用户名",
        });

		$('#pb').passwordbox({
			prompt: "Password",
			showEye: true
		});

        $("#sublogin").linkbutton({
            text : "提交",
            onClick : function() {
                $("#loginform").form("submit",{
                    url : "${pageContext.request.contextPath}/emps/loginAdmin",
                    onSubmit : function() {
                        console.log("提交前执行");
                        return $("#loginform").form("validate");
                    },
                    success : function(data) {
                        if(data==1){
                            $.messager.alert("提示","登录成功");
                            window.location.href="http://localhost:8088/easy_ui/project.jsp";
                        } else {
                            $.messager.alert("提示","密码或者用户名错误！");
                        }
                    }
                });
            },
        });
    });

</script>
<form id="loginform" method="post">
	<table>
		<tr>
			<td>用户名：</td>
			<td><input id="user" name="username"></td>
		</tr>
		<tr>
			<td>密码</td>
			<td><input id="pb"  name="password"></td>
		</tr>
		<tr>
			<td><a id="sublogin"></a></td>
		</tr>
	</table>

</form>