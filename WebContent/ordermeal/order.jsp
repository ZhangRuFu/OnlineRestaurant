<%@page import="com.RM.Model.Food"%>
<%@page import="com.RM.Model.OrderItem"%>
<%@page import="com.RM.Model.Order"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML>
 <html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
		<script type="text/javascript">
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
		<style>
			.itable>tbody>tr>td{
				vertical-align:middle;
			}
		</style>
		<title>安徽工业大学在线餐厅系统</title>
	</head>
	
	<body style="background-color:#f7f7f7;font-family:'Microsoft Yahei'">
	<!-- Header -->
	<div style="box-shadow:5px 5px 15px -10px;height:60px">
		<img style="margin-left:80px;margin-top:5px" src="<%=request.getContextPath() %>/images/newlogo.png"/>
		<div style="display:inline-block;vertical-align:middle"><span style="margin-left:30px;font-size:30px;font-family:Youyuan">订单信息</span></div>
	</div>
	<!-- Header -->
	
	<!-- Content -->
	<div class="container" style="margin-top:20px;">
	<!-- Order -->
		<div style="background-color:#fff;border:1px solid #e6e6e6;width:35%;display:inline-block">
			<div style="margin-top:10px;font-size:18px;padding-left:10px">
				订单详情
			</div>
	<!-- SubOrder -->
	<%
	Order order = (Order)session.getAttribute("Order");
	int restCount = order.GetRestCount();
	for(int i = 0; i < restCount; i++)
	{
		int orderItemCount = order.GetOrderItemCount(i);
		String restName = order.GetRestName(i);
		float restDeliveryCost = order.GetRestDeliveryCost(i);
		float restTotalPrice = order.GetRestPrice(i);
	%>
			<div style="border:2px dashed #eee; margin-top:15px;width:95%;margin:15px auto 50px auto;">
				<table class="table itable table-hover">
					<caption style="border-bottom: 2px solid #eee;padding-right: 20px;color: black;text-align: right;"><%=restName %></caption>
					<thead style="font-size:12px;color:#999">
						<tr>
							<th>商品</th>
							<th>单价</th>
							<th style="padding-left: 33px;">数量</th>
							<th>小计</th>
						</tr>
					</thead>
					<tbody>
	<%
		for(int j = 0; j < orderItemCount; j++)
		{
			OrderItem item = order.GetOrderItem(i, j);
			Food food = item.getFood();
	%>
			
						<tr>
							<td><%=food.getFoodName() %></td>
							<td><%=food.getFoodPrice() %></td>
							<td style="text-align:center"><%=item.getCount() %></td>
							<td>¥<%=item.GetPrice() %></td>
						</tr>
	<%
		}
	%>
					</tbody>
				</table>
				<div>
					<span style="padding-left:10px">配送费</span>
					<span style="display: inline-block;float: right;padding-right: 35px;">¥<%=restDeliveryCost %></span>
				</div>
					<div style="padding-right:25px;text-align:end;margin-top:20px;font-size:20px;color:#f74342">
					¥<%=restTotalPrice %>
				</div>
			</div>
	<%
	}
	%>
			<!-- SubOrder -->
			<div style="padding-right:25px;text-align:end;margin-top:35px;font-size:45px;color:#f74342">
				¥<%=order.GetTotalPrice() %>
			</div>
		</div>		
		<!-- Order -->
		
		<!-- OrderInfo -->
		<div class="container" style="border:1px solid #e6e6e6;width:64%;float:right;background-color:#fff">
			<div class="row" style="padding: 10px 0px;">
				<div class="col-md-4">
					<span style="font-size:20px;">收货地址</span>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<span>安徽省马鞍山市安徽工业大学东校区</span>
				</div>
			</div>
			<div class="row" style="padding: 30px 0px;">
				<div class="col-md-4">
					<span style="font-size:20px;">付款方式</span>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<span>现金支付</span>
				</div>
			</div>
			<div class="row" style="padding-top:30px">
				<div class="col-md-12">
					<span style="font-size:20px;">备注信息</span>
				</div>
			</div>
			<div class="row" style="padding-top:20px">
				<div class="col-md-12">
					<input type="text" class="form-control" placeholder="请填写备注信息"/>
				</div>
			</div>
			<div class="row" style="padding:50px 0px 30px 0px">
				<div class="col-md-3">
					<button style="width:100%" class="btn btn-danger">确认下单</button>
				</div>
			</div>
		</div>
		<!-- OrderInfo -->
	</div>
	<!-- Content -->
	
	
	<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script> 
	</body>
 </html>