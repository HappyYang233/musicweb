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
@WebServlet("/LoginoutServlet")
public class LoginoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginoutServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		session.removeAttribute("username");
		Cookie nameCookie=new Cookie("userName",null);
		Cookie pwdCookie=new Cookie("password",null);
		pwdCookie.setMaxAge(0);
		nameCookie.setMaxAge(0);
		pwdCookie.setPath("/");
		nameCookie.setPath("/");
		response.addCookie(pwdCookie);
		response.addCookie(nameCookie);
		response.sendRedirect("sys/login/login.jsp");
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		}
	}

