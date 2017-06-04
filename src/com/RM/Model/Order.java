package com.RM.Model;

import java.util.Date;

public class Order
{
	int m_orderID;
	Date m_orderCreateTime;
	Date m_CompleteTime;
	int m_orderStatus;
	float m_orderPrice;
	String m_stuNumber;
	String m_restNumber;
	
	static public final int WAIT_TO_DISPOSE = 1;
	static public final int WAIT_TO_TAKEOUT = 2;
	static public final int FINISHED = 3;
	
	public int getOrderID()
	{
		return m_orderID;
	}
	public void setOrderID(int orderID)
	{
		this.m_orderID = orderID;
	}
	public Date getOrderCreateTime()
	{
		return m_orderCreateTime;
	}
	public void setOrderCreateTime(Date orderCreateTime)
	{
		this.m_orderCreateTime = orderCreateTime;
	}
	public Date getCompleteTime()
	{
		return m_CompleteTime;
	}
	public void setCompleteTime(Date completeTime)
	{
		m_CompleteTime = completeTime;
	}
	public int getOrderStatus()
	{
		return m_orderStatus;
	}
	public void setOrderStatus(int orderStatus)
	{
		this.m_orderStatus = orderStatus;
	}
	public float getOrderPrice()
	{
		return m_orderPrice;
	}
	public void setOrderPrice(float orderPrice)
	{
		this.m_orderPrice = orderPrice;
	}
	public String getStuNumber()
	{
		return m_stuNumber;
	}
	public void setStuNumber(String stuNumber)
	{
		this.m_stuNumber = stuNumber;
	}
	public String getRestNumber()
	{
		return m_restNumber;
	}
	public void setRestNumber(String restNumber)
	{
		this.m_restNumber = restNumber;
	}
}
