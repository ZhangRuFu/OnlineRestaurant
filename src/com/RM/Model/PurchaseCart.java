package com.RM.Model;

import java.util.LinkedList;

public class PurchaseCart
{
	private LinkedList<OrderItem> m_items;
	private float m_sum;
	private boolean m_isChange;
	
	public PurchaseCart()
	{
		m_items = new LinkedList<OrderItem>();
		m_isChange = false;
		m_sum = 0;
	}
	
	public void AddItem(OrderItem item)
	{
		m_isChange = true;
		for(OrderItem i : m_items)
		{
			if(i.getFood().getFoodID().equals(item.getFood().getFoodID()))
			{
				i.setCount(item.getCount());
				return;
			}
		}
		m_items.add(item);
	}
	
	public boolean DeleteItem(OrderItem item)
	{
		for(OrderItem i : m_items)
		{
			if(i.getFood().getFoodID().equals(item.getFood().getFoodID()))
			{
				m_items.remove(i);
				return true;
			}
		}
		return false;
	}
	
	public boolean ModifyItemCount(OrderItem item)
	{
		for(OrderItem i : m_items)
		{
			if(i.getFood().getFoodID().equals(item.getFood().getFoodID()))
			{
				i.setCount(item.getCount());
				if(i.getCount() == 0)
					m_items.remove(i);
				return true;
			}
		}
		return false;
	}
	
	public LinkedList<OrderItem> GetItems()
	{
		return m_items;
	}
	
	public OrderItem GetItem(String id)
	{
		for(OrderItem i : m_items)
		{
			if(i.getFood().getFoodID().equals(id))
				return i;
		}
		return null;
	}
	
	public float GetTotalPrice()
	{
		if(!m_isChange)
			return m_sum;
		m_sum = 0;
		for(OrderItem i : m_items)
			m_sum += i.GetPrice();
		return m_sum;
	}
}
