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
String categoryString=new String(request.getParameter("category").getBytes("UTF-8"),"UTF-8");
String priceString=new String(request.getParameter("price").getBytes("UTF-8"),"UTF-8");
String numberString=new String(request.getParameter("number").getBytes("UTF-8"),"UTF-8");
String materialString=new String(request.getParameter("material").getBytes("UTF-8"),"UTF-8");
String colorString=new String(request.getParameter("color").getBytes("UTF-8"),"UTF-8");
String descriptionString=new String(request.getParameter("description").getBytes("UTF-8"),"UTF-8");

//int ID_int = Integer.parseInt(ID);
Class.forName("com.mysql.jdbc.Driver");
	String sql;
	String url = "jdbc:mysql://localhost:3306/lyxjewelry?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
	try {
		Connection conn = DriverManager.getConnection(url,"root","123456");
		sql = "update products set name=?,category=?,price=?,number=?,material=?,color=?,description=? where id=?";		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1,Name);
		ps.setString(2,categoryString);
		ps.setString(3,priceString);
		ps.setString(4,numberString);
		ps.setString(5,materialString);
		ps.setString(6,colorString);
		ps.setString(7,descriptionString);
		ps.setString(8,ID);
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