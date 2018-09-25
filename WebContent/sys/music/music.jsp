<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.cc.javabean.Music" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="css/css/bootstrap.min.css"/>
		<link href="//netdna.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
		<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css">

    	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    	<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
   		 <script src="https://cdn.bootcss.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
		<title></title>
		<style type="text/css">
			body{
			
				color: dimgrey;

			}
			#centern{
			padding-top:0px;
			}
			.container{
				width: 700px;
			}
			#container{
			}
			
			
			#top{
				height: 300px;
				margin-top: 50px;
				background: gray;
				color: #fff;
				text-align: center;
				line-height: 300px;
			}
			
			.searchbar{
				border: 2px solid gray;
				width: 222px;
				margin: 20px 0 20px auto;
				border-radius: 5px 20px 20px 5px;
			}
			.searchbar input{
				display: inline;
				height: 30px;
				border-width: 0;
				border-radius:5px 0 0 5px;
				color: gray;
				outline: none;
				font-size: 16px;
			}
			.searchbar input:focus .searchbar{
				border: 1px solid #00BFFF;
			}
			.searchbar i:hover{
				cursor: pointer;
			}
			
			
			.musicbar{
				background: black;
				color: #d6d6d6;
				font-size: 18px;
			}
			.musicbar > td{
				border-right: 2px solid #fff;
			}
			.musicbar > td:hover{
				color: #fff;
			}
			
			.musicItem{
				border-width: 2px;
			}
			.musicItem:hover{
				border: 2px solid #5BC0DE;
			}
			.musicItem > td{
				border-right: 1px solid #F2DEDE;
			}
			
			.mid{
				display: none;
			}
			
			
			.addtag{
				display:flex;
				visibility: hidden;
				height: 20px;
			}
			.addtag:hover{
				cursor: pointer;
			}
			.addtag:before,
			.addtag:after{
				display: inline-block;
				position: relative;
				visibility: visible;
				width: 6px;
				height: 4px;
				content: "";
				top: 6px;
				background: gray;
			}
			.addtag > i{
				display: inline-block;
				visibility: visible;
				width: 4px;
				height: 16px;
				background: gray;
			}
			
			
			
			
			#addmenu{
				position: fixed;
				visibility: hidden;
				width: 700px;
				height: 600px;
				background: #80808045;
				top:0;
				left: 0;
			}
			#addmenu > div{
				width: 350px;
				border: 2px solid gray;
				padding: 5px 10px;
				background: #fff;
				border-radius: 5px;
				margin: 200px auto;
			}
			.menuclose{
				width: 35px;
				height: 25px;
				border-radius: 3px;
				margin: 7px 7px auto auto;
				background: #fff;
				text-align: center;
				line-height: 25px;
				font-size: 12px;
			}
			.menuclose:hover{
				border: 1px solid gray;
			}
			
			
			
			#files{
				border-top: 1px solid gray;
				margin-top: 5px;
				padding-top: 10px;
			}
			#files ul{
				position: relative;
				width: 60%;
				left: 20%;
			}
			#files li{
				border-width: 2px;
				margin-top: 10px;
				border-radius: 5px;
				text-align: center;
			}
			#files li:hover{
				border: 2px solid #00BFFF
			}
			
			
			#createfile{
				border-top: 1px solid gray;
				margin-top: 10px;
				margin-buttom: 5px;
				padding-top: 5px;
				padding-bottom: 5px;
			}
			#createfile > input{
				width: 180px;
				height: 33px;
				border-radius: 4px;
				border: 1px solid #d6d6d6;
				margin-left: 52px;
				margin-right: 11px;
				background: #fbfbfb;
			}
			#createfile > input:focus{
				border-color: #00BFFF;
			}
			#createfile > button{
				width: 50px;
				height: 30px;
				border-radius: 5px;
				border-width: 1px;
				border-color: #fff;
				margin-left: 10px;
				margin-right: auto;
				background: #fff;
			}
			#createfile > button:hover{
				border-color: #00BFFF;
			}
			
			
			.popupWindow{
				visibility: hidden;
				position: absolute;
				width: 50%;
				border: 2px solid gray;
				border-radius: 5px;
				left: 50%;
				top: 50%;
				transform: translate(-50%, -50%);
				background: #fff;
			}
			.popupWindow > label{
				display: inline-block;
				position: relative;
				width: 70px;
				height: 30px;
				left: 50%;
				transform: translate(-50%);
				text-align: center;
				line-height: 30px;
			}
			.popupWindow > div{
				float: right;
				display: inline-block;
				width: 20px;
				height:20px;
				border: 1px solid gray;
				border-radius: 5px;
				margin: 5px 5px;
				color: gray;
				text-align: center;
				line-height: 20px;
				font-size: 16px;
			}
			.popupWindow > div:hover{
				cursor: pointer;
			}
			#showbox{
            width: 50%;
            height: 20%;
            border-radius: 10px;
            margin-top:0;
            margin: 0 auto;
            box-shadow: 10px 10px 5px #b9bbbe;

        }
        .carousel-inner img {
            border-radius: 10px;
            width: 100%;
            height: 100%;
        }
        
        #addmusic{
          width: 17%;
    		float: left;
    		margin-left: 0;
   			font-size: 14px;
   		 	color: #fff;
    		background: #00b4ef;
    		border-radius: 13px;
    		padding: 10px 25px;
    		border: none;
    		text-transform: capitalize;
    		transition: all 0.5s ease 0s;
        }
        #addmusic:hover{
        	background: #FF3333 ;
        }
        
        #centern {
        padding-top=0;
        }
        
       	 #page{
       	margin-right:19%;
       	}
       	
       	#add:hover{
       	cursor:pointer;
       		color:red;
       	}
		</style>
	</head>
	
	<body>
		<div class="container-fluid" id="container">
			<div id="showbox" class="carousel slide" data-ride="carousel">

    <!-- 指示符 -->
    <ul class="carousel-indicators">
        <li data-target="#showbox" data-slide-to="0" class="active"></li>
        <li data-target="#showbox" data-slide-to="1"></li>
        <li data-target="#showbox" data-slide-to="2"></li>
    </ul>

    <!-- 轮播图片 -->
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="sys/img/04.jpg">

        </div>
        <div class="carousel-item">
            <img src="sys/img/05.jpg">

        </div>
        <div class="carousel-item">
            <img src="sys/img/06.jpg">

        </div>
    </div>

    <!-- 左右切换按钮 -->
    <a class="carousel-control-prev" href="#showbox" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </a>
    <a class="carousel-control-next" href="#showbox" data-slide="next">
        <span class="carousel-control-next-icon"></span>
    </a>
