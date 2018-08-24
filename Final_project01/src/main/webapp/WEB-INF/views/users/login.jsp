<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/login.jsp</title>
<%@include file="../css_loading.jsp" %>
<style>
.list{
	width:60%;
	margin-top:10%;
	}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
<div class="container list">
	
	<div class="jumbotron">
	<c:choose>
		<c:when test="${isLoginSuccess }">
			<p>환영합니다!</p>
			<h3 class="text-center"> <strong>${id }</strong> 님 로그인 되었습니다.</h3>
			<p>3초후 페이지 이동</p>
			<script>
				function window_onload(){
				    setTimeout('go_url()',3000)  // 3초후 go_url() 함수를 호출한다.
				 }
				 function go_url(){
				    location.href=""  // 페이지 이동...
				 }
				 window_onload();
			</script>
		</c:when>
		<c:otherwise>
			<p> 아이디 혹은 비밀번호가 틀려요.</p>
			<a href="loginform.do?url=${url }">확인</a>
		</c:otherwise>
	</c:choose>
	</div>
</div>
</body>

<%@include file="../footer.jsp" %>

</html>