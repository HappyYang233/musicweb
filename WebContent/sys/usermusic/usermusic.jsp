<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="com.cc.javabean.Music" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="WebContent/WEB-INF/lib/jQuery v3.3.1.js"></script>
<style type="text/css">

div{
	width: 40%;
    margin: auto;
    margin-top: 20px;
}
list-group{
	width: 100%;
}
list-group-item{
	width: 100%;  
}

.a{
	float: right;
}

.title{
	display: block;
	width: 80px;
	height: 35px;
	margin: auto;
	border-width: 0;
	text-align: center;
	line-height: 35px;
}
</style>
</head>
<body>
	<label class="title">所有歌单</label>
 	<%List<String> List =(List<String>)request.getAttribute("list"); %>
 	<% for(String string : List) {%>
<div id="<%=string %>" onclick="a(this)">
<label><%=string %></label>
</div>
   <% } %>
   
</body>
<script type="text/javascript">

	function a(e)
	{
		
		var child = e.getElementsByTagName("ol")[0];
		
		if(child){
			console.log(child + "aaaaaaaaa");
			e.removeChild(child);
			return;
		}
		
		
		var type =e.id;
		console.log(type);
		
		 var ajax = null;
         try{
             //如果IE5~IE12的话  
             ajax = new ActiveXObject("microsoft.xmlhttp");
         }catch(e1){
             try{
                 //如果是非IE的话
                 ajax = new XMLHttpRequest();
             }catch(e2){
                 alert("你的浏览器中不支持异步对象，请换浏览器");
             }
         }
         //NO2)准备发送请求
         ajax.open("POST","UserServlet?flag=queryByIdType&type="+type,true);
         ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
         
         //NO3)真正发送请求体的数据到服务器，如果请求体中无数据的话，就用null表示
         ajax.send(null);
         
         //-------------------------------------------------------------等待
     
         //NO4)AJAX异步对象不断监听服务器响应的状态0-1-2-3-【4】
         //一定要状态变化后，才可触发function(){}函数
         //如果状态永远是4-4-4-4-4，是不会触发function(){}函数的
         ajax.onreadystatechange = function(){
             //如果状态码为4的话
             if(ajax.readyState == 4){
                 //如果响应码为200的话
                 if(ajax.status == 200){
                  
                     var json=JSON.parse(ajax.responseText);
                     console.log(json);
                     var div=document.createElement("ol");
                     div.className="list-group";
                     for(var i in json )
                    	 {
						
                    	 if(json[i].music!=null)
                    	 { var para=document.createElement("li");//创建需要增加的元素节点
                    	 
                    	 //para.className = "list-group-item";
                    	 //var node=document.createTextNode(json[i].music);//创建文本节点
                    	// para.appendChild(node);//将文本节点增加至创建的元素中
                    	 var asrc=document.createElement("a");
                    	 var nodesrc=document.createTextNode(json[i].music);
                    	 asrc.appendChild(nodesrc);
                    		asrc.setAttribute("href",json[i].src);
                    		para.appendChild(asrc);
                    		asrc.setAttribute("target","_blank")
                    		
                    		 var a = document.createElement("a");
                    	    var node = document.createTextNode("删除");
                    	    	
                    	    a.appendChild(node);
                    	    a.setAttribute("class","a");
                    	   a.setAttribute("href","UserServlet?flag=del&type="+type+"&music="+json[i].music);
                    	/*var input = document.createElement("input");
                   		 input.value = "删除";
                   		 input.type="b";
                   		 
                    	 input.onclick = "deleteMusic(json[i].music,type)";*/
                    	 para.appendChild(a);
                    	
                    	 div.appendChild(para);
                    	 }
                    	 
                    	 
                    	 }
                     var element=document.getElementById(type);//获取父节点
                	 element.appendChild(div);
                	
                    
                 }
             }
         } 
		
	}
	
	/*function deleteMusic(music,type){
		var music;
		var type;
		
		var ajax = null;
        try{
            //如果IE5~IE12的话  
            ajax = new ActiveXObject("microsoft.xmlhttp");
        }catch(e1){
            try{
                //如果是非IE的话
                ajax = new XMLHttpRequest();
            }catch(e2){
                alert("你的浏览器中不支持异步对象，请换浏览器");
            }
        }
        //NO2)准备发送请求
        ajax.open("POST","UserServlet?flag=del&type="+type+"&music="+music,true);
        ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        
        //NO3)真正发送请求体的数据到服务器，如果请求体中无数据的话，就用null表示
        ajax.send(null);
        
        //-------------------------------------------------------------等待
    
        //NO4)AJAX异步对象不断监听服务器响应的状态0-1-2-3-【4】
        //一定要状态变化后，才可触发function(){}函数
        //如果状态永远是4-4-4-4-4，是不会触发function(){}函数的
        ajax.onreadystatechange = function(){
            //如果状态码为4的话
            if(ajax.readyState == 4){
                //如果响应码为200的话
                if(ajax.status == 200){
                	var a=ajax.responseText;
                	if(a==1){
                		alert("成功");
                	}
                	else{
                		alert("失败");
                	}
                	}
                	}
                }
	}*/

     
</script>
</html>
