<%@page import="com.RM.DAO.RestaurantDAO"%>
<%@page import="com.RM.Model.Restaurant"%>
<%@page import="com.RM.Model.Food"%>
<%@page import="com.RM.Model.OrderItem"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.RM.Model.PurchaseCart"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML>
 <html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
		<script type="text/javascript">
			var totalPrice;
			
			function checkItem(checkbox)
			{
				var checked = checkbox.checked;
				var foodID = checkbox.parentNode.parentNode.getElementsByTagName("input")[1].value;
				var ajaxRequest = new XMLHttpRequest();
				ajaxRequest.onreadystatechange = function()
				{
					if(ajaxRequest.readyState==4 && ajaxRequest.status==200)
					{
						var price = parseFloat(ajaxRequest.responseText);
						totalPrice.innerHTML = checked ? (parseFloat(totalPrice.innerHTML) + price).toFixed(1) : (parseFloat(totalPrice.innerHTML) - price).toFixed(1);
					}
				}
				ajaxRequest.open("POST", "<%=request.getContextPath() %>/PurchaseCartControl");
				ajaxRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
				var data = "operation=check&foodID=" + foodID;
				ajaxRequest.send(data);
			}
			
			function modifyCount(count,foodID,itemPrice)
			{
				var ajaxRequest = new XMLHttpRequest();
				ajaxRequest.onreadystatechange = function()
				{
					if(ajaxRequest.readyState==4 && ajaxRequest.status==200)
					{
						var price = ajaxRequest.responseText.split(',');
						itemPrice.innerHTML = price[0];
						if(parseFloat(price[0]) == 0)
							$(itemPrice.parentNode).fadeOut("fast", null);
						totalPrice.innerHTML = price[1];
					}
				};
				ajaxRequest.open("POST", "<%=request.getContextPath() %>/PurchaseCartControl");
				ajaxRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
				var data = "operation=modify&foodID=" + foodID +"&itemCount=" + count;
				ajaxRequest.send(data);
			}
			
			function deleteItem(row)
			{
				row = row.parentNode.parentNode;
				var table = row.parentNode;
				var foodID = row.getElementsByTagName("input")[1].value;
				var ajaxRequest = new XMLHttpRequest();
				ajaxRequest.onreadystatechange = function()
				{
					if(ajaxRequest.readyState==4 && ajaxRequest.status==200)
					{
						totalPrice.innerHTML = ajaxRequest.responseText;
						$(row).fadeOut("slow",function(){
							table.removeChild(row);	
								});
						
					}
				};
				ajaxRequest.open("POST", "<%=request.getContextPath() %>/PurchaseCartControl");
				ajaxRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
				var data = "operation=delete&foodID=" + foodID;
				ajaxRequest.send(data);
			}
		
			function addItem(button)
			{
				var foodID = button.parentNode.parentNode.parentNode.getElementsByTagName("input")[0].value;
				var input = button.parentNode.parentNode.getElementsByTagName("input")[0];
				if(input.value < 0)
					input.value = 0;
				else
					input.value++;
				itemPrice = button.parentNode.parentNode.parentNode.nextSibling.nextSibling;
				modifyCount(input.value, foodID, itemPrice);
			}
			
			function minusItem(button)
			{
				var foodID = button.parentNode.parentNode.parentNode.getElementsByTagName("input")[0].value;
				var input = button.parentNode.parentNode.getElementsByTagName("input")[0];
				if(input.value <= 0)
					input.value = 0;
				else
					input.value--;
				itemPrice = button.parentNode.parentNode.parentNode.nextSibling.nextSibling;
				modifyCount(input.value, foodID, itemPrice);
			}
		</script>
		<style>
			.itable>tbody>tr>td{
				vertical-align:middle;
			}
		</style>
		<title>安徽工业大学在线餐厅系统</title>
	</head>
	
	<body style="background-color:#f7f7f7;font-family:'Microsoft Yahei'" onload="totalPrice=document.getElementById('totalPrice')">
	<!-- Header -->
	<div class="navbar navbar-default" style="margin-bottom:0px;box-shadow:5px 5px 15px -10px">
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
	<!-- Header -->
	<!-- Content -->
	<%
	//拿到购物车内订单项
	PurchaseCart purchaseCart = (PurchaseCart)session.getAttribute("PurchaseCart");
	LinkedList<OrderItem> items = purchaseCart.GetItems();
	%>
	<div class="container" style="margin-top:20px;">
	<form action="<%=request.getContextPath() %>/OrderControl" method="POST">
		<div style="background-color:#fff;border:1px solid #e6e6e6;">
			<table class="table itable table-hover">
				<thead style="font-family:Youyuan;font-size:16px">
					<tr>
						<th></th>
						<th>商品</th>
						<th>所属餐厅</th>
						<th>单价</th>
						<th style="padding-left: 33px;">数量</th>
						<th>小计</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<%
				for(OrderItem item : items)
				{
					Food food = item.getFood();
					Restaurant rest = new Restaurant();
					rest.setAccount(food.getRestNumber());
					RestaurantDAO restDAO = new RestaurantDAO(rest);
					restDAO.Select();
				%>
					<tr>
						<td style="text-align:center"><input checked="true" onclick="checkItem(this)" type="checkbox" name="foods" value="<%=food.getFoodID() %>"></td>
						<td>
							<img class="img-circle" style="width:50px;height:50px" src="<%=request.getContextPath() %>/images/food/<%=food.getFoodImgPath() %>"/>
							<span style="font-size:18px"><%=food.getFoodName() %></span>
						</td>
						<td><%=rest.getName() %></td>
						<td>¥<%=food.getFoodPrice() %></td>
						<td style="text-align:center">
							<input id="foodID" type="hidden" value="<%=food.getFoodID() %>"/>
							<div class="input-group input-group-sm" style="width:90px">
								<span class="input-group-btn"><button class="btn btn-default" onclick="minusItem(this)">-</button></span>
								<input id="foodCount" type="text" style="text-align:center;" class="form-control" value="<%=item.getCount() %>"  name="foodCount"/>
								<span class="input-group-btn"><button class="btn btn-default" onclick="addItem(this)">+</button></span>
							</div>
						</td>
						<td><%=item.GetPrice() %></td>
						<td><button class="btn btn-warning" onclick="deleteItem(this)">删除</button></td>
					</tr>
				<%
				}
				%>
				</tbody>
			</table>
			</div>
			<div class="row" style="padding: 10px 0px;margin:30px 0px 0px 0px;background-color:#fff;border:1px solid #e6e6e6;">
				<div class="col-md-2 col-md-offset-8">
					<span style="padding-left:20px">总价:
						<span id="totalPrice" style="color:#e4393c;font-size:25px;"><%=purchaseCart.GetTotalPrice() %></sapn>
					</span>
				</div>
				<div class="col-md-2">
					<input type="submit" class="btn btn-danger" style="width:100%;" value="去结算">
				</div>
			</div>
			</form>
	</div>
	<!-- Content -->
	
	
	<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script> 
	</body>
 </html>