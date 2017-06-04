package com.RM.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.RM.Model.Order;
import com.mysql.jdbc.Statement;

public class OrderDAO extends DAO
{
	private Order m_order;
	
	public void setOrder(Order order)
	{
		m_order = order;
	}
	
	public void Insert()
	{
		String sql = "INSERT INTO `order`(orderCreateTime, orderStatus, orderPrice, stuNumber, restNumber) VALUES(?, ?, ?, ?, ?)";
		PreparedStatement state = null;
		ResultSet rs = null;
		try
		{
			state = m_con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			state.setTimestamp(1, new java.sql.Timestamp(m_order.getOrderCreateTime().getTime()));
			state.setInt(2, m_order.getOrderStatus());
			state.setFloat(3, m_order.getOrderPrice());
			state.setString(4, m_order.getStuNumber());
			state.setString(5, m_order.getRestNumber());
			state.executeUpdate();
			rs = state.getGeneratedKeys(); 
			if(rs.next())
				m_order.setOrderID(rs.getInt(1));
		} 
		catch (SQLException e)
		{
			System.out.println(e.getErrorCode());
		}
		ClosePreStatement(state);
		CloseResultSet(rs);
	}
}
