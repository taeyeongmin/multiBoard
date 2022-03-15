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
#contentContainer{width:100vw; min-height:600px; padding-top:130px; text-align: -webkit-center;}	
#content{width:330px}
#contentTitle{text-align: center;}
#loginFrm{text-align: center; margin-bottom: 160px;}
#loginFrm input{width:300px; height:25px; margin-bottom: 10px; }
.use-btn{color: white;background-color: #3f51b5d6;width: 300px;height: 30px;border: 0px;border-radius: 4px; font-weight: bold;}


</style>
	<div id="contentContainer">
		<div id="content">
			<div id="contentTitle">
				<h1>로그인</h1>
			</div>
			
			<form	
				id="loginFrm"
				name="login-form"
				method="POST"
				action="${pageContext.request.contextPath}/member/memberLogin.do">	
										
				<input type="text" id="id" name="id" placeholder="아이디" required><br />
				<input type="password" id="pwd" name="pwd" placeholder="비밀번호" required/>
				<br /><hr /><br />
				<button id="loginBtn" class="use-btn">로그인</button><br />
			</form>
			<button id="enrollMemberBtn" class="use-btn">회원가입</button>
		</div>
	</div>
	<br /><hr />

	<script>
	$("#enrollMemberBtn").click(e=>{
		location.href="${pageContext.request.contextPath}/member/memberEnroll.do";
	});
	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>