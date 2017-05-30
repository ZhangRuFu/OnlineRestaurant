<%@page import="com.RM.Model.Restaurant"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.RM.DAO.RestaurantDAO" %>
<%@ page import="java.util.LinkedList" %>
<!DOCTYPE HTML>
 <html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
		<title>安徽工业大学在线餐厅系统</title>
	</head>
	
	<body style="background-color:#f7f7f7;font-family:'Microsoft Yahei'">
	<!-- Header -->
	<div class="navbar navbar-default" style="box-shadow:5px 5px 15px -10px">
		<div style="padding-left: 50px;padding-right: 100px;">
		<ul class="nav navbar-nav">
			<li class="navbar-head" style="margin-right:30px;"/><a href="<%=request.getContextPath() %>/index.jsp" style="background-image: url('<%=request.getContextPath() %>/images/newlogo.png');width: 250px;height: 48px;"></a></li>
			<li class="active"><a href="">首页</a></li>
			<li><a href="">我的订单</a></li>
			<li><a href="">购物车</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href=""><span class="glyphicon glyphicon-user"></span>个人空间</a></li>
		</ul>
		</div>
	</div>
	<!-- Content -->
	<div class="container" style="background-color:#fff;border:1px solid #e6e6e6">
		<%
		RestaurantDAO restDAO = new RestaurantDAO();
		LinkedList<Restaurant> rests =  restDAO.GetAllRestaurant();
		int row = (rests.size() % 3) == 0 ? rests.size() / 3 : rests.size() / 3 + 1;
		for(int i = 0; i < row; i++)
		{
		%>
		<div class="row">
			<%
			for(int j = 0; j < 3; j++)
			{
				int index = i * 3 + j;
				if(index >= rests.size())
					break;
				Restaurant r = rests.get(i * 3 + j);
			%>
			<div class="col-md-4">
				<div style="border: 1px solid #e6e6e6;margin: 5px 0px;padding: 10px;border-radius: 5px;">
					<img class="img-rounded" src="<%=request.getContextPath() %>/images/restlogo/<%=r.getImgPath()%>" width="80" height="80"/>
					<div style="display:inline-block;vertical-align:top;padding:0px 20px">
						<span style="font-family: Youyuan;font-size: 20px;font-weight: 600;vertical-align: top;"><%=r.getName() %></span>
						<div style="padding-top:5px">月售100单</div>
						<div style="padding-top:5px">配送费:¥<%=r.getDeliveryCost() %></div>
					</div>
					<a class="btn btn-info" style="float: right;" href="restaurant.jsp?restNum=<%=r.getAccount() %>">进入餐厅</a>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<% 
		}
		%>
	
	</div>
	
	
	
	<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script> 
	</body>
 </html>