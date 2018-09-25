package com.cc.servlet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cc.javabean.User;
import com.cc.service.LoginService;
import com.cc.service.RegisteService;


@WebServlet("/RegisteServlet")
public class RegisteServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

    public RegisteServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		User user=new User();
		RegisteService rd=new RegisteService();
		user.setName(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user.setEmail(request.getParameter("email"));
		try {
			int rows=rd.insertUser(user);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("sys/login/login.jsp");
		
		}
	
	
}
