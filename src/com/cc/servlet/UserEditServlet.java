package com.cc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.cc.service.UserEditService;
import com.cc.javabean.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserEditServlet")
public class UserEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		UserEditService us = new UserEditService();
		String flag = request.getParameter("flag");
		
		if("edit".equals(flag)){
			//�жϽ��б༭
			User user = new User();
			int UserId =(int)request.getSession().getAttribute("id"); 
								
			String userName = request.getParameter("name");
			String password = request.getParameter("password");
			String  Mail = request.getParameter("email");
						
			user.setId(UserId);
			user.setName(userName);
			user.setPassword(password);
			user.setEmail(Mail);
			
			//����һ������ֵ����js�ж�
			int rows = us.updateUserById(user);//���ø��º���
			PrintWriter out = response.getWriter();
			out.print("<data><name>" + userName + "</name></data>");
			out.flush();
			out.close();
			
			//ˢ��session���û�����Ϣ
			// session.setAttribute("userName", user.getUserName());
			// session.setAttribute("email", user.getMail());
			
			
			
			}
		
	}

}
