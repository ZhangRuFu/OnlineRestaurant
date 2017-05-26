package com.RM.Model;

public class Student extends User
{	
	private char m_stuSex;
	private int m_stuAge;
	
	
	public char getStuSex()
	{
		return m_stuSex;
	}
	public void setStuSex(char StuSex)
	{
		this.m_stuSex = StuSex;
	}
	
	public int getStuAge()
	{
		return m_stuAge;
	}
	public void setStuAge(int StuAge)
	{
		this.m_stuAge = StuAge;
	}
	
}
