package com.RM.Control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.RM.DAO.FoodDAO;
import com.RM.Model.Food;
import com.RM.Model.OrderItem;
import com.RM.Model.PurchaseCart;

/**
 * Servlet implementation class PurchaseCart
 */
@WebServlet("/PurchaseCartControl")
public class PurchaseCartControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseCartControl() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession();
		PurchaseCart cart = null;
		if((cart = (PurchaseCart)session.getAttribute("PurchaseCart")) == null)
		{
			cart = new PurchaseCart();
			session.setAttribute("PurchaseCart", cart);
		}
		String operation = request.getParameter("operation");
		if(operation.equals("add"))
			AddItem(request, cart);
		else if(operation.equals("delete"))
			response.getWriter().write(DeleteItem(request, cart));
		else if(operation.equals("modify"))
			response.getWriter().write(ModifyItemCount(request, cart));
		else if(operation.equals("check"))
			response.getWriter().write(CheckItem(request, cart));
	}
	
	private void AddItem(HttpServletRequest request, PurchaseCart cart)
	{
		String foodID = request.getParameter("foodID");
		int foodCount = Integer.parseInt(request.getParameter("foodCount"));
		if(foodCount == 0)
			return;
		Food food = new Food();
		food.setFoodID(foodID);
		FoodDAO foodDAO = new FoodDAO(food);
		foodDAO.Select();
		cart.AddItem(new OrderItem(food, foodCount));
	}
	
	private String DeleteItem(HttpServletRequest request, PurchaseCart cart)
	{
		String foodID = request.getParameter("foodID");
		Food food = new Food();
		food.setFoodID(foodID);
		String responseText = null;
		if(cart.DeleteItem(new OrderItem(food, 1)))
			responseText = String.valueOf(cart.GetTotalPrice());
		else
			responseText = "Error";
		return responseText;
	}
	
	private String ModifyItemCount(HttpServletRequest request, PurchaseCart cart)
	{
		String foodID = request.getParameter("foodID");
		int itemCount = Integer.parseInt(request.getParameter("itemCount"));
		Food food = new Food();
		food.setFoodID(foodID);
		String responseText = null;
		if(cart.ModifyItemCount(new OrderItem(food, itemCount)))
			if(itemCount != 0)
				responseText = String.valueOf(cart.GetItem(request.getParameter("foodID")).GetPrice()) + "," + String.valueOf(cart.GetTotalPrice());
			else
				responseText = "0.0," + String.valueOf(cart.GetTotalPrice());
		else
			responseText = "Error";
		return responseText;
	}
	
	private String CheckItem(HttpServletRequest request, PurchaseCart cart)
	{
		String foodID = request.getParameter("foodID");
		OrderItem item = cart.GetItem(foodID);
		if(item == null)
			return "Error";
		return String.valueOf(item.GetPrice());
			
	}
}