</div>
			<div id="centern" class="col-md-8 col-md-offset-2">
				<!-- 音乐搜索栏 -->
				<div class="searchbar">
					<input value="" placeholder="音乐查找"/>
					<i class="fa fa-search" aria-hidden="true" onclick="searchMusic(this)"></i>
				</div>
				<table class="table table-striped" style="border: 1px solid #cccccc;-webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px">
					<thead style=>
						<tr class="musicbar" style="text-align: center;">
							<td>专辑</td>
							<td>音乐名</td>
							<td>歌手</td>
							<td>操作</td>
							<td> 添加到歌单   </td>
						</tr>
						<tr style="height: 10px;"></tr>
					</thead>
					<body>
					<form action="MusicServlet?flag=add1&type3=default" method="post" >
						<% List<Music> list = (List<Music>)request.getAttribute("list") ;%> 
						<% for(Music music:list){ %>
						
						<tr style="text-align: center;">
							<td><img src="sys/music/show.jsp?photo_no=<%=music.getId() %>" width="70px" height="50px"></td>
							<td><a href="<%=music.getSrc()%>" target="_blank" id="<%=music.getSrc()%>"><%=music.getMusic() %></a></td>
							<td><%=music.getSinger()%></td>
							<td><input type="checkbox" name="musicname" value="<%=music.getMusic() %>" onclick="inputclick(this)">
								<input type="checkbox" name="src" value="<%=music.getSrc()%>"  style="display:none" >
							</td>
							<td><a id= "add"  onclick="openAddMenu(this)"  >添加</a></td>
							<input type="hidden" name="src" value="<%=music.getSrc()%>">
							<!--  <td><a class="addtag" href="MusicServlet?flag=add&music=<%=music.getMusic() %>">添加</a></i></div></td>-->
						</tr>
						<% 	} %>
						<button type="submit" id="addmusic">一键添加</button>
						</form>
				</table>
			</div>
		</div>
		
		<div class="inline pull-right page" id = "page">
         <%=request.getAttribute("rows") %>条记录 <%=request.getAttribute("page") %>/<%=request.getAttribute("pageNum") %> 页  
         <%int prevPage = (int)request.getAttribute("page")-1; %>
         <%int nextPage = (int)request.getAttribute("page")+1; %>
         <a href="MusicServlet?flag=queryByPage&page=<%=prevPage%>">上一页</a>     
         <%for(int i=1;i<=(int)request.getAttribute("pageNum");i++){ %>
         	<%if(i==(int)request.getAttribute("page")){ %>
         		<span class='current'><%=i %></span>
         	<%}else{ %>
         		<a href="MusicServlet?flag=queryByPage&page=<%=i%>"><%=i %></a>
         	<%} %>
         <%} %>  
         <a href="MusicServlet?flag=queryByPage&page=<%=nextPage%>">下一页</a> 
         <a href="MusicServlet?flag=queryByPage&page=<%=request.getAttribute("pageNum")%>">最后一页</a>    
    </div>
		
		<div id="addmenu">
			<div>
			<%List<String> List =(List<String>)request.getAttribute("typelist"); %>
				
				
				<form action="MusicServlet?flag=add2" method="post">
				<div class="menuclose" onclick="closeAddMenu()">关闭</div>
				<div id="files">
					
					
					歌曲名：<input type="text"  name="musicname" value="" ><br>
					<input type="hidden"  name="src" value="">
					请选择歌单：<br>
				<% for(String string : List) {%>
					<input type="radio" value="<%=string%>" name="type1"><%=string %><br>
					
				<% } %>
					
					
				</div>
				<input type="submit" value="确认">
				</form>
				<div id="createfile">
				<form action="MusicServlet?flag=createType" method="post">
					
					<input type="text" name="type2" placeholder="请输入需要创建的歌单名"/>
					<input type="submit" value="确定" >
					</form>
				</div>
			</div>
		</div>
		
		
		<!--音乐搜索结果展示-->
		<div class="popupWindow">
			<label>音乐信息</label>
			<div onclick="closeSearchMusic(this)">X</div>
			<table id="searchMusic" class="table table-striped">
				<thead>
					<tr>
						<td>音乐名</td>
						<td>音乐ID</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><a target="_blank"></a></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
		
	</body>
	
