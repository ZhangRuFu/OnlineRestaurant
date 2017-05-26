<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.RM.Model.*" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>安徽工业大学餐厅管理中心</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="keywords" content="AHUT, 餐厅管理" />
		<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
		<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
		<link href="css/flexslider.css" rel="stylesheet"  type="text/css" media="screen" />
		<link href="css/istyle.css" rel="stylesheet" type="text/css">
		<script type="application/x-javascript"> 
			addEventListener("load", 
				function() 
				{ 
					setTimeout(hideURLbar, 0); 
				}, false); 
			function hideURLbar()
			{
				window.scrollTo(0,1); 
			} 
		</script>
		<script src="js/jquery.min.js"></script>
		<script src="js/simpleCart.min.js"> </script>		
</head>
<body>
<!-- header -->
<div class="head-top"></div>
	<div class="header">
		<div class="container">
			<div class="logo">
				<a href="index.html"><img src="images/newlogo.png" class="img-responsive" alt=""></a>
			</div>
			<div class="header-left">
				<div class="head-nav">
					<span class="menu"> </span>
						<ul>
							<li class="active"><a href="index.html">主&nbsp&nbsp&nbsp&nbsp页</a></li>
							<li><a href=" resturants.html">餐&nbsp&nbsp&nbsp&nbsp厅</a></li>
							<li><a href=" contact.html">联系我们</a></li>
								<div class="clearfix"> </div>		
						</ul>
								<!-- script-for-nav -->
							<script>
								$( "span.menu" ).click(function() {
								  $( ".head-nav ul" ).slideToggle(300, function() {
									// Animation complete.
								  });
								});
							</script>
						<!-- script-for-nav --> 
					</div>
					<div class="header-right1">
					<div>
					<% 	
						User user = (User)session.getAttribute("User");
						if(user == null){
					%>
							<a class="linkButton" href="login.html">登录</a>
					<%
						}else
						{
							if(user instanceof Student)
							{
					%>
								<a class="linkButton" href="ordermeal/selectrestaurant.jsp">订餐</a>
					<%  
							}
							else if(user instanceof Restaurant)
							{
					%>
								<a class="linkButton" href="index.jsp">餐厅管理</a>
					<%  
							}
							else
							{
					%>
								<a class="linkButton" href="index.jsp">任务查询</a>
					<%
							}
						}
					%>
					</div>
					</div>
					<div class="clearfix"> </div>
				</div>
					<div class="clearfix"> </div>
			</div>
	</div>
<!-- header -->
<!-- banner -->
	<div class="banner" style="box-shadow:0px 10px 20px -10px inset">
		<div class="container">
		<div class="b_room"></div>
	</div>
	</div>
<!-- banner -->	
<!-- latis -->	
	<div class="latis">
		<div class="container">
		<div class="col-md-4 latis-left">
			<h3>山东杂粮饼</h3>
			<img src="images/4.jpg" class="img-responsive" alt="">
			<div class="special-info grid_1 simpleCart_shelfItem">
				<p>来自山东的神秘味道 </p>
				<div class="cur">
					<div class="cur-left">
						<div class="item_add"><span class="item_price"><a class="morebtn hvr-rectangle-in" href="#">Add to cart</a></span></div>
					</div>
					<div class="cur-right">
						<div class="item_add"><span class="item_price"><h6>only ¥6.00</h6></span></div>
					</div>
						<div class="clearfix"> </div>
				</div>
			</div>
		</div>
		<div class="col-md-4 latis-left">
			<h3>虾仁拌菜</h3>
			<img src="images/1.jpg" class="img-responsive" alt="">
			<div class="special-info grid_1 simpleCart_shelfItem">
				<p>夏日必选之凉菜 </p>
				<div class="cur">
					<div class="cur-left">
						<div class="item_add"><span class="item_price"><a class="morebtn hvr-rectangle-in" href="#">Add to cart</a></span></div>
					</div>
					<div class="cur-right">
						<div class="item_add"><span class="item_price"><h6>only ¥5.00</h6></span></div>
					</div>
						<div class="clearfix"> </div>
				</div>
			</div>
		</div>
		<div class="col-md-4 latis-left">
			<h3>法式早点</h3>
			<img src="images/3.jpg" class="img-responsive" alt="">
			<div class="special-info grid_1 simpleCart_shelfItem">
				<p>来自法国的异国美味 </p>
				<div class="cur">
					<div class="cur-left">
						<div class="item_add"><span class="item_price"><a class="morebtn hvr-rectangle-in" href="#">Add to cart</a></span></div>
					</div>
					<div class="cur-right">
						<div class="item_add"><span class="item_price"><h6>only ¥6.00</h6></span></div>
					</div>
						<div class="clearfix"> </div>
				</div>
			</div>
		</div>
			<div class="clearfix"> </div>
			
				
	</div>
	</div>
