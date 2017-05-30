<%@page import="com.RM.DAO.FoodDAO"%>
<%@page import="com.RM.Model.Food"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.RM.DAO.RestaurantDAO"%>
<%@page import="com.RM.Model.Restaurant"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML>
 <html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
		<script type="text/javascript">
			function addToCart(item)
			{
				var foodDiv = item.parentNode;
				var foodID = foodDiv.getElementsByTagName("input")[0].value;
				var foodCount = foodDiv.getElementsByTagName("input")[1].value;
				var ajaxRequest = new XMLHttpRequest();
				ajaxRequest.open("POST", "<%=request.getContextPath() %>/PurchaseCartControl");
				ajaxRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
				var data="operation=add&foodID="+foodID+"&foodCount="+foodCount;
				ajaxRequest.send(data);
			}
		
			function addItem(button)
			{
				var input = button.parentNode.parentNode.getElementsByTagName("input")[0];
				if(input.value < 0)
					input.value = 0;
				else
					input.value++;
			}
			
			function minusItem(button)
			{
				var input = button.parentNode.parentNode.getElementsByTagName("input")[0];
				if(input.value <= 0)
					input.value = 0;
				else
					input.value--;
				
			}
		</script>
		<title>安徽工业大学在线餐厅系统</title>
	</head>
	
	<body style="background-color:#f7f7f7;font-family:'Microsoft Yahei'">
	<!-- Header -->
	<div class="navbar navbar-default" style="margin-bottom:0px;box-shadow:5px 5px 15px -10px">
		<div style="padding-left: 50px;padding-right: 100px;">
		<ul class="nav navbar-nav">
			<li class="navbar-head" style="margin-right:30px;"/><a href="<%=request.getContextPath() %>/index.jsp" style="background-image: url('<%=request.getContextPath() %>/images/newlogo.png');width: 250px;height: 48px;"></a></li>
			<li class="active"><a href="">首页</a></li>
			<li><a href="">我的订单</a></li>
			<li><a href="purchasecart.jsp">购物车</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href=""><span class="glyphicon glyphicon-user"></span>个人空间</a></li>
		</ul>
		</div>
	</div>
	<!-- Header -->
	<!-- Content -->
	<%
		String restNumber = request.getParameter("restNum");
		Restaurant rest = new Restaurant();
		rest.setAccount(restNumber);
		RestaurantDAO restDAO = new RestaurantDAO(rest);
		restDAO.Select();
		FoodDAO foodDAO = new FoodDAO();
		LinkedList<Food> foods = foodDAO.SelectByRestaurant(rest);
	%>
	<div>
		<div style="float:left;width:100%;height:200px;background-image:url(<%=request.getContextPath() %>/images/foodback.jpg);background-position: center;"></div>
			<div style="position:absolute;margin-left: 120px;margin-top: 50px;">
					<img class="img-circle" style="width:100px;height:100px;border:2px solid #e6e6e6;" src="<%=request.getContextPath() %>/images/restlogo/<%=rest.getImgPath() %>" width="80" height="80"/>
					<div style="margin-top:15px;color:white;display:inline-block;vertical-align:top;padding:0px 20px">
						<span style="font-family: Youyuan;font-size: 20px;font-weight: 600;vertical-align: top;"><%=rest.getName() %></span>
						<div style="padding-top:15px">月售100单</div>
					</div>
			</div>
		<div style="color: white;position: absolute;font-family: Youyuan;font-size: 20px;right: 520px;top: 120px;">
			配送费<br>¥<%=rest.getDeliveryCost() %>
		</div>
		<div style="color: white;position: absolute;font-family: Youyuan;font-size: 20px;right: 150px;top: 120px;">
			<span>餐厅简介</span><br>
			<div style="font-size: 10px;width: 250px;overflow: hidden;text-overflow: ellipsis;font-family: fangsong;"><%=rest.getIntroduction() %></div>
		</div>
	</div>
	
	<div class="container" style="margin-top:210px;">
		<div style="background-color:#fff;border:1px solid #e6e6e6;width:73%;float:left">
		<%
		int row = foods.size() % 2 == 0 ? foods.size() / 2 : foods.size() / 2 + 1;
		int foodCount = foods.size();
		for(int i = 0; i < row; i++)
		{
		%>
		<div class="row">
		<%
			for(int j = 0; j < 2; j++)
			{
				if(2 * i + j >= foodCount)
					break;
				Food f = foods.get(2 * i + j);
		%>
			<div class="col-md-6">
				<div style="border: 1px solid #e6e6e6;margin: 5px 5px;padding: 10px;border-radius: 5px;">
					<img src="<%=request.getContextPath() %>/images/food/<%=f.getFoodImgPath() %>" width="80" height="80"/>
					<div style="display:inline-block;vertical-align:top;padding:0px 20px">
						<span style="font-size: 20px;;vertical-align: top;"><%=f.getFoodName() %></span>
						<input type="hidden" value="<%=f.getFoodID() %>">
						<div style="padding-top:5px">月售23单</div>
						<div style="padding-top:5px">¥<%=f.getFoodPrice() %></div>
					</div>
					<div style="float:right">
					<div class="input-group input-group-sm" style="width:90px">
						<span class="input-group-btn"><button class="btn btn-default" onclick="minusItem(this)">-</button></span>
						<input id="foodCount" type="text" style="text-align:center;" class="form-control" value="0"/>
						<span class="input-group-btn"><button class="btn btn-default" onclick="addItem(this)">+</button></span>
					</div>
					</div>
					<button class="btn btn-info" style="position:absolute;right:25px;bottom: 15px;border-radius: 20px;" onclick="addToCart(this)">加入购物车</button>
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
		<div style="background-color:#fff;border:1px solid #e6e6e6;width:25%;float:right;">
			<div style="background-color:#0089dc;color:white;font-size:25px;text-align:center">
			商家公告
			</div>
			<div style="padding:5px 10px;line-height:2em">
				本餐厅营业时间：<br>上午7:00-13:00 下午：16:00-21:00<br>喜迎端午，一荤三素7.5
			</div>
		</div>
	
	</div>
	<!-- Content -->
	
	
	<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script> 
	</body>
 </html>