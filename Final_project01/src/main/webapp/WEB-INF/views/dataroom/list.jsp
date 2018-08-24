<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>data list</title>
<%@include file="../css_loading.jsp" %>
<style>
.list{
	margin-top:10%;
	width:60%;
}
.jumbotron{
	margin-bottom:5%;
}
.text{
	font-weight:bold;
}
.btext{
	display:block;
	padding-top:5px;
}
.button{
	margin-left:20px;"
}
.lead{
  overflow: hidden; 
  text-overflow: ellipsis;
  white-space: nowrap; 
  width:100%;
  height: 30px;
}
.floatright{

	font-size:30px;
	float:right;
}
.icon{
	font-size:20px;
	background-color:skyblue;
	width:45px;
	height:45px;
	border-radius:25px;
	text-align:center;
	color:#fff;
	margin-right:10px;


}
.icon i{
	padding-top:13px;
}

</style>
</head>
<body>
<%@include file="../header.jsp" %>

	
	
<div class="container list">
	<header class="page-header">
		<h1 class="page-title">
			자료실
			<a href="uploadform.do" class="floatright"><i class="fas fa-plus-circle"></i></a>
		</h1>
	
	</header>
	
	<div class="custom-select" style="width:200px;">

		<select>
		    <option value="0">제목+내용</option>
		    <option value="1">제목</option>
		    <option value="2">내용</option>
		    <option value="3">작성자</option>
		</select>
		<input type="text" placeholder="Search.." name="search">
	  	<button type="submit"><i class="fa fa-search"></i></button>

	</div>
	
	<c:forEach var="tmp" items="${list }">
		
		<div class="jumbotron">
				
			<p>
			<span class="text">번호: ${tmp.num } </span>
			<span class="text">작성자: ${tmp.writer } </span>
			<span class="btext">${tmp.regdate }
				<c:if test="${tmp.writer eq id }">
				<a href="javascript:deleteConfirm(${tmp.num })" class="pull-right icon"><i class="fas fa-trash"></i></a>
				<a href="updateform.do?num=${tmp.num }" class="pull-right icon"><i class="fas fa-edit"></i></a>
				</c:if>
			</span>
			
			
			
			</p>
			<p class="h1-responsive"><strong style="font-size:18px;">${tmp.title }</strong></p>
			<p>${tmp.content }</p>
			<hr class="my-2">
			${tmp.orgFileName }
	   		<a class="btn btn-primary btn-sm button downBtn" href="download.do?num=${tmp.num }" role="button"><i class="glyphicon glyphicon-download pull-right"></i>Download</a>
			
		</div>
	</c:forEach>
	
	
	<!-- 페이징 처리 -->
	<div class="container" style="margin-left:35%;">
		<ul class="pagination">
			
			<c:if test="${startPageNum eq 1 }">
				<li class="disabled">
					<a href="list.do?pageNum=${startPageNum}"><i class="fas fa-angle-double-left"></i></a>
				</li>
				<li class="disabled">
					<a href="javascript:"><i class="fas fa-angle-left"></i></a>
				</li>
			</c:if>
		
			
			<c:forEach var="i" begin="${startPageNum }"
				end="${endPageNum }">
				
				<c:choose>
					<c:when test="${i eq pageNum }">
						<li class="active">
							<a href="list.do?pageNum=${i }">${i }</a>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="list.do?pageNum=${i }">${i }</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
				
			
			<c:if test="${endPageNum eq totalPageCount}">
				<li class="disabled">
					<a href="javascript:"><i class="fas fa-angle-right"></i></a>
				</li>
				<li class="disabled">
					<a href="list.do?pageNum=${totalPageCount}"><i class="fas fa-angle-double-right"></i></a>
				</li>
			</c:if>
		</ul>
		
	</div>
</div>
<%@include file="../footer.jsp" %>


<script>
	//삭제 확인을 하는 함수 
	function deleteConfirm(num){
		var isDelete=confirm(num+"번 파일을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="delete.do?num="+num;
		}
	}
	

	

	
</script>
</body>
</html>