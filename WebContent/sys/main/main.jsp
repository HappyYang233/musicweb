
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link href="../../css/css/bootstrap.min.css" rel="stylesheet"/>
		
		<link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
		
	<style type="text/css">
			body{
				backface-visibility:hidden;
				background:#fff;
				color: #41B733;

			}


			/********* nav *******
            ***/
			.fixed{
				position: fixed;
				background: #3e3e3e;
				z-index: 100;
				left: 0px;
				top: 40px;
				padding: 0 0px;
				border-radius:  0px;
				border: none;


			}

			#userMessage > img{
				display: block;
				width: 80px;
				height: 80px;
				border:3px solid #31B0D;
				border-radius: 50px;
				margin: 15px auto;
			}

			#userMessage > div{
				width: 100px;
				height: 36px;
				border:none;
				border-radius: 0px;
				margin: 0 auto 10px auto;
				text-align: center;
				line-height: 30px;
			}



			/*** userMessage 的兄弟div"**/
			#userMessage + div{
				margin: 100px auto;
			}
			input[id="daohang"] {
				display:none;
			}

			input[id="daohang"] + label {
				position: fixed;
				left:0px;
				top:0px;
				z-index: 100;
				display:block;
				width:40px;
				height:40px;
				background:#3e3e3e;
				cursor:pointer;
				font-size:30px;
				color:#fff;
			}

			input[id="daohang"] + label span {
				display:block;
				position:absolute;
				left:8px;
				transition:.2s;
			}

			input[id="daohang"]:checked + label span {
				transform:rotate(180deg);
				font-size:34px;
				top:-2px;
				left:9px;
			}

			nav a {
				display:block;
				height:40px;
				line-height:40px;
				background:#3e3e3e;
				width:100px;
				padding-left:10px;
				text-decoration:none;
				color:white;
				box-shadow:5px 0 0 #000;
			}

			input[id="daohang"] ~ nav a:nth-child(1) { box-shadow:5px 0 0 #3498db; transition-delay:.05s; text-decoration: none}/*规定nav子元素的颜色过渡时间*/
			input[id="daohang"] ~ nav a:nth-child(2) { box-shadow:5px 0 0 #2ecc71; transition-delay:.10s; text-decoration: none}
			input[id="daohang"] ~ nav a:nth-child(3) { box-shadow:5px 0 0 #e67e22; transition-delay:.15s; text-decoration: none}
			input[id="daohang"] ~ nav a:nth-child(4) { box-shadow:5px 0 0 #c0392b; transition-delay:.20s; text-decoration: none}
			input[id="daohang"] ~ nav a:nth-child(5) { box-shadow:5px 0 0 #2c3e50; transition-delay:.25s; text-decoration: none}
			input[id="daohang"] ~ nav a:nth-child(6) { box-shadow:5px 0 0 #9999FF; transition-delay:.30s; text-decoration: none}
			

			input[id="daohang"]:checked ~ nav{
				margin-left:0px;
			}
			input[id="daohang"] ~ nav {
				margin-left:-110px;
				transition:.6s margin;
			}

			input[id="daohang"]:checked ~ nav a {
				margin-left:0px;
			}

			input[id="daohang"]:checked ~ nav a:hover {
				width:100px;
			}


			input[id="daohang"] ~ nav a {
				margin-left:-110px;
				transition:.6s margin;
			}

			input[id="daohang"] ~ nav a:hover {
				background:#999;
			}


			/***
            ********* nav *******/




			/******** 顶部退出栏 ****
            ***/
			#top > div{
				float: right;
				position: relative;
				width: 70px;
				height: 35px;
				right: 16px;
				top: 8px;
				border-radius: 5px;
				line-height: 35px;
				background: #fff;
				text-align: center;
			}

			#top >div:hover{
				background: gray;
				color: white
			}
			/***
            ******** 顶部退出栏 ****/


			/******* 内容栏  ************
            ***/
			/**** 内容栏外边距  ****/
			#centern{
				width: inherit;
				padding-top: 15px;
				padding-bottom: 15px;
				margin-bottom: 15px;
			}

			/***内部窗体**/
			#myFrame{
				width: 100%;
				border-radius: 5px;
				border-width: 0;
				background: gray;
			}
			/***
            ******* 内容栏  ************/
		</style>
	</head>
	<body>

	<!--导航栏-->
	<nav>
			<input type="checkbox" id="daohang" checked/>
			<label for="daohang"><span><i class="fa fa-arrow-left"></i></span></label>
		<nav class="fixed">				
			<nav>
				<div id="userMessage">					
					<img style="" src="sys/main/touxiang.jpg" width="100px"/>
					<div>欢迎您</div>
					<div id = "userName">${userName}</div></lable>
				</div>
				<a herf="#"></a>
				<a target="nameIframe" href="MusicServlet?flag=queryByPage" onclick="">音乐库</a>
				<a target="nameIframe" href="sys/user/userEdit.jsp" onclick="">用户信息修改</a>
				<a target="nameIframe" href="UserServlet?flag=queryType">我的歌曲</a>
				<a href="LoginoutServlet" title="退出系统" class="dl-log-quit">退出x</a>

			</nav>

		</nav>
	</nav>
		
		<!--内容栏-->
		<div class="container-fluid">
			<div id="centern" class="row">
				<div class="col-lg-12">
					<iframe id="myFrame" style="z-index: 0;" name="nameIframe" href="">
					</iframe>
				</div>
			</div>
		</div>
	</body>
</html>

<script type="text/javascript">
	/**
	 * globle vary
	 */
	var buttonchosed;


	function initialize(){
		var myFrame = document.getElementById("myFrame");
		myFrame.onload = alterIframe;
		myFrame.src = "MusicServlet?flag=queryByPage";
	}
	
	function changeButtonLook(o){
		if(buttonchosed){
			buttonchosed.style.background = "#fff";
			buttonchosed.style.color = "#41B733";
			buttonchosed.onmouseover = function(){
				buttonchosed.style.background = "gray";
				buttonchosed.style.color = "#fff";
			}
		}
		
		o.style.background = "gray";
		o.style.color = "#fff";
		buttonchosed = o;
	}
	
	function loginQuit(){
		var user = document.getElementById("userMessage").getElementsByTagName("div")[0];
		var xhr = new XMLHttpRequest();
		
		xhr.open("POST", "url", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send("account=" + user.innerText);
		
		window.location.href = "url";
	}
	
	function alterIframe(){
		var myFrame = document.getElementById("myFrame");
		var doc = myFrame.contentWindow.document;
		var height = doc.documentElement.scrollHeight;
		
		
		
		doc.parentDocument = reflushUserMessage;
		
		
		
		if(height != myFrame.height){
			myFrame.height = height + 10;
		}
		
	}
	
	function iframeScaleChange(){
		var cendiv = document.getElementById("centern").getElementsByTagName("div");
		var fisrtdiv = cendiv[0];
		var lastdiv = cendiv[1];
		var bros = document.getElementById("myFrame").parentNode.getElementsByTagName("div");
		
		console.log(bros);
		if(bros[1].style.display == "block"){
			bros[1].style.display = "none";
			bros[0].style.display = "block";
			
			fisrtdiv.style.display = "block";
			fisrtdiv.classList.add("col-lg-2");
			
			lastdiv.classList.remove("col-lg-12");
			lastdiv.classList.add("col-lg-10");
		}else{
			bros[0].style.display = "none";
			bros[1].style.display = "block";
			
			fisrtdiv.style.display = "none";
			fisrtdiv.classList.remove("col-lg-2");
			
			lastdiv.classList.remove("col-lg-10");
			lastdiv.classList.add("col-lg-12");
		}
	}
	
	
	function reflushUserMessage(mes){

		//console.log(mes + "cccccc");
		var data = document.getElementById("userName");
		mes = new DOMParser().parseFromString(mes,"text/xml");
		console.log("fff");		
		console.log(mes);
	
		mes = mes.getElementsByTagName("name");//getElementsByName("name");
		
		
		console.log("sss");		
		console.log(mes);
		
		console.log(data.innerText);
		data.innerText = mes[0].textContent;
		
		//data[1].innerText = mes.getElementsByName("nickname").textContent;
	}
	
	
	initialize();
</script>
