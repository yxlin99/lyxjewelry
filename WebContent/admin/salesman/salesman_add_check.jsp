<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="refresh" content="charset=utf-8">
<title>添加销售人员</title>
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
String Name=new String(request.getParameter("name").getBytes("UTF-8"),"UTF-8");
String phoneString=new String(request.getParameter("phone").getBytes("UTF-8"),"UTF-8");
String emailString=new String(request.getParameter("email").getBytes("UTF-8"),"UTF-8");
String passwordString=new String(request.getParameter("password").getBytes("UTF-8"),"UTF-8");
String addressString=new String(request.getParameter("address").getBytes("UTF-8"),"UTF-8");
String sexString=new String(request.getParameter("sex").getBytes("UTF-8"),"UTF-8");
String roleString = "sales";

Class.forName("com.mysql.jdbc.Driver");
String sql;
String url = "jdbc:mysql://localhost:3306/lyxjewelry?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
try {
		Connection conn = DriverManager.getConnection(url,"root","123456");
		sql = "insert into user(name,phone,email,password,address,sex,role,state) values(?,?,?,?,?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1,Name);
		ps.setString(2,phoneString);
		ps.setString(3,emailString);
		ps.setString(4,passwordString);
		ps.setString(5, addressString);
		ps.setString(6,sexString);
		System.out.println("sex:"+sexString);
		ps.setString(7, roleString);
		ps.setInt(8, 1);
		int row=ps.executeUpdate();		
		if(row>0){
			out.println("加入销售人员成功");
		}
		ps.close();
		conn.close();
}
finally{

}
%>


</body>
</html>