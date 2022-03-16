<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="CORE_METHOD" name="title"/>
</jsp:include>
		<div id="loginCont">
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
		                    <div class="btnbox">
			                    <button id="loginBtn" class="custom-btn btn-ani1"><span>Login</span></button>
			                    <button id="registerBtn"class="custom-btn btn-ani1"><span>Register</span></button>
		                    </div>                   
		                </div>                
		            </div>
				</div>
			</div>
		</div>
		
		<script>
		$("#registerBtn").click(e=>{
			location.href="${pageContext.request.contextPath}/member/memberEnroll.do";
		});
		</script>
			
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>