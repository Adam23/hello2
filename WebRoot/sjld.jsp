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
	 <script type="text/javascript">
	 	function getXMLHttpRequest(){
	 		
			var request;
			if(window.XMLHttpRequest){//火狐 或 w3c标准
				request = new XMLHttpRequest();
			}else if (window.ActiveXObject) {//IE5 IE6 等
				request = new ActiveXObject("Msxml2.XMLHTTP");
			}
			return request;
	 	}
	 	function sendRequest(url,success){
	 		//1创建XMLHttpRequest对象
    		var request = getXMLHttpRequest();
    		
			//2使用XMLHttpRequest对象创建请求
			//request.open("GET", "/hello2/cascade");
			request.open("POST" , url , true);
			
    		//3使用send发送请求
			request.send(null);
    		
			//4写回调函数处理服务器返回的数据
			request.onreadystatechange = function(){
				if(request.readyState==4){//状态4代表服务器返回响应
					if(request.status==200){
						success(request.responseText.trim());
					}else if(request.status==404){
						alert("URL未找到");
					}else if(request.status==500){
						alert("服务器内部错误");
					}
					var result = request.responseText;  //得到服务器端返回的数据
					document.getElementById("text").innerHTML=result;  //局部刷新
				}
			};
	 	}
	 	
    	window.onload = function(){
    		var sePro = document.getElementById("province");
    		var seCit = document.getElementById("city");
    		var seCou = document.getElementById("country");
    		
    		sendRequest("/hello2/cascade", function(data){
    			var pro = data.split(",");
				for(var i=0;i<pro.length;i++){
					var key = pro[i].split(":")[0];
					var val = pro[i].split(":")[1];
					console.info(key+":"+val);
					sePro.options.add(new Option(val,key));
				}
    		});
    		
    		sePro.onchange=function(){
    			if(this.value!=-1){
    				sendRequest("/hello2/cascade?method=findCityByProvinceId&provinceId="+this.value, function(data){
            			var city = data.split(",");
            			seCit.length=1;
            			seCou.length=1;
        				for(var i=0;i<city.length;i++){
        					var key = city[i].split(":")[0];
        					var val = city[i].split(":")[1];
        					console.info(key+"=="+val);
        					seCit.options.add(new Option(val,key));
        				}
            		});
    			}
    		};
    		seCit.onchange=function(){
    			if(this.value!=-1){
    				var provinceId = sePro.value;
        			var cityId = this.value;
        			sendRequest("/hello2/cascade?method=findCounByCityId&provinceId="+provinceId+"&cityId="+cityId, function(data){
            			var coun = data.split(",");
            			seCou.length=1;
        				for(var i=0;i<coun.length;i++){
        					var key = coun[i].split(":")[0];
        					var val = coun[i].split(":")[1];
        					console.info(key+"=="+val);
        					seCou.options.add(new Option(val,key));
        				}
            		});
    			}
    		};
    	};
    	
    	
    	
    	
    	
    	
    </script>
  </head>
  
  <body>
    <span id="spProvince">省份</span>
    <select id="province">
    	<option  value = "-1" selected>请选择</option>
    </select>
    <span id="spCity">城市</span>
    <select id="city">
    	<option  value = "-1" selected>请选择</option>
    </select>
    <span id="spCountry">区县</span>
    <select id="country">
    	<option  value = "-1" selected>请选择</option>
    </select>
    <br>
    <div id="text"></div>
   
  </body>
</html>
