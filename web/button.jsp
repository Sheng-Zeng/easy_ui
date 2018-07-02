<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">

	$(function() {


		$("#dg").datagrid({
			url : "${pageContext.request.contextPath}/emps/listEmps",
			columns : [ [ {
				field : "emp_id",
				title : "学号"
			}, {
				field : "emp_name",
				title : "姓名"
			}, {
				field : "sex",
				title : "性别"
			}, {
				field : "borndate",
				title : "生日",
				//width:50,
				formatter : function(value, row, index) {
					var date = new Date(value);
					return date.getFullYear() + "年" + (date.getMonth()+1) + "月" + date.getDate() + "日";

					//return "<a class='loan_ct_view_button'></a>" 返回一个linkbutton
				},
			}, {
				field : "telphone",
				title : "电话"
			}, {
				field : "email",
				title : "邮箱"
			}, {
				field : "address",
				title : "家庭住址"
			} ] ],

		/*
		该方法用来解决formatter里边的linkbutton问题
		onLoadSuccess:function(data){
			    $(".loan_ct_view_button").linkbutton({
					text:'详细', plain:false, iconCls:'icon-user_green'
				});
			},
		*/

			fitColumns : true,
			striped : true,
			pagination : true,
			singleSelect : true,
			pageSize : 5,
			pageList : [ 5, 10, 15, 20 ],
			toolbar : "#tb",					
		});
		
	});
	function qq(value, name) {
		$("#dg").datagrid("load", {    
		    name:name,    
		    value:value   
		});  

	}
</script>
<table id="dg"></table>
<form id="form"></form>
<div id="tb" style="display: none">
		<a class="easyui-linkbutton"
			data-options="iconCls:'icon-edit',plain:true,text:'修改',onClick: function(){
				var rowData = $('#dg').datagrid('getSelected');  
				console.log(rowData);
				$('#form').dialog({    
					    title:'修改',    
					    width:600,    
					    height:300,    
					    href: '${pageContext.request.contextPath}/form1.jsp',    
					    onLoad:function(){
							$('#ff').form('load',rowData); //在加载表单时将行数据加载到表单元素中
						} 
					});
				
				}"></a> 
		<a class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true,text:'新增',onClick: function(){
					$('#form').dialog({    
					    title:'注册',    
					    width:600,    
					    height:300,    
					    href: '${pageContext.request.contextPath}/form.jsp',    
					    modal: true   
					});   
				}"></a> 
		<a class="easyui-linkbutton"
			data-options="iconCls:'icon-cancel',plain:true,text:'删除',onClick: function(){
				var rowData = $('#dg').datagrid('getSelected');
				var result = '';	
				$.ajax({
	                type : 'post',
	                async : false,
	                url : '${pageContext.request.contextPath}/emps/deleteEmail',
	                data : {
	                    'empid' : rowData.emp_id
	                },
	                success : function(data) {
	                    result = data;
	                }
	            }); 
				 if (result == 1 ) {
				 	$.messager.alert('提示','删除成功,请刷新页面！');	
				} else {
					$.messager.alert('提示','删除失败！');	
				}
				
				}"></a>
		<input id="ss" class="easyui-searchbox" style="width:300px"
			data-options="searcher:qq,prompt:'Please Input Value',menu:'#mm'"></input>
		<div id="mm">
			<div data-options="name:'emp_name',iconCls:'icon-ok'">姓名</div>
			<div data-options="name:'address',iconCls:'icon-ok'">地址</div>
			<div data-options="name:'sex',iconCls:'icon-ok'">性别</div>
		</div>
</div>

