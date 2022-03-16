<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<meta charset="UTF-8">
<title>multiBoard</title>

<!-- Jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- css 파일 불러오기 -->
<link href="${pageContext.request.contextPath }/resources/core/css/style.css" rel="stylesheet">


<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>


</head>
<c:if test="${not empty msg}">
<script>
alert("${msg}");
</script>
</c:if>
<body>
	<div id="wrap">
		<div id="header">
			<span id="mainTitle">CORE_METHOD</span>
			<a id="loginLink" href="${pageContext.request.contextPath }/member/memberLogin.do">로그인</a>
		</div>		
		
		
<script>
$("#mainTitle").click(e=>{
	console.log("mainTitle 클릭");
	location.href="${pageContext.request.contextPath}/";
}); 

</script>
