<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>market/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/gt_favicon.png">
<link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
<%@include file="../css_loading.jsp" %>
<style>
	body{
		margin-top: 93px;
	}
	.list{
		margin-top:10%;
		width:60%;
	}
	.controlBox{
		position: fixed;
		top: 110px;
		left: 30px;
		width: 140px;
		height: 340px;
		border: 1px solid red;
	}
</style>
</head>
<body>
<%@include file="header.jsp" %>
<!-- 
<div class="navbar navbar-inverse">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/home.do">Acorn</a>
		</div>
		<c:choose>
			<c:when test="${not empty id }">
				<a class="btn btn-warning btn-xs navbar-btn pull-right" href="${pageContext.request.contextPath}/users/logout.do">로그아웃</a>
				<p class="navbar-text pull-right"><a class="navbar-link" href="${pageContext.request.contextPath }/users/info.do"><strong>${id }</strong></a>님 로그인중... </p>
			</c:when>
			<c:otherwise>
				<a class="navbar-text navbar-link pull-right" href="${pageContext.request.contextPath }/users/loginform.do?url=${pageContext.request.contextPath}/shop/list.do">로그인</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>
 -->
 <div class="controlBox">
 	<a href="uploadform.do">판매하러 가기</a>
 </div>
<div class="container list">
	<h3>상품 목록 입니다.</h3>
	<div class="row">
		<c:forEach var="tmp" items="${list }">
			<div class="col-xs-4">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3>${tmp.name }</h3>
					</div>
					<div class="panel-body">
						<img class="img-responsive img-thumbnail" src="${pageContext.request.contextPath }/resources/images/1.jpg"/>
						<p>가격 : <strong>${tmp.price }</strong></p>
						<p>남은 수량 : <strong>${tmp.remainCount }</strong></p>
					</div>
					<div class="panel-footer">
						<a class="btn btn-success" href="buy.do?num=${tmp.num }">구매하기</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<%@include file="../footer.jsp" %>
</body>
</html>