package com.RM.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.RM.Model.Food;
import com.RM.Model.Restaurant;

public class FoodDAO extends DAO
{
	
	private Food m_food = null;
	
	public FoodDAO(Food food)
	{
		m_food = food;
	}
	
	public FoodDAO()
	{
		
	}
	
	public LinkedList<Food> SelectByRestaurant(Restaurant rest)
	{
		LinkedList<Food> foods = null;
		String sql = "SELECT foodID,foodName,foodPrice,foodImgPath FROM food WHERE restNumber = ? ";
		PreparedStatement preState = null;
		ResultSet rs = null;
		try
		{
			preState = m_con.prepareStatement(sql);
			preState.setString(1, rest.getAccount());
			rs = preState.executeQuery();
			if(rs.first())
			{
				foods = new LinkedList<Food>();
				do
				{
					Food f = new Food();
					f.setFoodID(rs.getString("foodID"));
					f.setFoodName(rs.getString("foodName"));
					f.setFoodImgPath(rs.getString("foodImgPath"));
					f.setFoodPrice(rs.getFloat("foodPrice"));
					foods.add(f);
				}while(rs.next());
			}
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		CloseResultSet(rs);
		ClosePreStatement(preState);
		return foods;
	}

	public boolean Select()
	{
		String sql = "SELECT * FROM food WHERE foodID = ? ";
		PreparedStatement preState = null;
		ResultSet rs = null;
		boolean isSuccess = false;
		try
		{
			preState = m_con.prepareStatement(sql);
			preState.setString(1, m_food.getFoodID());
			rs = preState.executeQuery();
			if (rs.first())
			{		
				isSuccess = true;
				m_food.setFoodName(rs.getString("foodName"));
				m_food.setFoodImgPath(rs.getString("foodImgPath"));
				m_food.setFoodPrice(rs.getFloat("foodPrice"));
				m_food.setRestNumber(rs.getString("restNumber"));
			}
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		CloseResultSet(rs);
		ClosePreStatement(preState);
		return isSuccess;
	}
}
