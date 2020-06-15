<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<!-- http-equiv="Content-Type" content="text/html; charset=utf-8" -->
<meta http-equiv="refresh" content="600; charset=utf-8">
<title>删除销售人员</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
<%
String IdString=new String(request.getParameter("id").getBytes("ISO8859_1"),"GBK");
Integer Id=Integer.parseInt(IdString);
Class.forName("com.mysql.jdbc.Driver");
	String sql;
	String url = "jdbc:mysql://localhost:3306/lyxjewelry?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
	try {
		Connection conn = DriverManager.getConnection(url,"root","123456");
		sql = "delete from user where id="+Id;
		PreparedStatement ps = conn.prepareStatement(sql);
		int row=ps.executeUpdate();
		if(row>0){
			out.println("删除销售人员成功");
		}
		ps.close();
		conn.close();
	}catch(Exception e){
		out.print("删除销售人员失败");
		e.printStackTrace();
	}
%>
</body>
</html>