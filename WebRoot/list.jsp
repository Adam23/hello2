<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'list.jsp' starting page</title>
<link rel="stylesheet" type="text/css" href="jquery/jquery-ui-1.11.0/jquery-ui.min.css" >
<link type="text/css" rel="stylesheet" href="css/ui.jqgrid.css">

<script src="jquery/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="jquery/jquery-ui-1.11.0/jquery-ui.min.js"></script>
	<script type="text/javascript" src = "jquery/jquery-ui-1.11.0/jquery.ui.datepicker-zh-CN.js"></script>
    <script type="text/javascript" src="jquery/jquery.jqGrid.src.js"></script>
    <script type="text/javascript" src="jquery/grid.locale-cn.js"></script>
    <script type="text/javascript">
    	$(function(){
    		$("#divPanel").dialog({
    			title : "用户列表",
    			width : 950,
    			height : 700
    		});
    		
    		$("#tabUserList").jqGrid({
    			width : 920,
    			height :400,
    			url : "userlist" , 
    			datatype : "json" ,
    			colNames :["姓名" , "性别" , "籍贯" , "身份证号" , "生日"] ,
    			colModel :[
    				{name : "name" , index : "name" , width:100},
    				{name : "sex" , index : "sex" , width:100},
    				{name : "txtNativeplace" , index : "txtNativeplace" , width:100},
    				{name : "idcard" , index : "idcard" , width:100},
    				{name : "birthday" , index : "birthday" , width:100}
    			],
    			pager : "#pager",
    			rowNum : 10,
    			rowList : [5,10,20,50,100]
    		});
    	});
    </script>
  </head>
  
  <body>
    <div id = "divPanel">
		<table id = "tabUserList"></table>
	</div>
	<div id = "pager"></div>
    
    
  </body>
</html>
