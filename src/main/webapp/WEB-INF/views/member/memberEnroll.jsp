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
<title>회원가입</title>


<style>
#contentContainer{width:100vw; min-height:600px; padding-top:130px; text-align: -webkit-center;}	
#content{width:450px}
#contentTitle{text-align: center;}


#enrollFrm{text-align: -webkit-auto; margin-bottom: 160px; margin-left:58px}
#enrollFrm input{width:300px; height:25px; margin-bottom: 10px; }
#enrollFrm h4{margin:12px 0 10px 0}
.data-title{text-align: start}
.duplicate-btn{width:67px; margin-left:17px}

</style>
	<div id="contentContainer">
		<div id="content">
			<div id="contentTitle">
				<h1>회원가입</h1>
			</div>
			
			<form	
				id="enrollFrm"
				name="enroll-form"
				method="POST"
				action="${pageContext.request.contextPath}/member/memberEnroll.do">	
							
				<div class="data-title"><h4>아이디</h4></div>			
				<input type="text" id="id" name="id" placeholder="아이디" required><button id="idDupleBtn" class="use-btn duplicate-btn">중복검사</button><br />
				
				<div class="data-title"><h4>닉네임</h4></div>			
				<input type="text" id="nick" name="nick" placeholder="닉네임" required><button id="nickDupleBtn" class="use-btn duplicate-btn">중복검사</button><br />
				
				<div class="data-title"><h4>이름</h4></div>			
				<input type="text" id="name" name="name" placeholder="이름" required>
				
				<div class="data-title"><h4>비밀번호</h4></div>			
				<input type="password" id="pwd" name="pwd" placeholder="비밀번호" required/>
				
				<div class="data-title"><h4>비밀번호 확인</h4></div>			
				<input type="password" id="checkPassword" name="checkPassword" placeholder="비밀번호 화인" required/>
				
				<div class="data-title"><h4>생년월일</h4></div>			
				<input type="Date" id="birthDate" name="birthDate" placeholder="생년월일" required/>
				
			
				<button id="enrollMemberBtn" class="use-btn">회원가입</button>
				
				<br /><br />
			</form>
		</div>
	</div>
	<br /><hr />

	<script>
	$("#enrollMemberBtn").click(e=>{
		location.href="${pageContext.request.contextPath}/member/memberEnroll.do";
	});
	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>