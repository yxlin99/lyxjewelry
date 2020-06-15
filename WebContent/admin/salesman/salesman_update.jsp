<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>销售人员信息更改</title>
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
%>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/lyxjewelry?useUnicode=true&characterEncoding=gb2312&serverTimezone=UTC"
     user="root"  password="123456"/>
<sql:query dataSource="${snapshot }" var="result">
Select * from user where id= <%=Id %>;
</sql:query>

<form action="./salesman_update_check.jsp" method="post">
        <div class="form-group">
        <c:forEach items="${result.rows}" var="row">
        <label>销售人员编号（无法修改）</label>
        <input type="text" class="form-control" name="id" placeholder=${row.id } value=${row.id } contentEditable="false">
        <label>销售人员名称</label>
        <input type="text" class="form-control" name="name" placeholder=${row.name } value=${row.name } >
        <label>销售人员电话</label>
        <input type="text" class="form-control" name="phone" placeholder=${row.phone } value=${row.phone }>
        <label>销售人员邮箱</label>
        <input type="text" class="form-control" name="email" placeholder=${row.email } value=${row.email } >
        <label>销售人员密码</label>
        <input type="text" class="form-control" name="password" placeholder=${row.password } value=${row.password } >
        <label>销售人员地址</label>
        <input type="text" class="form-control" name="address" placeholder=${row.address } value=${row.address }>
        <label>销售人员性别</label>
        <input type="text" class="form-control" name="sex" placeholder=${row.sex } value=${row.sex }>
        <input type="submit" value="更改" >
        </c:forEach>
        </div>
</form>
</body>
</html>