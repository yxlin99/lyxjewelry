<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!-- 
String path=request.getContextPath();
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 -->

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加新销售人员</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="jquery-3.4.1.min.js"></script>
</head>

<body>
        <form action="./salesman_add_check.jsp" method="post">
        <div class="form-group">
        <label>销售人员名称</label>
        <input type="text" class="form-control" name="name" placeholder="请输入销售人员名称">
        <label>销售人员电话</label>
        <input type="text" class="form-control" name="phone" placeholder="请输入销售人员电话">
        <label>销售人员邮箱</label>
        <input type="text" class="form-control" name="email" placeholder="销售人员邮箱">
        <label>销售人员密码</label>
        <input type="text" class="form-control" name="password" placeholder="销售人员密码">
        <label>销售人员地址</label>
        <input type="text" class="form-control" name="address" placeholder="销售人员地址">
        <label>销售人员性别</label>
        <input type="text" class="form-control" name="sex" placeholder="男/女">
        <input type="submit" value="添加" >
        </div>
        </form>

</body>
</html>