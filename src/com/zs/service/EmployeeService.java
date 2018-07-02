package com.zs.service;

import com.zs.entity.Admin;
import com.zs.entity.Employee;

import java.util.Map;


public interface EmployeeService {

	/**
	 * 展示所有员工
	 * @return
	 */
	Map<String,Object> ShowAllEmp(int page, int single,String value, String name);


	
	/**
	 * 检查Email
	 */
	Employee checkEmail(String email);

	/**
	 * 更新员工
	 * @param emp
	 * @return
	 */
	int UpdateEmp(Employee emp);

	/**
	 * 删除员工
	 * @param emp_id
	 * @return
	 */
	int DeleteEmp(String emp_id);

	/**
	 * 添加一个员工
	 * @param emp
	 * @return
	 */
	int insertEmp(Employee emp);

	/**
	 * 登录验证
	 * @param admin
	 * @return
	 */
	int loginAdmin(Admin admin);

	/**
	 * 验证用户名是否存在
	 * @param admin
	 * @return
	 */
	int getAdmin(String name);

	/**
	 * 注册用户
	 * @param admin
	 * @return
	 */
	int addAdmin(Admin admin);
	
}
