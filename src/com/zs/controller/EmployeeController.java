package com.zs.controller;


import java.sql.SQLOutput;
import java.util.Map;

import com.zs.entity.Admin;
import com.zs.entity.Employee;
import com.zs.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/emps")
public class EmployeeController {
	@Autowired
	private EmployeeService es;
	
	@RequestMapping("/listEmps")
	@ResponseBody
	public Map<String, Object> listEmp(String value, String name, Integer page , Integer rows) throws Exception {
		return es.ShowAllEmp(page,rows,value,name);
	}
	
	@RequestMapping("/addEmps")
	@ResponseBody
	public Integer addEmp(Employee emp) {
		return es.insertEmp(emp);
	}
	
	@RequestMapping("/checkEmail")
	@ResponseBody
	public String checkemail(String email) {
		Employee emp = es.checkEmail(email);
		if (emp != null) {
			return "error";
		} else {
			return "success";
		}
	}
	
	@RequestMapping("/modifyEmps")
	@ResponseBody
	public Integer modifyEmp(Employee emp) {
		return es.UpdateEmp(emp);
	}
	
	@RequestMapping("/deleteEmail")
	@ResponseBody
	public Integer deleteEmp(String empid) {
		return es.DeleteEmp(empid);
	}

	@RequestMapping("/loginAdmin")
	@ResponseBody
	public Integer loginEmp(Admin admin) {
		System.out.println(admin + "       " + "Hell");
		return es.loginAdmin(admin);
	}

	@RequestMapping("/getAdmin")
	@ResponseBody
	public Integer getEmp(String name) {
		return es.getAdmin(name);
	}

	@RequestMapping("/addAdmin")
	@ResponseBody
	public Integer addEmp(Admin admin) {
		return es.addAdmin(admin);
	}
}
