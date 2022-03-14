<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

 <jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="데브런" name="title"/>
</jsp:include>
<style>
#contentContainer{width:100vw;min-height: 800px; background-color: #80808036}
#contentContainer{display: flex;}
</style>

<div id=contentContainer>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>
	<div id="content">
		<h1>본문</h1>
	</div>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>   