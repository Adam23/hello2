<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>三级联动</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		select{
			width: 100px;
			height: 20px;
		}
		
	</style>
  </head>
  
  <body>
    <span id="spProvince">省份</span>
    <select id="province">
    	<option >请选择</option>
    </select>
    <span id="spCity">城市</span>
    <select id="city">
    	<option>请选择</option>
    </select>
    <span id="spCountry">区县</span>
    <select id="country">
    	<option>请选择</option>
    </select>
    <br>
    <div id="text"></div>
    <script type="text/javascript">
    	window.onload = function(){
    		var sePro = document.getElementById("province");
    		var seCit = document.getElementById("city");
    		var seCou = document.getElementById("country");
    		//A加载省份
    		
    		//1创建XMLHttpRequest对象
			var request;
			if(window.XMLHttpRequest){
				request = new XMLHttpRequest();
			}else if (window.ActiveXObject) {
				request = new ActiveXObject("Msxml2.XMLHTTP");
			}
			//2使用XMLHttpRequest对象创建请求
			request.open("get", "/cascade");
	
			//3监视request的状态，写回调函数处理服务器返回的数据
			request.onreadystatechange = function(){
				if(request.readyState==4){
					var result = request.responseText;  //得到服务器端返回的数据
					document.getElementById("text").innerHTML=result;  //局部刷新
				}
			};
    		//4使用XMLHttpRequest对象发送请求
			request.send(null);
    		
    		sePro.onchange = function(){
    			alert("1111111");
    		};
    	};
    </script>
  </body>
</html>
