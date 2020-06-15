<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" href="css/main.css" type="text/css" />
	<script type="text/javascript" src="js/my.js"></script>
</head>

<body class="main">
<%
String idString=new String(request.getParameter("id").getBytes("UTF-8"),"UTF-8");
System.out.println(idString);
String phoneString=new String(request.getParameter("phone").getBytes("UTF-8"),"UTF-8");
String passwordString=new String(request.getParameter("password").getBytes("UTF-8"),"UTF-8");
String sexString=new String(request.getParameter("sex").getBytes("UTF-8"),"UTF-8");

Class.forName("com.mysql.jdbc.Driver");
String sql;
String url = "jdbc:mysql://localhost:3306/lyxjewelry?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
try {
		Connection conn = DriverManager.getConnection(url,"root","123456");
		sql = "update user set phone=?,password=?,sex=? where id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
	
		ps.setString(1,phoneString);
		ps.setString(2,passwordString);
		ps.setString(3,sexString);
		ps.setString(4,idString);

		int row=ps.executeUpdate();		
		if(row>0){
			System.out.println("修改信息成功");
		}
		ps.close();
		conn.close();
}
finally{

}

%>
	<div id="divcontent">
		<table width="850px" border="0" cellspacing="0">
			<tr>
				<td style="padding:30px; text-align:center">
					<table width="60%" border="0" cellspacing="0" style="margin-top:70px">
						<tr>
							<td style="width:98">
								<img src="images/IconTexto_WebDev_009.jpg" width="128" height="128" />
							</td>
							<td style="padding-top:30px">
								<font style="font-weight:bold; color:#FF0000">修改信息成功，请重新登陆！</font><br />
								<br /> 
								<a href="${pageContext.request.contextPath }/index.jsp">
									<span id="second">5</span>秒后自动为您转跳回首页
								</a>
							</td>
						</tr>
					</table>
					<h1>&nbsp;</h1></td>
			</tr>
		</table>
	</div>
</body>
</html>