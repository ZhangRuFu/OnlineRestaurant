package com.RM.Control;

import com.RM.DAO.StudentDAO;
import com.RM.DAO.RestaurantDAO;
import com.RM.DAO.EmployeeDAO;
import com.RM.Model.User;
import com.RM.Model.Student;
import com.RM.Model.Employee;
import com.RM.Model.Restaurant;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginControl
 */
@WebServlet("/LoginControl")
public class LoginControl extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginControl()
	{
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		User user = null;
		if(User.StuLength == account.length())
			user = StudentLogin(account, password);
		else if(User.EmpLength == account.length())
			user = EmployeeLogin(account, password);
		else
			user = RestLogin(account, password);
		String dispathUrl;
		if(user != null)
		{
			dispathUrl = "index.jsp";
			request.getSession().setAttribute("User", user);
		}
		else
			dispathUrl = "login.html";
		response.sendRedirect(dispathUrl);
	}
	
	private Student StudentLogin(String account, String password)
	{
		Student student = new Student();
		student.setAccount(account);
		student.setPassword(password);
		StudentDAO stuDao = new StudentDAO(student);
		if(stuDao.ExistStudent())
			return student;
		else
			return null;
	}
	
	private Employee EmployeeLogin(String account, String password)
	{
		Employee employee = new Employee();
		employee.setAccount(account);
		employee.setPassword(password);
		EmployeeDAO employeeDAO = new EmployeeDAO(employee);
		if(employeeDAO.ExistRestaurant())
			return employee;
		else
			return null;
	}
	
	private Restaurant RestLogin(String account, String password)
	{
		Restaurant restaurant = new Restaurant();
		restaurant.setAccount(account);
		restaurant.setPassword(password);
		RestaurantDAO restDAO = new RestaurantDAO(restaurant);
		if(restDAO.ExistRestaurant())
			return restaurant;
		else
			return null;
	}
	

}
