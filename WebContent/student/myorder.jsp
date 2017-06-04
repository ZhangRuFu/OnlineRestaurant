<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML>
 <html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
		<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
		<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script> 
		<style>
			.itable>tbody>tr>td{
				vertical-align:middle;
			}
		</style>
		<script type="text/javascript">
		$(function () 
		{ 
			$('#subul').on('show.bs.collapse', function () {
				$('#navul span')[0].className = "glyphicon glyphicon-triangle-top";
			})
			$('#subul').on('hide.bs.collapse', function () {
				$('#navul span')[0].className = "glyphicon glyphicon-triangle-bottom";
			})
		});
		</script>
		<title>安徽工业大学在线餐厅系统</title>
	</head>
	
	<body style="background-color:#f7f7f7;font-family:'Microsoft Yahei'">
	<!-- Header -->
	<div style="box-shadow:5px 5px 15px -10px;height:60px">
		<img style="margin-left:80px;margin-top:5px" src="<%=request.getContextPath() %>/images/newlogo.png"/>
		<div style="display:inline-block;vertical-align:middle"><span style="border-left:1px solid"/><span style="margin-left:30px;font-size:30px;font-family:Youyuan">我的订单</span></div>
	</div>
	<!-- Header -->
	
	<!-- Content -->
	<div class="container" style="margin-top:20px;">
	
	<!-- Left-Navbar -->
	<div style="background-color:white;width:30%;display:inline-block;">
	<jsp:include page="leftnavbar.jsp">
		<jsp:param value="allorder" name="active"/>
	</jsp:include>
	</div>
	<!-- Left-Navbar -->
	
	<!-- Order -->
		<div style="height:900px;background-color:#fff;border:1px solid #e6e6e6;width:69%;display:inline-block;float:right">
			<!-- SubOrder -->
			<div class="row">
			<div class="col-md-6">
			<div style="border:2px dashed #eee; margin-top:15px;width:95%;margin:15px auto 50px auto;">
				<table class="table itable table-hover">
					<caption style="border-bottom: 2px solid #eee;padding-right: 20px;color: black;text-align: right;">中快餐饮</caption>
					<thead style="font-size:12px;color:#999">
						<tr>
							<th>商品</th>
							<th>单价</th>
							<th style="padding-left: 33px;">数量</th>
							<th>小计</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>香辣鸡肉卷</td>
							<td>¥6.50</td>
							<td style="text-align:center">2</td>
							<td>¥13.00</td>
						</tr>
						<tr>
							<td>红烧排骨</td>
							<td>¥12.00</td>
							<td style="text-align:center">2</td>
							<td>¥24.00</td>
						</tr>
					</tbody>
				</table>
				<div>
					<span style="padding-left:10px">配送费</span>
					<span style="display: inline-block;float: right;padding-right: 35px;">¥2.00</span>
				</div>
					<div style="padding-right:25px;text-align:end;margin-top:20px;font-size:20px;color:#f74342">
					¥12.00
				</div>
			</div>
			</div>
			</div>
			<!-- SubOrder -->
		</div>		
		<!-- Order -->
	</div>
	<!-- Content -->
	</body>
 </html>