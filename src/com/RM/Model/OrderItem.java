package com.RM.Model;

public class OrderItem
{
	private int m_count;
	private Food m_food;
	
	public OrderItem(Food food, int count)
	{
		m_food = food;
		m_count = count;
	}
	
	public int getCount()
	{
		return m_count;
	}
	public void setCount(int count)
	{
		this.m_count = count;
	}
	public void AddCount(int delta)
	{
		m_count += delta;
	}
	public Food getFood()
	{
		return m_food;
	}
	public float GetPrice()
	{
		return m_count * m_food.getFoodPrice();
	}
}
