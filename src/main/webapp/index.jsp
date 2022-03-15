<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

 <jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="데브런" name="title"/>
</jsp:include>
<style>
#contentContainer{width:100vw; min-height:600px; background-color: #80808036}
#contentContainer{display: flex;}
#navContainer ul{list-style: none; padding-left:20px; height: 100%}
</style>


<div id=contentContainer>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>
	<div id="content">
		<div>1</div>
		<div>2</div>
		
	</div>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>   