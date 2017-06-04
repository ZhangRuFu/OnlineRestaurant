package com.RM.Control;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RM.Model.OrderManager;
import com.RM.Model.Student;
import com.RM.DAO.OrderDAO;
import com.RM.DAO.OrderDetailDAO;
import com.RM.Model.Order;
import com.RM.Model.OrderDetail;
import com.RM.Model.OrderItem;

/**
 * Servlet implementation class OrderSubmitControl
 */
@WebServlet("/OrderSubmitControl")
public class OrderSubmitControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderSubmitControl() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Student stu = (Student)request.getSession().getAttribute("User");
		OrderManager order = (OrderManager)request.getSession().getAttribute("Order");
		int restCount = order.GetRestCount();
		for(int i = 0; i < restCount; i++)
		{
			String restNumber = order.GetRestNumber(i);
			Order o = new Order();
			o.setRestNumber(restNumber);
			o.setStuNumber(stu.getAccount());
			o.setOrderStatus(Order.WAIT_TO_DISPOSE);
			o.setOrderPrice(order.GetRestPrice(i));
			o.setOrderCreateTime(new Date());
			OrderDAO orderDAO = new OrderDAO();
			orderDAO.setOrder(o);
			orderDAO.Insert();
			int orderItemCount = order.GetOrderItemCount(i);
			
			for(int j = 0; j < orderItemCount; j++)
			{
				OrderItem item = order.GetOrderItem(i, j);
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setFoodID(Integer.parseInt(item.getFood().getFoodID()));
				orderDetail.setFoodCount(item.getCount());
				orderDetail.setOrderID(o.getOrderID());
				OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
				orderDetailDAO.setOrderDetail(orderDetail);
				orderDetailDAO.Insert();
			}
		}
		response.getWriter().println("Order has submitted");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}

}
