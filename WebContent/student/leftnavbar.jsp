<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%
   String active = request.getParameter("active");
   String str = "class='active'";
   String nullstr = "";
   %>
		<ul class="nav nav-pills nav-stacked">
			<li <%=(active.equals("address") ? str : nullstr) %> ><a href="##">外卖地址</a></li>
			<li id="navul" <%=(active.equals("allorder") ? str : nullstr) %> data-parent="navul" data-toggle="collapse" data-target="#subul"><a href="##">全部订单<span style="float:right" class="glyphicon glyphicon-triangle-bottom"></span></a></li>
				<ul style="padding-left:20px" id="subul" class="nav nav-pills nav-stacked collapse">
					<li <%=(active.equals("sucessedorder") ? str : nullstr) %>><a href="##">已完成订单</a></li>
					<li <%=(active.equals("unsucessedorder") ? str : nullstr) %>><a href="##">未完成订单</a></li>
				</ul>
			<li <%=(active.equals("purchase") ? str : nullstr) %>><a href="##">购物车</a></li>
		</ul>