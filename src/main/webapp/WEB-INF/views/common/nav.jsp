<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>    

<div id="navContainer">
	<ul>
		<c:forEach items="${boardList}" var="board">
			<li>${board}</li>
		</c:forEach>
	</ul>
</div>

<script>
$(()=>{
	console.log("페이지 로딩");
	$.ajax({
		url : "${pageContext.request.contextPath}/common/navLoding.do",
		contentType : "application/json; charset=utf-8",
		success(data){
			console.log(data);
		},
		error : console.log
		
	});
	
});
</script>