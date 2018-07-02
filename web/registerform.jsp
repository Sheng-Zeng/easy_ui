<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function () {
        $.extend($.fn.validatebox.defaults.rules, {
            checkAdmin : {
                validator : function(value) {
                    var result = "";
                    $.ajax({
                        type : "post",
                        async : false,
                        url : "${pageContext.request.contextPath}/emps/getAdmin",
                        data : {
                            "name" : value
                        },
                        success : function(data) {
                            result = data;
                        }
                    });
                    if (result == 1) {
                        return true;
                    } else {
                        return false;
                    }
                },
                message : "用户名已存在！"
            }
        });

        $("#users").textbox({
            required : true,
            validateOnCreate : false,
            validateOnBlur : true,
            validType: "checkAdmin",
            prompt : "请输入用户名",
        });

		$("#pbs").passwordbox({
            required : true,
            validateOnCreate : false,
            validateOnBlur : true,
			prompt: "Password",
			showEye: true
		});

        $("#subreg").linkbutton({
            text : "提交",
            onClick : function() {
                $("#regform").form("submit",{
                    url : "${pageContext.request.contextPath}/emps/addAdmin",
                    onSubmit : function() {
                        console.log("提交前执行");
                        return $("#regform").form("validate");
                    },
                    success : function(data) {
                        if(data==1){
                            $.messager.alert("提示","注册成功");
                            //window.location.href="http://localhost:8088/easy_ui/project.jsp";
                        } else {
                            $.messager.alert("提示","注册失败");
                        }
                    }
                });
            },
        });
    });

</script>
<form id="regform" method="post">
	<table>
		<tr>
			<td>用户名：</td>
			<td><input id="users" name="username"></td>
		</tr>
		<tr>
			<td>密码</td>
			<td><input id="pbs"  name="password"></td>
		</tr>
		<tr>
			<td><a id="subreg"></a></td>
		</tr>
	</table>

</form>