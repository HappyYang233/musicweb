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

import com.cc.javabean.Music;
import com.cc.service.MusicService;
import com.cc.service.TypeService;
import com.google.gson.Gson;

/**
 * Servlet implementation class MusicServlet
 */
@WebServlet("/MusicServlet")
public class MusicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MusicServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//doGet(request, response);
    	String flag = request.getParameter("flag");
    	String music1 = request.getParameter("musicname");
    	String type1 = request.getParameter("type1");
    	HttpSession session = request.getSession();
		int id = (int)session.getAttribute("id");
		MusicService ms = new MusicService();
		if("add2".equals(flag))
		{
			String src=request.getParameter("src");
			int rows= ms.insert(music1, type1, id,src);
			System.out.println(rows);
			System.out.println(src);
			queryByPage(request,response,ms);
		}
		else if("add1".equals(flag))
		{
			String src[]=request.getParameterValues("src");
			String  musicname []    =  request.getParameterValues("musicname"); 
			
			String type =request.getParameter("type3");
	           if  (musicname!=null) 
	    	{ 
	    	     for(int  i=0;i<musicname.length;i++) 
	    	    { 
	    	     //得到需要删除的项目   
	    	   String music=musicname[i];
	    	   String musicsrc=src[i];
	    	     
	    	     //根据得到是选中项目进行删除
	    	   int rows=ms.insert(music, type, id,musicsrc);//已测试
	    	     }
	    	     //重新获取当前列表
			queryByPage(request,response,ms);
			
		}
		}
		else if("createType".equals(flag))
		{
			String type2=request.getParameter("type2");
			int rows=ms.createType(id, type2);
			queryByPage(request,response,ms);
		}
		else if("search".equals(flag)){
			List<Music> list = new ArrayList<Music>();
			String musicname=request.getParameter("musicname");
			list = ms.queryByMusicName(musicname);
			 Gson gson=new Gson();
			 response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String info=gson.toJson(list);
			out.write(info);
			System.out.println("aaaaaaaaaaaaaaaaaaaa");
			
		 
			}


		
		
    	
    }
    	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String flag = request.getParameter("flag");
		MusicService ms = new MusicService();
		TypeService ts= new TypeService();
		HttpSession session = request.getSession();
		int id = (int)session.getAttribute("id");
		List<String> typelist = null;
		typelist =ts.querytype(id);
		request.setAttribute("typelist", typelist);
		
		if("queryByPage".equals(flag))
		{
			int page =1;
			if(request.getParameter("page")!=null)
			{
				page= Integer.parseInt(request.getParameter("page"));
			}
		
		int rows = ms.queryCount();//已测试
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
		List<Music> list = new ArrayList<Music>();//已测试
		list = ms.queryByPage(page);
		request.setAttribute("rows", rows);
		request.setAttribute("page", page);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("list", list);
		request.getRequestDispatcher("sys/music/music.jsp").forward(request, response);
	 
	}
		else if("add".equals(flag))
		{	
			
			
			String  musicname []    =  request.getParameterValues("musicname"); 
	           if  (musicname!=null) 
	    	{ 
	    	     for(int  i=0;i<musicname.length;i++) 
	    	    { 
	    	     //得到需要删除的项目   
	    	   String music=musicname[i];
	    	     
	    	     //根据得到是选中项目进行删除
	    	   int rows=ms.addMusic(music, id);//已测试
	    	     }
	    	     //重新获取当前列表
			
			
			
			
			
			
			
			queryByPage(request,response,ms);
		}
		}
		
	}
	public void queryByPage(HttpServletRequest request, HttpServletResponse response,MusicService ms) throws ServletException, IOException{
		MusicService Ms = new MusicService();
		TypeService ts= new TypeService();
		HttpSession session = request.getSession();
		int id = (int)session.getAttribute("id");
		List<String> typelist = null;
		typelist =ts.querytype(id);
		request.setAttribute("typelist", typelist);
		int page = 1;
		if(request.getParameter("page")!=null){
			page = Integer.parseInt(request.getParameter("page"));
		}
		int rows = ms.queryCount();
		int pageNum = 0;
		if(rows%10==0){
			pageNum = rows/10;
		}else{
			pageNum = rows/10+1;
		}
		
		if(page<1){
			page = 1;
		}else if(page>pageNum){
			page = pageNum;
		}
		List<Music> list = Ms.queryByPage(page);
		request.setAttribute("rows", rows);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("page", page);
		request.setAttribute("list", list);
		request.getRequestDispatcher("sys/music/music.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
}
