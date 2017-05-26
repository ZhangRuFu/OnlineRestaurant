package com.RM.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.RM.Model.Employee;;

public class EmployeeDAO extends DAO
{
	private Employee m_employee;
	
	public EmployeeDAO(Employee employee)
	{
		m_employee = employee;
	}
	
	public boolean ExistRestaurant()
	{
		String sql = "SELECT * FROM employee WHERE employeeNumber = ? AND employeePassword = ? LIMIT 1";
		PreparedStatement preState = null;
		ResultSet rs = null;
		boolean isSuccess = false;
		try
		{
			preState = m_con.prepareStatement(sql);
			preState.setString(1, m_employee.getAccount());
			preState.setString(2, m_employee.getPassword());
			rs = preState.executeQuery();
			isSuccess = rs.first();
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
			isSuccess = false;
		}
		CloseResultSet(rs);
		ClosePreStatement(preState);
		return isSuccess;
	}
}
