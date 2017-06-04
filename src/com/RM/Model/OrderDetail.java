package com.RM.Model;

public class OrderDetail
{
	private int m_orderID;
	private int m_foodID;
	private int m_foodCount;
	
	public int getOrderID()
	{
		return m_orderID;
	}
	public void setOrderID(int orderID)
	{
		this.m_orderID = orderID;
	}
	public int getFoodID()
	{
		return m_foodID;
	}
	public void setFoodID(int foodID)
	{
		this.m_foodID = foodID;
	}
	public int getFoodCount()
	{
		return m_foodCount;
	}
	public void setFoodCount(int foodCount)
	{
		this.m_foodCount = foodCount;
	}
}
