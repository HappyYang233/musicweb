
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link href="../../css/css/bootstrap.min.css" rel="stylesheet">
		<style type="text/css">
			.container{
				border: 2px solid gray;
				border-radius: 10px;
				padding: 70px;
				width: 500px;
				margin: 150px auto;
				background: #ffe00017;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<form class="form-horizontal" role="form">
	   			<div class="form-group">
	      			<label for="name" class="col-sm-2 control-label">昵称</label>
	     			 <div class="col-sm-10">
	         			<input id="name" type="text" class="form-control"
	            			placeholder="请输入昵称">
	      			</div>
	   			</div>
	   			<div class="form-group">
	      			<label for="password" class="col-sm-2 control-label">密码</label>
	     			 <div class="col-sm-10">
	     			    <input id="password" type="text" class="form-control"
	     			       placeholder="请输入密码">
	     			 </div>
	   			</div>
	   			<div class="form-group">
	      			<label for="email" class="col-sm-2 control-label">email</label>
	     			 <div class="col-sm-10">
	     			    <input id="email" type="text" class="form-control"
	     			       placeholder="请输入邮箱">
	     			 </div>
	   			</div>
	   			<div class="form-group">
	      			<div class="col-sm-offset-2 col-sm-10">
	       			  <button type="button" onclick="submitMessage()" class="btn btn-default">确定</button>
	      			</div>
	   			</div>
			</form>
		</div>
	</body>
</html>

<script type="text/javascript">
	
	
	function submitMessage(){
		var name = document.getElementById("name").value;
		var password = document.getElementById("password").value;
		var email = document.getElementById("email").value;
		var post;
		
		if(name){
			post = "name=" + name;
		}
		if(password){
			if(post){
				post += "&";
			}
			post = post + "password=" + password;
		}
		
		if(!post){
			alert("没有信息可提交");
		}else{
			var xhr = new XMLHttpRequest();
			//url = "UserServlet";
			xhr.open("POST", "../../UserEditServlet", true);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.send("flag=edit&name=" + name + "&password=" + password + "&email=" + email);
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){

					var content = xhr.responseText;
					if(content){
						window.parent.reflushUserMessage(content);
						alert("信息修改成功");
					}else{
						alert("信息修改失败");
					}
				}
			}
		}
	}
</script>
