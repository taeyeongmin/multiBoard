<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style>
body{margin:0}
/*nav스타일 */
#navContainer ul{display: flex;flex-direction: column; justify-content: space-around;}
#navContainer li{font-size: 20px; font-weight: 600}
#navContainer{width:200px}
#headTitle{height: 80px; background-color: yellow; padding-top: 1px; text-align: center}
#loginContainer{height: 40px; background-color: black; text-align: end; padding-top: 10px;}
#loginContainer a{color:#2196f3; margin:5px 15px 0px 0px; font-size: 20px}

button:hover{cursor:pointer}
.use-btn{color: white;background-color: #3f51b5d6;width: 300px;height: 30px;border: 0px;border-radius: 4px; font-weight: bold;}
#headTitle:hover{cursor:pointer; text-shadow: 1px 1px  1px grey;}
</style>

<c:if test="${not empty msg}">
	<script>
		alert("${msg}");
	</script>
</c:if>

<body>
	<div id="rootContainer">
		<header>
			<div id="loginContainer">
				<a href="${pageContext.request.contextPath }/member/memberLogin.do">로그인</a>
			</div>
			<div id="headTitle">
				<h1 id="titleLink">CORE_TY</h1>
				${msg}
			</div>
		</header>
		<section>
		
<script>
$("#titleLink").click(e=>{
	location.href="${pageContext.request.contextPath}/";
});
</script>