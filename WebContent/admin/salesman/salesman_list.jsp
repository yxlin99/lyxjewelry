<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>销售人员管理</title>

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/lyxjewelry?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC"
     user="root"  password="123456"/>
<sql:query dataSource="${snapshot }" var="result">
Select * from user where role="sales";
</sql:query>

<div class="container">
<h2>销售人员信息管理</h2>
<h2><a href="salesman_add.jsp">添加新销售人员</a></h2>
    <table class="table table-hover">
        <tr>
            <td align="center">销售人员编号</td>
            <td align="center">销售人员名字</td>
            <td align="center">销售人员电话</td>
            <td align="center">销售人员邮箱</td>
            <td align="center">销售人员密码</td>
            <td align="center">销售人员性别</td>
            <td align="center">销售人员地址</td>
            <td align="center">操作</td>
        </tr>
        <c:forEach items="${result.rows}" var="row">
            <tr>
                <td align="center">${row.id }</td>
                <td align="center">${row.name }</td>
                <td align="center">${row.phone }</td>
                <td align="center">${row.email}</td>
                <td align="center">${row.password }</td>
                <td align="center">${row.sex }</td>
                <td align="center">${row.address}</td>
                <td align="center"><a href="salesman_delete.jsp?id=${row.id }">删除</a>|<a href="salesman_update.jsp?id=${row.id }">编辑信息</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>