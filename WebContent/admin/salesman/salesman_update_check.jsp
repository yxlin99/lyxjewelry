<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="refresh" content="charset=utf-8">
<title>药品进货确认</title>
</head>
<body>
<%
String ID=new String(request.getParameter("id").getBytes("UTF-8"),"UTF-8");
String Name=new String(request.getParameter("name").getBytes("UTF-8"),"UTF-8");
String phoneString=new String(request.getParameter("phone").getBytes("UTF-8"),"UTF-8");
String emailString=new String(request.getParameter("email").getBytes("UTF-8"),"UTF-8");
String passwordString=new String(request.getParameter("password").getBytes("UTF-8"),"UTF-8");
String addressString=new String(request.getParameter("address").getBytes("UTF-8"),"UTF-8");
String sexString=new String(request.getParameter("sex").getBytes("UTF-8"),"UTF-8");

//int ID_int = Integer.parseInt(ID);
Class.forName("com.mysql.jdbc.Driver");
	String sql;
	String url = "jdbc:mysql://localhost:3306/lyxjewelry?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
	try {
		Connection conn = DriverManager.getConnection(url,"root","123456");
		sql = "update user set name=?,phone=?,email=?,password=?,address=?,sex=? where id=?";		
		PreparedStatement ps = conn.prepareStatement(sql);
		System.out.println(sexString);
		ps.setString(1,Name);
		ps.setString(2,phoneString);
		ps.setString(3,emailString);
		ps.setString(4,passwordString);
		ps.setString(5,addressString);
		ps.setString(6,sexString);
		ps.setString(7,ID);
		int row=ps.executeUpdate();		
		if(row>0){
			out.println("更改销售人员信息成功");
		}
		ps.close();
		conn.close();
		
	}catch(Exception e){
		out.println("销售人员信息更改失败");
		e.printStackTrace();
	}
		
%>
</body>
</html>