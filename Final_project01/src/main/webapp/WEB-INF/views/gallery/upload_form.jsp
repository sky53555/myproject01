<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css"/>

<title>file/upload_form.jsp</title>
<style type="text/css">
	body {margin: 10px}
	.where {
	  	display: block;
	  	margin: 25px 15px;
	  	font-size: 11px;
	  	color: #000;
	  	text-decoration: none;
	  	font-family: verdana;
	  	font-style: italic;
	} 
	
	.filebox input[type="file"] {
	    position: absolute;
	    width: 1px;
	    height: 1px;
	    padding: 0;
	    margin: -1px;
	    overflow: hidden;
	    clip:rect(0,0,0,0);
	    border: 0;
	}
	
	.filebox label {
	    display: inline-block;
	    padding: .5em .75em;
	    color: #999;
	    font-size: inherit;
	    line-height: normal;
	    vertical-align: middle;
	    background-color: #fdfdfd;
	    cursor: pointer;
	    border: 1px solid #ebebeb;
	    border-bottom-color: #e2e2e2;
	    border-radius: .25em;
	}
	
	/* named upload */
	.filebox .upload-name {
	    display: inline-block;
	    padding: .5em .75em;
	    font-size: inherit;
	    font-family: inherit;
    	line-height: normal;
    	vertical-align: middle;
    	background-color: #f5f5f5;
	  	border: 1px solid #ebebeb;
	  	border-bottom-color: #e2e2e2;
	  	border-radius: .25em;
	  	-webkit-appearance: none;
	  	-moz-appearance: none;
	  	appearance: none;
	}
	
	.filebox.bs3-primary label {
	  	color: #fff;
	    background-color: #337ab7;
	    border-color: #2e6da4;
	}
</style>
</head>
<body>
<h3>파일 업로드 폼 입니다.</h3>
	<div class="row">
        <div class="col-sm-6 col-sm-offset-3">

            <form action="upload.do" method="post" 
                enctype="multipart/form-data" id="galleryform">
                <div class="form-group">
                    <label for="title">제목</label>
                    <input type="text" class="form-control" name="title" id="title"/>
                </div>
                <div class="filebox bs3-primary">
                    <input class="upload-name" value="파일선택" disabled="disabled">
                    <label for="ex_filename">이미지 선택</label>
                    <br> 
                    <input type="file" name="file" id="ex_filename" class="upload-hidden"> 

                </div>
                <div class="form-group">
                    <label for="context">내용</label><br>
                    <textarea rows="4" cols="50" name="context" form="galleryform">Enter text here...</textarea>
                </div>
                
                <button type="submit" class="btn btn-primary">확인</button>
                
            </form>         
        </div>
    </div>
</form>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	  var fileTarget = $('.filebox .upload-hidden');

	    fileTarget.on('change', function(){
	        if(window.FileReader){
	            var filename = $(this)[0].files[0].name;
	        } else {
	            var filename = $(this).val().split('/').pop().split('\\').pop();
	        }

	        $(this).siblings('.upload-name').val(filename);
	    });
	}); 
</script>
</body>
</html>














