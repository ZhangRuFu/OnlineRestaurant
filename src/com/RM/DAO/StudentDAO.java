package com.RM.DAO;

import com.RM.Model.Student;
import java.sql.*;

public class StudentDAO extends DAO
{
	private Student m_student;
	
	public StudentDAO(Student student)
	{
		m_student = student;
	}
	
	public boolean ExistStudent()
	{
		String sql = "SELECT * FROM student WHERE stuNumber = ? AND stuPassword = ? LIMIT 1";
		PreparedStatement preState = null;
		ResultSet rs = null;
		boolean isSuccess = false;
		try
		{
			preState = m_con.prepareStatement(sql);
			preState.setString(1, m_student.getAccount());
			preState.setString(2, m_student.getPassword());
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
