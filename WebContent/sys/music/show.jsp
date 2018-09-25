<%@ page contentType="text/html; charset=gbk" %> 
<%@ page import="java.io.*"%> 
<%@ page import="java.sql.*, javax.sql.*" %> 
<%@ page import="java.util.*"%> 
<%@ page import="java.math.*"%> 
 
<% 
String photo_no = request.getParameter("photo_no"); 
//mysql连接 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
String URL="jdbc:mysql://127.0.0.1:3306/test"; 
///Connection con = DriverManager.getConnection(URL); 
//oracle连接 
//String URL="jdbc:oracle:thin@localhost:1521:orcl2"; 
//user="system"; 
//password="manager"; 
Connection con = DriverManager.getConnection(URL,"root","123"); 
try{ 
// 准备语句执行对象 
Statement stmt = con.createStatement(); 
String sql = " SELECT * FROM allmusic WHERE id = "+ photo_no; 
ResultSet rs = stmt.executeQuery(sql); 
if (rs.next()) { 
Blob b = rs.getBlob("album"); 
long size = b.length(); 
//out.print(size); 
byte[] bs = b.getBytes(1, (int)size); 
response.setContentType("image/jpeg"); 
OutputStream outs = response.getOutputStream(); 
outs.write(bs); 
out.clear();
out = pageContext.pushBody();
//outs.flush(); 
outs.close();
rs.close(); 
} 
else { 
rs.close(); 
response.sendRedirect("./images/error.gif"); 
} 
} 
finally{ 
con.close(); 
} 
%> 


