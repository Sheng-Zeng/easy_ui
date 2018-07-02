<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
	
	$.extend($.fn.validatebox.defaults.rules, {    
	    trueLength: {    
	        validator: function(value){    
	            return (value.length == 11 || value.length == 8);    
	        },    
	        message: "请输入正确的手机号码"    
	    }    
	});  


	$(function() {
		$("#user").textbox({
			required : true,
			validateOnCreate : false,
			validateOnBlur : true,
			prompt : "请输入用户名",
		});
		
		$("#empid").textbox({
			required : true,
			validateOnCreate : false,
			validateOnBlur : true,
		});
		
		$("#sex").textbox({
			required : true,
			validateOnCreate : false,
			validateOnBlur : true,
		});
		
		$("#date").textbox({
			required : true,
			validateOnCreate : false,
			validateOnBlur : true,

		});
		
		$("#email").textbox({
			required : true,
			validateOnCreate : false,
			validateOnBlur : true,
			validType : "email",
		});
		
		$("#tel").textbox({
			required : true,
			validateOnCreate : false,
			validateOnBlur : true,
			validType:"trueLength",
		});
		
		$("#address").textbox({
			required : true,
			validateOnCreate : false,
			validateOnBlur : true,
		});
		
		$("#sub").linkbutton({
			text : "提交",
			onClick : function() {
				$("#ff").form("submit",{
					url : "${pageContext.request.contextPath}/emps/modifyEmps",
					onSubmit : function() {
						console.log("提交前执行");
						return $("#ff").form("validate");
					},
					success : function(data) {
						if(data==1){
							$.messager.alert("提示","更改成功,请刷新页面！");	
						} else {
							$.messager.alert("提示","更改失败！");
						}
						$("form").dialog({
							closed:true,
						});
                        window.location.reload()
					}
				}); 
			},
		});
	});
</script>


<form id="ff" method="post">
	<table>
		<tr>
			<td>学号：</td>
			<td><input id="empid" name="emp_id"></td>
		</tr>
		<tr>
			<td>用户名：</td>
			<td><input id="user" name="emp_name"></td>
		</tr>
		<tr>
			<td>性别：</td>
			<td><input id="sex" name="sex"></td>
			</td>
		</tr>

		<tr>
			<td>出生日期：</td>
			<td><input id="date" name="borndate" type="text"></input></td>
		</tr>
		<tr>
			<td>电话：</td>
			<td><input id="tel" name="telphone"></td>
		</tr>
		
		<tr>
			<td>邮箱：</td>
			<td><input id="email" name="email"></td>
		</tr>
		
		<tr>
			<td>地址：</td>
			<td><input id="address" name="address"></td>
		</tr>
		
		<tr>
			<td><a id="sub"></a></td>
		</tr>
	</table>

</form>

