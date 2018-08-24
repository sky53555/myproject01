<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HOME</title>

<link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
<%@include file="../css_loadingForGallery.jsp" %>

<style>
    .row{
			width: 60%;
			margin: 0 auto;
			padding-top: 50px;
		}
	.item span{
		font-size: 0.8em;
		float: right;
	}
	.item a{
		float: left;
		font-size: 0.8em;
	}
	.navbar{
		opacity: 0.9;
	}
	.navbar .container{
		height: 50px;
	}
</style>
</head>


<body>
	<%@include file="../header.jsp" %>
		<div id="fh5co-main">
			<div class="container">
				<div class="row">
					<div>
						<a href="upload_form.do">${isEmpty }</a>
					</div>
        			<div id="fh5co-board" data-columns>
        			<%
        				System.out.println("board는 정상적임"); 
        				
        			%>
						<%-- <c:forEach var="tmp" items="${list }">
						<%System.out.println("gallery item에 들어옴"); %>
							<div class="item">
			        			<div class="animate-box">
				        			<a href="${imgPath + tmp.saveFileName}" class="image-popup fh5co-board-img" title="${tmp.title }">
				        				<img src="${imgPath + tmp.saveFileName}" alt="Free HTML5 Bootstrap template">
				        			</a>
			        			</div>
			        			<div class="fh5co-desc">${tmp.context }<br><span>${tmp.regdate }</span></div>
			        		</div>
						</c:forEach> --%>
						<div class="item">
			        		<div class="animate-box">
				        		<a href="${pageContext.request.contextPath}/resources/images/battleground_1.jpg" class="image-popup fh5co-board-img" title="안녕하세요">
				        			<img src="${pageContext.request.contextPath}/resources/images/battleground_1.jpg" alt="Free HTML5 Bootstrap template">
				        		</a>
			        			
			        			<div class="fh5co-desc">배틀그라운드 오토바이 이미지
			        			<br>
			        			<br>
			        			<a href="javascript:deleteConfirm(${tmp.num } })">삭제</a>
			        			<span>18.08.21&nbsp</span>
			        			</div>
			        		</div>
			        	</div>
			        	<div class="item">
			        		<div class="animate-box">
				        		<a href="${pageContext.request.contextPath}/resources/images/battleground_2.jpg" class="image-popup fh5co-board-img" title="안녕하세요">
				        			<img src="${pageContext.request.contextPath}/resources/images/battleground_2.jpg" alt="Free HTML5 Bootstrap template">
				        		</a>
			        			
			        			<div class="fh5co-desc">배틀그라운드 메인 이미지 사람 넷
			        			<br>
			        			<br>
			        			<a href="javascript:deleteConfirm(${tmp.num } })">삭제</a>
			        			<span>18.08.21&nbsp</span>
			        			</div>
			        		</div>
			        	</div>
			        	<div class="item">
			        		<div class="animate-box">
				        		<a href="${pageContext.request.contextPath}/resources/images/overwatch_1.png" class="image-popup fh5co-board-img" title="안녕하세요">
				        			<img src="${pageContext.request.contextPath}/resources/images/overwatch_1.png" alt="Free HTML5 Bootstrap template">
				        		</a>
			        			
			        			<div class="fh5co-desc">오버워치 메인 이미지 하나
			        			<br>
			        			<br>
			        			<a href="javascript:deleteConfirm(${tmp.num } })">삭제</a>
			        			<span>18.08.21&nbsp</span>
			        			</div>
			        		</div>
			        	</div>
			        	<div class="item">
			        		<div class="animate-box">
				        		<a href="${pageContext.request.contextPath}/resources/images/overwatch_2.png" class="image-popup fh5co-board-img" title="안녕하세요">
				        			<img src="${pageContext.request.contextPath}/resources/images/overwatch_2.png" alt="Free HTML5 Bootstrap template">
				        		</a>
			        			
			        			<div class="fh5co-desc">오버워치 메인 이미지 두개 로고 이미지
			        			<br>
			        			<br>
			        			<a href="javascript:deleteConfirm(${tmp.num } })">삭제</a>
			        			<span>18.08.21&nbsp</span>
			        			</div>
			        		</div>
			        	</div>
			        	<div class="item">
			        		<div class="animate-box">
				        		<a href="${pageContext.request.contextPath}/resources/images/lol_1.jpg" class="image-popup fh5co-board-img" title="안녕하세요">
				        			<img src="${pageContext.request.contextPath}/resources/images/lol_1.jpg" alt="Free HTML5 Bootstrap template">
				        		</a>
			        			
			        			<div class="fh5co-desc">리그 오브 레전드 이미지 하나
			        			<br>
			        			<br>
			        			<a href="javascript:deleteConfirm(${tmp.num } })">삭제</a>
			        			<span>18.08.21&nbsp</span>
			        			</div>
			        		</div>
			        	</div>
			        	<div class="item">
			        		<div class="animate-box">
				        		<a href="${pageContext.request.contextPath}/resources/images/lol_2.jpg" class="image-popup fh5co-board-img" title="안녕하세요">
				        			<img src="${pageContext.request.contextPath}/resources/images/lol_2.jpg" alt="Free HTML5 Bootstrap template">
				        		</a>
			        			
			        			<div class="fh5co-desc">리그 오브 레전드 이미지 두개
			        			<br>
			        			<br>
			        			<a href="javascript:deleteConfirm(${tmp.num } })">삭제</a>
			        			<span>18.08.21&nbsp</span>
			        			</div>
			        		</div>
			        	</div>
			        	<div class="item">
			        		<div class="animate-box">
				        		<a href="${pageContext.request.contextPath}/resources/images/battleground_1.jpg" class="image-popup fh5co-board-img" title="안녕하세요">
				        			<img src="${pageContext.request.contextPath}/resources/images/battleground_1.jpg" alt="Free HTML5 Bootstrap template">
				        		</a>
			        			
			        			<div class="fh5co-desc">배틀그라운드 오토바이 이미지
			        			<br>
			        			<br>
			        			<a href="javascript:deleteConfirm(${tmp.num } })">삭제</a>
			        			<span>18.08.21&nbsp</span>
			        			</div>
			        		</div>
			        	</div>
			        	<div class="item">
			        		<div class="animate-box">
				        		<a href="${pageContext.request.contextPath}/resources/images/battleground_2.jpg" class="image-popup fh5co-board-img" title="안녕하세요">
				        			<img src="${pageContext.request.contextPath}/resources/images/battleground_2.jpg" alt="Free HTML5 Bootstrap template">
				        		</a>
			        			
			        			<div class="fh5co-desc">배틀그라운드 메인 이미지 사람 넷
			        			<br>
			        			<br>
			        			<a href="javascript:deleteConfirm(${tmp.num } })">삭제</a>
			        			<span>18.08.21&nbsp</span>
			        			</div>
			        		</div>
			        	</div>
			        	<div class="item">
			        		<div class="animate-box">
				        		<a href="${pageContext.request.contextPath}/resources/images/overwatch_1.png" class="image-popup fh5co-board-img" title="안녕하세요">
				        			<img src="${pageContext.request.contextPath}/resources/images/overwatch_1.png" alt="Free HTML5 Bootstrap template">
				        		</a>
			        			
			        			<div class="fh5co-desc">오버워치 메인 이미지 하나
			        			<br>
			        			<br>
			        			<a href="javascript:deleteConfirm(${tmp.num } })">삭제</a>
			        			<span>18.08.21&nbsp</span>
			        			</div>
			        		</div>
			        	</div>
			        	<div class="item">
			        		<div class="animate-box">
				        		<a href="${pageContext.request.contextPath}/resources/images/overwatch_2.png" class="image-popup fh5co-board-img" title="안녕하세요">
				        			<img src="${pageContext.request.contextPath}/resources/images/overwatch_2.png" alt="Free HTML5 Bootstrap template">
				        		</a>
			        			
			        			<div class="fh5co-desc">오버워치 메인 이미지 두개 로고 이미지
			        			<br>
			        			<br>
			        			<a href="javascript:deleteConfirm(${tmp.num } })">삭제</a>
			        			<span>18.08.21&nbsp</span>
			        			</div>
			        		</div>
			        	</div>
			        	<div class="item">
			        		<div class="animate-box">
				        		<a href="${pageContext.request.contextPath}/resources/images/lol_1.jpg" class="image-popup fh5co-board-img" title="안녕하세요">
				        			<img src="${pageContext.request.contextPath}/resources/images/lol_1.jpg" alt="Free HTML5 Bootstrap template">
				        		</a>
			        			
			        			<div class="fh5co-desc">리그 오브 레전드 이미지 하나
			        			<br>
			        			<br>
			        			<a href="javascript:deleteConfirm(${tmp.num } })">삭제</a>
			        			<span>18.08.21&nbsp</span>
			        			</div>
			        		</div>
			        	</div>
			        	<div class="item">
			        		<div class="animate-box">
				        		<a href="${pageContext.request.contextPath}/resources/images/lol_2.jpg" class="image-popup fh5co-board-img" title="안녕하세요">
				        			<img src="${pageContext.request.contextPath}/resources/images/lol_2.jpg" alt="Free HTML5 Bootstrap template">
				        		</a>
			        			
			        			<div class="fh5co-desc">리그 오브 레전드 이미지 두개
			        			<br>
			        			<br>
			        			<a href="javascript:deleteConfirm(${tmp.num } })">삭제</a>
			        			<span>18.08.21&nbsp</span>
			        			</div>
			        		</div>
			        	</div>
			        	<div class="item">
			        		<div class="animate-box">
				        		<a href="${pageContext.request.contextPath}/resources/images/battleground_2.jpg" class="image-popup fh5co-board-img" title="안녕하세요">
				        			<img src="${pageContext.request.contextPath}/resources/images/battleground_2.jpg" alt="Free HTML5 Bootstrap template">
				        		</a>
			        			
			        			<div class="fh5co-desc">배틀그라운드 메인 이미지 사람 넷
			        			<br>
			        			<br>
			        			<a href="javascript:deleteConfirm(${tmp.num } })">삭제</a>
			        			<span>18.08.21&nbsp</span>
			        			</div>
			        		</div>
			        	</div>
			        	<div class="item">
			        		<div class="animate-box">
				        		<a href="${pageContext.request.contextPath}/resources/images/overwatch_1.png" class="image-popup fh5co-board-img" title="안녕하세요">
				        			<img src="${pageContext.request.contextPath}/resources/images/overwatch_1.png" alt="Free HTML5 Bootstrap template">
				        		</a>
			        			
			        			<div class="fh5co-desc">오버워치 메인 이미지 하나
			        			<br>
			        			<br>
			        			<a href="javascript:deleteConfirm(${tmp.num } })">삭제</a>
			        			<span>18.08.21&nbsp</span>
			        			</div>
			        		</div>
			        	</div>
			        	<div class="item">
			        		<div class="animate-box">
				        		<a href="${pageContext.request.contextPath}/resources/images/overwatch_2.png" class="image-popup fh5co-board-img" title="안녕하세요">
				        			<img src="${pageContext.request.contextPath}/resources/images/overwatch_2.png" alt="Free HTML5 Bootstrap template">
				        		</a>
			        			
			        			<div class="fh5co-desc">오버워치 메인 이미지 두개 로고 이미지
			        			<br>
			        			<br>
			        			<a href="javascript:deleteConfirm(${tmp.num } })">삭제</a>
			        			<span>18.08.21&nbsp</span>
			        			</div>
			        		</div>
			        	</div>
			        	<div class="item">
			        		<div class="animate-box">
				        		<a href="${pageContext.request.contextPath}/resources/images/lol_1.jpg" class="image-popup fh5co-board-img" title="안녕하세요">
				        			<img src="${pageContext.request.contextPath}/resources/images/lol_1.jpg" alt="Free HTML5 Bootstrap template">
				        		</a>
			        			
			        			<div class="fh5co-desc">리그 오브 레전드 이미지 하나
			        			<br>
			        			<br>
			        			<a href="javascript:deleteConfirm(${tmp.num } })">삭제</a>
			        			<span>18.08.21&nbsp</span>
			        			</div>
			        		</div>
			        	</div>
			        	<div class="item">
			        		<div class="animate-box">
				        		<a href="${pageContext.request.contextPath}/resources/images/lol_2.jpg" class="image-popup fh5co-board-img" title="안녕하세요">
				        			<img src="${pageContext.request.contextPath}/resources/images/lol_2.jpg" alt="Free HTML5 Bootstrap template">
				        		</a>
			        			
			        			<div class="fh5co-desc">리그 오브 레전드 이미지 두개
			        			<br>
			        			<br>
			        			<a href="javascript:deleteConfirm(${tmp.num } })">삭제</a>
			        			<span>18.08.21&nbsp</span>
			        			</div>
			        		</div>
			        	</div>
			        	<div class="item">
			        		<div class="animate-box">
				        		<a href="${pageContext.request.contextPath}/resources/images/battleground_1.jpg" class="image-popup fh5co-board-img" title="안녕하세요">
				        			<img src="${pageContext.request.contextPath}/resources/images/battleground_1.jpg" alt="Free HTML5 Bootstrap template">
				        		</a>
			        			
			        			<div class="fh5co-desc">배틀그라운드 오토바이 이미지
			        			<br>
			        			<br>
			        			<a href="javascript:deleteConfirm(${tmp.num } })">삭제</a>
			        			<span>18.08.21&nbsp</span>
			        			</div>
			        		</div>
			        	</div>
			        	<div class="item">
			        		<div class="animate-box">
				        		<a href="${pageContext.request.contextPath}/resources/images/battleground_2.jpg" class="image-popup fh5co-board-img" title="안녕하세요">
				        			<img src="${pageContext.request.contextPath}/resources/images/battleground_2.jpg" alt="Free HTML5 Bootstrap template">
				        		</a>
			        			
			        			<div class="fh5co-desc">배틀그라운드 메인 이미지 사람 넷
			        			<br>
			        			<br>
			        			<a href="javascript:deleteConfirm(${tmp.num } })">삭제</a>
			        			<span>18.08.21&nbsp</span>
			        			</div>
			        		</div>
			        	</div>
			        	<div class="item">
			        		<div class="animate-box">
				        		<a href="${pageContext.request.contextPath}/resources/images/overwatch_1.png" class="image-popup fh5co-board-img" title="안녕하세요">
				        			<img src="${pageContext.request.contextPath}/resources/images/overwatch_1.png" alt="Free HTML5 Bootstrap template">
				        		</a>
			        			
			        			<div class="fh5co-desc">오버워치 메인 이미지 하나
			        			<br>
			        			<br>
			        			<a href="javascript:deleteConfirm(${tmp.num } })">삭제</a>
			        			<span>18.08.21&nbsp</span>
			        			</div>
			        		</div>
			        	</div>
        			</div>
        		</div>
       		</div>
		</div>

<%@include file="../footer.jsp" %>
<%@include file="../js_loading.jsp" %>

<script>
	//삭제 확인을 하는 함수 
	function deleteConfirm(num){
		var isDelete=confirm(num+"번 파일을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="delete.do?num="+num;
		}
	}
</script>
	

</script>
</body>
</html>