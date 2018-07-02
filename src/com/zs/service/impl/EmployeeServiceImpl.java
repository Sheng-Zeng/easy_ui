package com.zs.service.impl;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import com.zs.dao.EmployeeDao;
import com.zs.entity.Admin;
import com.zs.entity.Employee;
import com.zs.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	private EmployeeDao ed;
	
	@Override
	public Map<String, Object> ShowAllEmp(int page, int single,String value, String name) {
		int begMes = (page-1) * single;
		List<Employee> emps = ed.listEmps(value,name,begMes, single);
		int total = ed.getTotalEmpMes(value,name);
		Map<String, Object> mapEmps = new HashMap<String, Object>();
		mapEmps.put("total", total);
		mapEmps.put("rows", emps);
		return mapEmps;
	}

	@Override
	public int UpdateEmp(Employee emp) {
		return ed.UpdateEmp(emp);
	}

	@Override
	public int DeleteEmp(String emp_id) {
		return ed.DeleteEmpById(emp_id);
	}

	@Override
	public int insertEmp(Employee emp) {
		return ed.insertEmp(emp);
	}

	@Override
	public int loginAdmin(Admin admin) {
		Admin ad = ed.getAdminByName(admin.getUsername());
		if (ad.getPassword().equals(admin.getPassword())) {
			return 1;
		}
		return 0;
	}

	@Override
	public int getAdmin(String name) {
		Admin ad = ed.getAdminByName(name);
		if (ad == null) {
			return 1;
		}
		return 0;
	}

	@Override
	public int addAdmin(Admin admin) {
		return ed.addAdmin(admin);
	}

	@Override
	public Employee checkEmail(String email) {
		return ed.getEmpById(email);
	}
}
