<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>林颖欣饰品商城</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/main.css" type="text/css" />
	<link type="text/css" href="${pageContext.request.contextPath }/client/css/autoplay.css" rel="stylesheet" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/client/js/autoplay.js"></script>
</head>

<body class="main">
	<%@include file="head.jsp"%>
	<%@include file="menu_search.jsp" %>

	<div id="box_autoplay">
    	<div class="list">
        	<ul>
            	<li><img src="${pageContext.request.contextPath }/client/ad/ad6.JPG" width="400" height="335" /></li>
            	<li><img src="${pageContext.request.contextPath }/client/ad/ad7.png" width="400" height="335" /></li>
            	<li><img src="${pageContext.request.contextPath }/client/ad/ad3.jpg" width="400" height="335" /></li>
            	<li><img src="${pageContext.request.contextPath }/client/ad/ad4.JPG" width="400" height="335" /></li>
            	<li><img src="${pageContext.request.contextPath }/client/ad/ad5.JPG" width="400" height="335" /></li>
        	</ul>
    	</div>
	</div>

	<div id="divcontent">
		<table width="900px" border="0" cellspacing="0">
			<tr>
				<td style="padding:5px 15px 10px 40px">
					<table width="100%" border="0" cellspacing="0">
						<tr>
							<td>
								<h2>猜你喜欢————推荐商品</h2>
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0">
						<tr>
						<c:forEach items="${pList }" var="pArray">
							<td style="width:80; text-align:center">
								<a href="${pageContext.request.contextPath}/findProductById?id=${pArray[0]}">
									<img src="${pageContext.request.contextPath }${pArray[2]}" width="102" height="130" border="0" /> 
								</a>
								<br/> 
								<a href="${pageContext.request.contextPath}/findProductById?id=${pArray[0]}">${pArray[1]}</a>
							
							</td>
						</c:forEach>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<%@ include file="foot.jsp" %>
</body>
</html>
