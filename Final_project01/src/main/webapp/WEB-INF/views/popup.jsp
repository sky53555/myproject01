<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PopUp</title>
</head>
<body>
<h1>All About Event</h1>



<div id="close"> 
    <form name="form1">
        <input type="checkbox" name="popup" value=""> 
        <font size="2" face="돋움" style="color:#000;">오늘하루 그만보기</font><a href="javascript:onclick=closeWin()">[닫기]</a>  
    </form>
</div>



<script>


function setCookie(name, value, expiredays) { 
var todayDate = new Date(); 
todayDate.setDate( todayDate.getDate() + expiredays ); 
document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
};

function closeWin() { 
if (document.form1.popup.checked) 
setCookie( "popup", "done" , 1); 
self.close(); 
};



</script>

</body>
</html>