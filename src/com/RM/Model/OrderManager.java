package com.RM.Model;

import java.util.LinkedList;

import com.RM.DAO.RestaurantDAO;

class RestaurantOrder
{
	private LinkedList<OrderItem> m_items = new LinkedList<OrderItem>();
	private String m_restNumber;
	private float m_sum;
	
	public RestaurantOrder(String restNumber)
	{
		m_restNumber = restNumber;
	}
	
	public void AddItem(OrderItem item)
	{
		m_sum += item.GetPrice();
		m_items.add(item);
	}
	
	public float GetTotalPrice()
	{
		return m_sum;
	}
	
	public String GetRestNumber()
	{
		return m_restNumber;
	}
	
	public OrderItem GetOrderItem(int index)
	{
		return m_items.get(index);
	}
	
	public int GetOrderItemCount()
	{
		return m_items.size();
	}
}

public class OrderManager
{
	private LinkedList<RestaurantOrder> m_restOrders = new LinkedList<RestaurantOrder>();
	
	public void AddItem(OrderItem item)
	{
		for(RestaurantOrder restOrder : m_restOrders)
			if(restOrder.GetRestNumber().equals(item.getFood().getRestNumber()))
			{
				restOrder.AddItem(item);
				return;
			}
		
		RestaurantOrder restOrder = new RestaurantOrder(item.getFood().getRestNumber());
		restOrder.AddItem(item);
		m_restOrders.add(restOrder);
		return;
	}
	
	public int GetRestCount()
	{
		return m_restOrders.size();
	}
	
	public int GetOrderItemCount(int index)
	{
		return m_restOrders.get(index).GetOrderItemCount();
	}
	
	public String GetRestName(int index)
	{
		String restNumber = m_restOrders.get(index).GetRestNumber();
		Restaurant rest = new Restaurant();
		rest.setAccount(restNumber);
		RestaurantDAO restDAO = new RestaurantDAO(rest);
		restDAO.Select();
		return rest.getName();
	}
	
	public OrderItem GetOrderItem(int restIndex, int itemIndex)
	{
		return m_restOrders.get(restIndex).GetOrderItem(itemIndex);
	}
	
	public String GetRestNumber(int index)
	{
		return m_restOrders.get(index).GetRestNumber();
	}
	
	public float GetRestDeliveryCost(int index)
	{
		String restNumber = m_restOrders.get(index).GetRestNumber();
		Restaurant rest = new Restaurant();
		rest.setAccount(restNumber);
		RestaurantDAO restDAO = new RestaurantDAO(rest);
		restDAO.Select();
		return rest.getDeliveryCost();
	}
	
	public float GetRestPrice(int index)
	{
		return m_restOrders.get(index).GetTotalPrice();
	}
	
	public float GetTotalPrice()
	{
		float sum = 0;
		for(RestaurantOrder restOrder : m_restOrders)
			sum += restOrder.GetTotalPrice();
		return sum;
	}
}
