package com.RM.DAO;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.RM.Model.OrderDetail;

public class OrderDetailDAO extends DAO
{
	private OrderDetail m_orderDetail;
	
	public void setOrderDetail(OrderDetail orderDetail)
	{
		m_orderDetail = orderDetail;
	}
	
	public void Insert()
	{
		String sql = "INSERT INTO OrderDetail(orderID, foodID, foodCount) VALUES(?, ?, ?)";
		PreparedStatement ps = null;
		
		try
		{
			ps = m_con.prepareStatement(sql);
			ps.setInt(1, m_orderDetail.getOrderID());
			ps.setInt(2, m_orderDetail.getFoodID());
			ps.setInt(3, m_orderDetail.getFoodCount());
			ps.executeUpdate();
			
		} catch (SQLException e)
		{
			System.out.println(e.getMessage());
		}
	}
}
