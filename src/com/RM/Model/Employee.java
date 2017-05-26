package com.RM.Model;

public class Employee extends User
{
	String m_restNumber;
	String m_stuNumber;
	float m_salary;
	int m_taskCount;
	
	public String getRestNumber()
	{
		return m_restNumber;
	}
	public void setRestNumber(String restNumber)
	{
		this.m_restNumber = restNumber;
	}
	public String getStuNumber()
	{
		return m_stuNumber;
	}
	public void setStuNumber(String stuNumber)
	{
		this.m_stuNumber = stuNumber;
	}
	public float getSalary()
	{
		return m_salary;
	}
	public void setSalary(float salary)
	{
		this.m_salary = salary;
	}
	public int getTaskCount()
	{
		return m_taskCount;
	}
	public void setTaskCount(int taskCount)
	{
		this.m_taskCount = taskCount;
	}
}