<!-- latis -->	
<!-- feature -->
<div class="feature">
		<div class="container">
			<div class="fle-xsel">
				<ul id="flexiselDemo3">
					<li>
							
									<img src="images/1p.jpg" class="img-responsive" alt="">		
								
					</li>
					<li>
							
									<img src="images/2p.jpg" class="img-responsive" alt="">		
								
					</li>			
					<li>
							
									<img src="images/3p.png" class="img-responsive" alt="">		
								
					</li>		
					<li>
							
									<img src="images/4p.jpg" class="img-responsive" alt="">		
								
									
					</li>
					<li>
							
									<img src="images/5p.jpg" class="img-responsive" alt="">		
								
					</li>
					<li>
							
									<img src="images/6p.jpg" class="img-responsive" alt="">		
								
					</li>
					<li>
							
									<img src="images/7p.jpg" class="img-responsive" alt="">		
								
					</li>
					<li>
							
									<img src="images/8p.jpg" class="img-responsive" alt="">		
								
					</li>
									
				</ul>
							
							 <script type="text/javascript">
								$(window).load(function() {
									
									$("#flexiselDemo3").flexisel({
										visibleItems: 8,
										animationSpeed: 1000,
										autoPlay: true,
										autoPlaySpeed: 3000,    		
										pauseOnHover: true,
										enableResponsiveBreakpoints: true,
										responsiveBreakpoints: { 
											portrait: { 
												changePoint:480,
												visibleItems: 2
											}, 
											landscape: { 
												changePoint:640,
												visibleItems: 3
											},
											tablet: { 
												changePoint:768,
												visibleItems: 3
											}
										}
									});
									
								});
								</script>
								<script type="text/javascript" src="js/jquery.flexisel.js"></script>
					<div class="clearfix"> </div>
				
			</div>
		</div>
	</div>
<!-- feature -->
<!-- magnust -->	
	<div class="magnust">
		<div class="container">
			<h3>热卖快餐</h3>
		<div class="col-md-4 magnust-top">
			
			<div class="magnust-left">
				<img src="images/9b.jpg" class="img-responsive" alt="">	
			</div>
			<div class="magnust-right">
				<h4><a href="#">糖醋里脊</a></h4>
				<p>经典传统名菜之一，以猪里脊肉为主材，配以面粉，淀粉，醋等作料，酸甜可口，让人食欲大开。在浙菜、鲁菜、川菜、淮扬菜、粤菜里均有此菜。</p>
				<a class="see" href="#">See More</a>
			</div>
				<div class="clearfix"> </div>
		</div>
		<div class="col-md-4 magnust-top">
			<div class="magnust-left">
				<img src="images/8b.jpg" class="img-responsive" alt="">	
			</div>
			<div class="magnust-right">
				<h4><a href="#">牛油果茶</a></h4>
				<p>牛油果的果实是一种营养价值很高的水果，含多种维生素、丰富的脂肪酸和蛋白质和高含量的钠、钾、镁、钙等元素，营养价值可与奶油媲美，甚至有“森林奶油”的美称</p>
				<a class="see" href="#">See More</a>
			</div>
				<div class="clearfix"> </div>
		</div>
		<div class="col-md-4 magnust-top">
			<div class="magnust-left">
				<img src="images/10b.jpg" class="img-responsive" alt="">	
			</div>
			<div class="magnust-right">
				<h4><a href="#">牛肉千层饼</a></h4>
				<p> 千层饼，又叫“瓤子饼”，是山东东平接山乡一带的传统名吃之一。层层相分，烙熟后，外黄里暄，酥软油润，热食不腻，凉吃不散口，且味道香美。</p>
				<a class="see" href="#">See More</a>
			</div>
				<div class="clearfix"> </div>
		</div>
			<div class="clearfix"> </div>
	</div>
	</div>
<!-- magnust -->	
<!-- footer-->
	<%@ include file="footer.html" %>
<!-- footer-->	
</body>
</html>