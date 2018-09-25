<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登陆</title>
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/loginstyle.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

<%
Cookie[] cookies=request.getCookies();
if(cookies!=null){
	for(Cookie cookie:cookies){
		if("userName".equals(cookie.getName())){
			response.sendRedirect("../../LoginServlet");
		}
	}
}
%>


    <div class="container">
        <div class="row">
            <div class="col-md-offset-3 col-md-6">
                <div class="form-horizontal">
                <form class="form-horizontal1"method="post" action="../../LoginServlet?flag=login">
                    <span class="heading">用户登录</span>
                    <div class="form-group">
                        <input type="text" class="form-control" id="username" name="username" placeholder="姓名/电子邮件">
                        <i class="fa fa-user"></i>
                    </div>
                    <div class="form-group help">
                        <input type="password" class="form-control" name="password" id="password" placeholder="密码">
                        <i class="fa fa-lock"></i>
                    </div>
                    <div class="form-group">
                        <div class="main-checkbox">
                            <input type="checkbox" value="None" id="checkbox1" name="check" />
                            <label for="checkbox1"></label>
                        </div>
                        <span class="text">自动登陆</span>
                        <button type="submit" class="btn btn-default"style="">登 录</button>
                    </div>
                </form>
                    <div>
                    <button class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="width: 21%;margin-right: 40px"> 注 册</button>
                </div>
                    <!-- 模态框（Modal） -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-body">
                                <form class="form-horizontal"method="post" action="../../RegisteServlet">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <span class="heading">请填写注册信息</span>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="Rusername" name="username" placeholder="姓名">
                                        <i class="fa fa-user"></i>
                                    </div>
                                    <div class="form-group help">
                                        <input type="password" class="form-control" id="Rpassword" name= "password" placeholder="密码">
                                        <i class="fa fa-lock"></i>
                                    </div>
                                    <div class="form-group">
                                        <input type="email" class="form-control" id="email" name="email" placeholder="电子邮箱">
                                        <i class="fa fa-envelope-square" aria-hidden="true"></i>
                                    </div>
                                    <div class="form-group">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关  闭</button>
                                        <button type="submit" class="btn btn-default">确认注册</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>


</body>
</html>