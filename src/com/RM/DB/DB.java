package com.RM.DB;

import java.sql.*;

public class DB
{
	private String m_user;
	private String m_password;
	private String m_dbName;
	private String m_IP;
	private Connection m_con;
	private static DB m_instance;
	
	public static boolean Init(String user, String password, String DBName, String ip)
	{
		if (m_instance != null)
			return true;
		m_instance = new DB();
		m_instance.m_user = user;
		m_instance.m_password = password;
		m_instance.m_dbName = DBName;
		m_instance.m_IP = ip;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcUrl = String.format("jdbc:mysql://%s/%s", m_instance.m_IP, m_instance.m_dbName);
			m_instance.m_con = DriverManager.getConnection(jdbcUrl, m_instance.m_user, m_instance.m_password);
		} 
		catch (SQLException sqlException)
		{
			sqlException.printStackTrace();
			return false;
		} 
		catch (ClassNotFoundException classException)
		{
			classException.printStackTrace();
			return false;
		}
		return true;
	}
	
	public static Connection GetConnection()
	{
		if(m_instance == null)
			return null;
		return m_instance.m_con;
	}
}
