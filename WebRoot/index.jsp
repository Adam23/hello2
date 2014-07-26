<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>第二个 java web 零碎</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" type="image/x-icon" href="favicon.ico" />  
	<link href="css/index.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
  </head>
  
  <body>
		<div class="navbar navbar-inverse navbar-static-top">
			<div class="container">
				<div class="navbar-header">
					<button class="navbar-toggle" data-target=".navbar-collapse"
						data-toggle="collapse" type="button">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" title="Home"> 
						<img src="img/github.png">
					</a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li>
							<a href="#">Get CentOS</a>
						</li>
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#"
								title="About CentOS"> About <b class="caret"></b> </a>
							<ul class="dropdown-menu">
								<li>
									<a href="#">About CentOS</a>
								</li>
								<li>
									<a href="#">FAQ</a>
								</li>
								<li>
									<a href="#">About SIGs</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="#">Help</a>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="container">
			<br><br>
			<ul>
				<li><span>2014-7-21：</span><a href="sjld.jsp">三级联动</a></li>
				<li><span>2014-7-22：</span><a href="jquery0722.jsp">Jquery初级</a></li>
				<li><span>2014-7-24：</span><a href="jqueryUI.jsp">JqueryUI和jqGrid</a></li>
			</ul>
    		
    	</div>
    
	    <div id="footer">
	        <div class="container text-center">
	          <p class="text-muted credit">© 2014 The Java web Project | <a href="/legal/">Adam</a></p>
	        </div>
	    </div>
    <script src="jquery/jquery-1.11.1.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
  </body>
</html>