</html>

<script type="text/javascript">

function inputclick(e)
{	
	console.log(e.checked + "aaaaaaaaaaaa");
	if(e.checked==true)
				{
				console.log("sdsdsds");
				 var check =e.parentNode.getElementsByTagName("input")[1];
				 
				 check.cheked=true;
				 console.log(check.cheked);
				}
}
	function openAddMenu(e){
		var musicname = e.parentNode.parentNode.getElementsByTagName("td")[3].getElementsByTagName("input")[0].value;
		var musicinput = document.getElementById("files").getElementsByTagName("input")[0];
		musicinput.value = musicname;
		var src =e.parentNode.parentNode.getElementsByTagName("td")[1].getElementsByTagName("a")[0].href;
		var inputsrc =document.getElementById("files").getElementsByTagName("input")[1];
		inputsrc.value=src;
		console.log(inputsrc);
		var addmenu = document.getElementById("addmenu");
		addmenu.style.width = document.body.clientWidth + "px";
		addmenu.style.height = window.screen.availHeight + "px";
		addmenu.style.visibility = "visible";
		
		
	}
	
	function closeAddMenu(){
		var addmenu = document.getElementById("addmenu");
		addmenu.style.visibility = "hidden";
	}
	
	function initializeFolder(){
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "url", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send();
		
		xhr.onreadystatechange = function(){
			if(xhr.status == 200 && xhr.readyState == 4){
				var content = xhr.responseText;
				if(content){
					createFolder(content);
				}else{
					alert("数据获取失败");
					closeAddMenu();
				}
			}
		}
	}
	
	
	function addMusicData(){
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "url", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send("填写条件");
		
		xhr.onreadystatechange = function(){
			if(xhr.status == 200 && xhr.readyState == 4){
				var content = xhr.responseText;
				if(content){
					addElementFromXML(content);
				}else{
					alert("数据获取失败");
				}
			}
		}
	}
	
	function addElementFromXML(xmlstr){
		var parent = document.getElementById("musicdata");
		var elems = new DOMParser().parseFromString(xmlstr, "text/xml");
		
		elems = elems.getElementsByTagName("tr");
		for(var i = 0, elem1; elem1 = elems[i]; ++i){
			var tem;
			var tr = document.createElement("tr");
			
			tr.className = "musicItem";
			
			elem1 = elem1.getElementsByTagName("td");
			for(var j = 0, elem2; elem2 = elem1[j]; ++j){
				var td = document.createElement("td");
				td.innerText = elem2.textContent;
				tr.appendChild(td);
			}
			elem1[elem1.length - 1].className = "mid";
			
			elem1 = document.createElement("td");
			tr.appendChild(elem1);
			
			tem = document.createElement("div");
			elem1.appendChild(tem);
			elem1 = document.createElement("i");
			tem.appendChild(elem1);
			tem.className = "addtag";
			tem.onclick = openAddMenu;
			
			parent.appendChild(tr);
		}
	}
	
	
	/**
	 * 音乐搜索函数
	 * @param {Object} e
	 */
	function searchMusic(e){
		var value = e.parentNode.getElementsByTagName("input")[0].value;
		var xhr = new XMLHttpRequest();
		console.log(value);
		xhr.open("POST", "MusicServlet?flag=search", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send("musicname=" + value);
		
		xhr.onreadystatechange = function(){
			if(xhr.status == 200 && xhr.readyState == 4){
				
				var content = JSON.parse(xhr.responseText);
				console.log(content);
				var parent;
				var searchMusic = document.getElementById("searchMusic");
				parent = searchMusic.parentNode;
				searchMusic = searchMusic.getElementsByTagName("tbody")[0].getElementsByTagName("tr")[0].getElementsByTagName("td");
				
	
				if(content[0]){
					var a = searchMusic[0].getElementsByTagName("a")[0];
					a.innerText = content[0].music;
					
					a.setAttribute("href",content[0].src);
					searchMusic[1].innerText = content[0].id;
					
					parent.style.visibility = "visible";
				}else{
					alert("音乐没找到");
				}
			}
		}
	}
	 
	function closeSearchMusic(e){
		e.parentNode.style.visibility = 'hidden';
	}
	
</script>
