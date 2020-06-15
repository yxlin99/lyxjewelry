<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录日志管理</title>

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
Select * from log;
</sql:query>

<div class="container">
<h2>所有人员登录日志查询</h2>
    <table class="table table-hover">
        <tr>
            <td align="center">人员名字</td>
            <td align="center">操作类型</td>
            <td align="center">时间</td>
            <td align="center">人员身份</td>
            <td align="center">IP地址</td>
        </tr>
        <c:forEach items="${result.rows}" var="row">
            <tr>
                <td align="center">${row.name }</td>
                <td align="center">${row.type }</td>
                <td align="center">${row.time }</td>
                <td align="center">${row.role}</td>
                <td align="center">${row.ip_address }</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>