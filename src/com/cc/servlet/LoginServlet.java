package com.cc.servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cc.javabean.User;
import com.cc.service.LoginService;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		doPost(request,response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		
		
		
		if(name==null&&password==null){
			
			Cookie[] cookies=request.getCookies();
			for(Cookie cookie:cookies){
				if("userName".equals(cookie.getName())){
						name=cookie.getValue();}
				if("password".equals(cookie.getName())){
					password=cookie.getValue();
				}
				
			}
		
		LoginService ls = new LoginService();
		User user = ls.Login(name, password);
		if(user.getName()!=null){
			//跳转有两种方式：1、请求转发，2、重定向
			HttpSession session=request.getSession();
			session.setAttribute("userName", user.getName());
			session.setAttribute("id", user.getId());
			session.setMaxInactiveInterval(30*60);
			System.out.println("new login");
			request.getRequestDispatcher("sys/main/main.jsp").forward(request, response);
			}
		else{
			System.out.println("new no login");
			response.sendRedirect("sys/login/login.jsp");
			
		}
		
		
		
		}
		
		else{
			
			
			LoginService ls = new LoginService();
			User user = ls.Login(name, password);
			if(user.getName()!=null){
			//跳转有两种方式：1、请求转发，2、重定向
				HttpSession session=request.getSession();
			session.setAttribute("userName", user.getName());
			session.setAttribute("id", user.getId());
			session.setMaxInactiveInterval(30*60);
			//将用户名和密码放入cookie
			Cookie nameCookie=new Cookie("userName",user.getName());
			Cookie pwdCookie=new Cookie("password",user.getPassword());
			//Cookie的 保存时间和可以被访问的范围
			nameCookie.setMaxAge(30*60);
			pwdCookie.setMaxAge(30*60);
			nameCookie.setPath("/");
			pwdCookie.setPath("/");
			response.addCookie(nameCookie);
			response.addCookie(pwdCookie);
			System.out.println("old login");
			request.getRequestDispatcher("sys/main/main.jsp")
				.forward(request, response);
		}
			else{
				
			
				response.sendRedirect("sys/login/login.jsp");
			}	
		}
	}

}
