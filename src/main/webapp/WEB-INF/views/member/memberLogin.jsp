
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="CORE_TY" name="title"/>
</jsp:include>

<link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/all.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/font.css" rel="stylesheet">

 
    <div id="loginWrap">
        <div class="login-bx">           
            <div class="loginframe">
                <div class="logininbx">
                    <h1>LOGIN</h1>
                    <ul>
                        <li><label for="id">Member ID</label><input type="text" id="id" class="block"></li>
                        <li><label for="pwd">Password</label><input type="text" id="pwd" class="block"></li>
                        <!-- <li><input type="checkbox" id="remember"><label for="remember">Remember me</label><span><a href="#a">Forgot Password</a></span></li> -->
                    </ul>
                    <div class="btnbox"><button class="custom-btn btn-ani1"><span>Login</span></button><button class="custom-btn btn-ani1"><span>Register</span></button></div>                   
                </div>                
            </div>
        </div>
    </div>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
