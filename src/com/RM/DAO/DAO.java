package com.RM.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.RM.DB.DB;

public class DAO
{
	protected Connection m_con = null;
	
	public DAO()
	{
		m_con = DB.GetConnection();
	}
	
	protected void CloseResultSet(ResultSet rs)
	{
		try
		{
			if (rs != null)
				rs.close();
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	protected void ClosePreStatement(PreparedStatement ps)
	{
		try
		{
			if (ps != null)
				ps.close();
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	protected void CloseConnection(Connection con)
	{
		try
		{
			if (con != null)
				con.close();
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
}
