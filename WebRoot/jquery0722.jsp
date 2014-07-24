<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>jquery初级</title>
		<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
		<style type="text/css">
		.lblmouseover {
			cursor: pointer;
			border-bottom: 1px dotted blue;
			color: blue;
		}
		</style>
	</head>
	<body>
		<div class="container">
		<ul style="width: 30%;" class="pull-left list">
			<li>
				<div class="panel panel-default"  >
				<!-- Default panel contents -->
				<div class="panel-heading"><span class="glyphicon glyphicon-minus ">新闻</span></div>
				<!-- List group -->
				<ul class="list-group">
					<li class="list-group-item" type="international"><span class="glyphicon glyphicon-hand-right"></span>国内新闻</li>
					<li class="list-group-item" type="local"><span class="glyphicon glyphicon-hand-right"></span>国内新闻</li>
				</ul>
				</div>
			</li>
			
			<li>
				<div class="panel panel-default"  >
				<!-- Default panel contents -->
				<div class="panel-heading"><span class="glyphicon glyphicon-minus ">公司</span></div>
				<!-- List group -->
				<ul class="list-group">
					<li class="list-group-item"><span class="glyphicon glyphicon-hand-right"></span>YouTube</li>
					<li class="list-group-item"><span class="glyphicon glyphicon-hand-right"></span>Google</li>
					<li class="list-group-item"><span class="glyphicon glyphicon-hand-right"></span>starbucks</li>
					<li class="list-group-item"><span class="glyphicon glyphicon-hand-right"></span>amazon</li>
				</ul>
				</div>
			</li>
		
		</ul>
			
			<div class="panel  pull-right" style="width: 60%; height: 600px; border:1px solid #CCC;">
				<ul id="news_ul">
				</ul>
			</div>
		</div>
		
		
	<script src="jquery/jquery-1.11.1.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
		$(function(){
			//下拉收起
			$("div.panel-heading").bind("click",function(){
				var ulList = $(this).next("ul");
				var spPic = $(this).children("span");
				if(ulList.css("display")=="block"){
					ulList.hide(500);
					spPic.attr("class","glyphicon glyphicon-plus ");
				}else{
					ulList.show(300);
					spPic.attr("class","glyphicon glyphicon-minus ");
				}
			});
			
			//点击新闻<li>显示相应内容
			$("ul.list-group li").bind("click",function(){
				$("#news_ul").html("");
				$.ajax({
					url:"newsServlet",
					type:"post",
					data:{type:$(this).attr("type")},
					dataType:"JSON",
					success:function(data){
						console.info(data);
						for ( var i = 0; i < data.length; i++) {
							$("#news_ul").append("<li>"+data[i].title+"——"+data[i].time+"</li>");
						}
					}
				});
			});
			
		});
		
		$(function(){
			$("li.list-group-item").bind("mouseover" , function(){
				$(this).addClass("lblmouseover");
			});
			
			$("li.list-group-item").bind("mouseout" , function(){
				$(this).removeClass("lblmouseover");
			});
		});
	</script>
	</body>
</html>
