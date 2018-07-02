package com.zs.dao;

import com.zs.entity.Admin;
import com.zs.entity.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeDao {

    /**
     * 添加员工
     * @param emp
     * @return
     */
    int insertEmp(Employee emp);

    /**
     * 通过工号删除员工
     * @param emp_id
     * @return
     */
    int DeleteEmpById(@Param("emp_id") String emp_id);

    /**
     * 更改员工
     * @param emp
     * @return
     */
    int UpdateEmp(Employee emp);

    /**
     * 查找所有员工
     * @return
     */
    List<Employee> listEmps(@Param("value") String value,  @Param("name") String name, @Param("begin") Integer begin , @Param("size") Integer size);

    /**
     * 通过email查找员工
     * @param email
     * @return
     */
    Employee getEmpById(@Param("email")String email);

    /**
     * 获取信息总量
     * @return
     */
    int getTotalEmpMes(@Param("value")String value, @Param("name") String name);

    /**
     * 通过用户名查询用户
     * @param name
     * @return
     */
    Admin getAdminByName(@Param("name")String name);

    /**
     * 注册用户
     * @param admin
     * @return
     */
    int addAdmin(Admin admin);
}
