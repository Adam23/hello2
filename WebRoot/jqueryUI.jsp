<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>JqueryUI</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="jquery/jquery-ui-1.11.0/jquery-ui.min.css" >
<style type="text/css">
	#panle input,#panle select{
		width:90%;
	}
	.error{
		border : 1px dotted red;
	}
</style>
</head>
<body>
	<div class="container">
		<div id="panle">
			<form name = "frmUser" id = "frmUser" action = "adduserServlet"  method = "post">
				<ul>
					<li>
						<span>姓名</span>
						<input type="text" id="name" name="name" title="请输入中文名称！" />
					</li>
					<li>
						<span>性别</span>
						<select  id="sex" name="sex" title = "请选择性别">
							<option value="男" selected=selected >男</option>
							<option value="女" >女</option>
						</select>
					</li>
					<li>
						<span>籍贯</span>
						<input name = "txtNativeplace" id = "txtNativeplace" title = "输入关键字进行提示"/>
	  					<input name = "nativeplace" id = "nativeplace" type = "hidden" />
					</li>
					<li>
						<span>身份证</span>
						<input type="text" id="idcard" name="idcard" title = "请输入有效身份证号" />
					</li>
					<li>
						<span>生日</span>
						<input type="text" id="birthday" name="birthday"  readonly=readonly title = "请选择生日" />
					</li>
				</ul>
								
			</form>
		</div>
	</div>
	<script src="jquery/jquery-1.11.1.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="jquery/jquery-ui-1.11.0/jquery-ui.min.js"></script>
	<script type="text/javascript" src = "jquery/jquery-ui-1.11.0/jquery.ui.datepicker-zh-CN.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#panle").dialog({
				title: "用户注册",
				width: 400,
				height: 400,
				buttons: {
					"提交": function(){
						var inpName = $("#name");
						var inpSex = $("#sex");
						var inpNativeplace = $("#nativeplace");
						var inpIdcard = $("#idcard");
						var inpBirthday = $("#birthday");
						$("input , select").removeClass("error");
						if(inpName.val().trim().length==0){
							inpName.tooltip("open");
							inpName.addClass("error");
						}
						if(inpNativeplace.val().trim().length==0){
							inpNativeplace.tooltip("open");
							inpNativeplace.addClass("error");
						}
						if(inpIdcard.val().trim().length==0){
							inpIdcard.tooltip("open");
							inpIdcard.addClass("error");
						}
						if(inpBirthday.val().trim().length==0){
							inpBirthday.tooltip("open");
							inpBirthday.addClass("error");
						}
						
						if($("*.error").size()==0){
							$("#frmUser").submit();
						}
						
					},
					"重置": function(){
						$("#frmUser")[0].reset();
					}
				},
				position: {
					my: "center center",
					at: "center center"
				}
			});
			
			$("#txtNativeplace").autocomplete({
				source: "areaServlet",
				select: function(event, rec){
					console.info(rec);
					$("#nativeplace").val(rec.item.id);
				}
			});
			
			$("*[title]").tooltip({
				position: {
					my: "left top",
					at: "right+5 top-5"
				}
			});
			
			$("#birthday").datepicker();
		});
	</script>
	
</body>
</html>