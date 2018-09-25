package com.cc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cc.dao.UserDao;
import com.cc.javabean.Music;
import com.cc.service.UserService;
import com.google.gson.Gson;
/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String flag = request.getParameter("flag");
		UserService us= new UserService();
		if("queryType".equals(flag))
		{
			HttpSession session= request.getSession();
			int id=(int)session.getAttribute("id");
			List<String> list=us.querytype(id);
			request.setAttribute("list", list);
			request.getRequestDispatcher("sys/usermusic/usermusic.jsp").forward(request, response);
		}
		else if ("del".equals(flag))
		{
			
			String music = request.getParameter("music");
			HttpSession session= request.getSession();
			int id=(int)session.getAttribute("id");
			String type = request.getParameter("type");
			int rows =us.delMusic(music,id,type);
			List<String> list=us.querytype(id);
			request.setAttribute("list", list);
			request.getRequestDispatcher("sys/usermusic/usermusic.jsp").forward(request, response);
			
			/*response.setContentType("text/html");
		
	        PrintWriter out = response.getWriter();
	        out.write(rows);*/
		}
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String flag = request.getParameter("flag");
		UserService us= new UserService();
		if("queryByUserid".equals(flag))
		{
			int id = Integer.parseInt(request.getParameter(""));
			int page=1;
			if(request.getParameter("page")!=null)
			{
				page=Integer.parseInt(request.getParameter("page"));
			}int rows = UserDao.count;
			int pageNum = 0;
			if(rows%10==0)
			{
				pageNum= rows/10;
			}
			else {
				pageNum = rows/10+1;
			}
			if(page<1) {
				page =1;
			}
			else if (page>pageNum)
			{
				page = pageNum;
			}
			List<Music> list = new ArrayList<Music>();
			list= us.queryByUserid(id, pageNum);
			request.setAttribute("list", list);
			request.setAttribute("page", page);
			request.setAttribute("rows", rows);
			request.setAttribute("pageNum", pageNum);
			request.getRequestDispatcher("").forward(request, response);
			
		}
			else if ("del".equals(flag))
			{
				request.setCharacterEncoding("UTF-8");
				response.setCharacterEncoding("UTF-8");
				String music = request.getParameter("music");
				HttpSession session= request.getSession();
				int id=(int)session.getAttribute("id");
				String type = request.getParameter("type");
				int rows =us.delMusic(music,id,type);
				response.setContentType("text/html");
			
		        PrintWriter out = response.getWriter();
		        out.write(rows);
			}
			else if("queryType".equals(flag))
			{
				HttpSession session= request.getSession();
				int id=(int)session.getAttribute("id");
				List<String> list=us.querytype(id);
				request.setAttribute("list", list);
				request.getRequestDispatcher("sys/usermusic/usermusic.jsp").forward(request, response);
			}
			else if("queryByIdType".equals(flag))
			{
				request.setCharacterEncoding("UTF-8");
				response.setCharacterEncoding("UTF-8");

		        Gson gson=new Gson();
				HttpSession session= request.getSession();
				
				int id=(int)session.getAttribute("id");
				String type =request.getParameter("type");
				// System.out.println(id);
				 //System.out.println(type);
				List<Music> list= us.queryByIdType(id, type);
				response.setContentType("text/html");
				 //System.out.println(list);
		        PrintWriter out = response.getWriter();
				String info=gson.toJson(list);
		        
		        out.write(info);
			}
		
			
		
		
	}

}
