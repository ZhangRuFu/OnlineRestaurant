package com.RM.Model;

public class User
{
	
	public static final int StuLength = 9;
	public static final int EmpLength = 3;
	public static final int RestLength = 4;
	
	protected String m_account;
	protected String m_password;
	protected String m_name;
	
	public String getAccount()
	{
		return m_account;
	}
	public void setAccount(String account)
	{
		this.m_account = account;
	}
	public String getPassword()
	{
		return m_password;
	}
	public void setPassword(String password)
	{
		m_password = password;
	}
	public String getName()
	{
		return m_name;
	}
	public void setName(String name)
	{
		this.m_name = name;
	}
}
