package com.RM.Control;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RM.DAO.FoodDAO;
import com.RM.Model.Food;
import com.RM.Model.Order;
import com.RM.Model.OrderItem;

/**
 * Servlet implementation class OrderControl
 */
@WebServlet("/OrderControl")
public class OrderControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] foodids = request.getParameterValues("foods");
		String[] foodcount = request.getParameterValues("foodCount");
		FoodDAO foodDAO = new FoodDAO();
		Order order = new Order();
		for(int i = 0; i < foodids.length; i++)
		{
			String foodID = foodids[i];
			int foodCount = Integer.valueOf(foodcount[i]);
			Food food = new Food();
			food.setFoodID(foodID);
			foodDAO.setFood(food);
			foodDAO.Select();
			OrderItem item = new OrderItem(food, foodCount);
			order.AddItem(item);
		}
		request.getSession().setAttribute("Order", order);
		response.sendRedirect("ordermeal/order.jsp");
	}

}
