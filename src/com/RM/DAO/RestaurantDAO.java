package com.RM.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.RM.Model.Restaurant;

public class RestaurantDAO extends DAO
{
	private Restaurant m_restaurant;
	
	public RestaurantDAO(Restaurant restaurant)
	{
		m_restaurant = restaurant;
	}
	
	public RestaurantDAO()
	{
		m_restaurant = null;
	}
	
	public boolean Select()
	{
		String sql = "SELECT * FROM restaurant WHERE restNumber = ? LIMIT 1";
		PreparedStatement preState = null;
		ResultSet rs = null;
		boolean isSuccess = false;
		try
		{
			preState = m_con.prepareStatement(sql);
			preState.setString(1, m_restaurant.getAccount());
			rs = preState.executeQuery();
			isSuccess = rs.first();
			if(isSuccess)
			{
				m_restaurant.setName(rs.getString("restName"));
				m_restaurant.setPosition(rs.getString("restPosition"));
				m_restaurant.setIntroduction(rs.getString("restIntroduction"));
				m_restaurant.setDeliveryCost(rs.getFloat("restDeliveryCost"));
				m_restaurant.setImgPath(rs.getString("restImgPath"));
			}
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
			isSuccess = false;
		}
		CloseResultSet(rs);
		ClosePreStatement(preState);
		return isSuccess;
	}
	
	public boolean ExistRestaurant()
	{
		String sql = "SELECT * FROM restaurant WHERE restNumber = ? AND restPassword = ? LIMIT 1";
		PreparedStatement preState = null;
		ResultSet rs = null;
		boolean isSuccess = false;
		try
		{
			preState = m_con.prepareStatement(sql);
			preState.setString(1, m_restaurant.getAccount());
			preState.setString(2, m_restaurant.getPassword());
			rs = preState.executeQuery();
			isSuccess = rs.first();
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
			isSuccess = false;
		}
		CloseResultSet(rs);
		ClosePreStatement(preState);
		return isSuccess;
	}

	public LinkedList<Restaurant> GetAllRestaurant()
	{
		LinkedList<Restaurant> rests = null;
		String sql = "SELECT * FROM restaurant";
		PreparedStatement preState = null;
		ResultSet rs = null;
		try
		{
			preState = m_con.prepareStatement(sql);
			rs = preState.executeQuery();
			if(rs.first())
			{
				rests = new LinkedList<Restaurant>();
				do
				{
					Restaurant r = new Restaurant();
					r.setAccount(rs.getString("restNumber"));
					r.setName(rs.getString("restName"));
					r.setPosition(rs.getString("restPosition"));
					r.setIntroduction(rs.getString("restIntroduction"));
					r.setDeliveryCost(rs.getFloat("restDeliveryCost"));
					r.setImgPath(rs.getString("restImgPath"));
					rests.add(r);
				}while(rs.next());
			}
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		CloseResultSet(rs);
		ClosePreStatement(preState);
		return rests;
	}
}
