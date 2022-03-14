<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="CORE_TY" name="title"/>
</jsp:include>

<meta charset="UTF-8">
<title>로그인</title>

<c:if test="${param.error != null}">
<script>
alert("아이디 또는 비밀번호가 일치하지 않습니다.");
</script>
</c:if>

<style>
	
</style>

	<div id="contentContainer">
		<img src="${pageContext.request.contextPath }/resources/images/logo-devrun.png" id="title" />
		<form:form 
			name="login-form"
			method="POST"
			action="${pageContext.request.contextPath}/member/memberLogin.do">
						
			<div id="form-container">		
				<input type="text" id="id" name="id" placeholder="아이디" required><br />
				<input type="password" id="password" name="password" placeholder="비밀번호" required/><br />
			<div/>	
			<div id="find-container">
				<span class="find" id="member-enroll"><a href="${pageContext.request.contextPath}/member/memberEnroll.do">회원가입</a></span>
			</div>
				<button id="login-btn" type="submit">로그인</button>
		</form:form>
	</div>
	<br /><hr />


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>