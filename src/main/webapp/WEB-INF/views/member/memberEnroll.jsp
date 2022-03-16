<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="CORE_METHOD" name="title"/>
</jsp:include>
		<div id="enrollCont">
			<div class="register">
				<!-- validation 함수를 실행한 뒤 함수가 false를 리턴하면 form의 전송을 막는다. -->
				<form 
					action="${pageContext.request.contextPath }/member/memberEnroll.do"
					method="POST"
					id="memberEnrollFrm"				
					onsubmit="return validation()" 
					>
					<div class="mem_copy">필수 입력사항입니다.</div>
					<input type="text" id="posibleCode" />
					<table class="register_type">
						<colgroup>
							<col width="14%">
							<col width="*">								         
						</colgroup>               
						<tbody>
							<tr>
								<th><span>회원ID</span></th>
								<td><input type="text" id="id" name="id" placeholder="4글자 이상 12글자 이하의 영소문자와 숫자" style="width:500px;">
								<button type="button" id="idDupleBtn" class="button_type memberegister ml5">중복확인</button></td>										                                             
							</tr>
							<tr id="idDupleMsg">
					
							</tr>
							<tr>
								<th><span>이름</span></th>
								<td><input type="text" id="name" name="name" placeholder="이름을 입력해주세요" style="width:500px;">								
							</tr> 
							<tr>
								<th><span>비밀번호</span></th>
								<td><input type="text" id="pwd" name="pwd" placeholder="4글자 이상 12글자 이하의 영소문자와 숫자" style="width:500px;"></td>										                                            
							</tr>    
							<tr>
								<th><span>비밀번호확인</span></th>
								<td><input type="text" id="checkPwd" name="checkPwd"placeholder="비밀번호 확인" style="width:500px;"></td>										                                            
							</tr> 
							<tr>
								<th><span>생년월일</span></th>
								<td><input type="date" id="birthDate" name="birthDate" style="width:500px;"></td>										                                            
							</tr> 
							<tr>
								<th><span>회원유형</span></th>
								<td>
									<select id="memberType" name="memberType" style="width:500px;">
										<option value="0"> === 회원 유형 선택 === </option>
										<option value="admin">관리자</option>
										<option value="general">일반회원</option>
									</select>
								</td>										                                            
							</tr>
						</tbody>
					</table>
					<div class="buttonframe">
						<button class="custom-btn btn-ani3 btenw"><span>등록</span></button>
					</div>
				</form>
			</div>
		</div>
		
		<script>
			/* 중복확인 버튼 클릭시 비동기 처리를 통해 중복검사 실행 */
			$("#idDupleBtn").click(e=>{
				var inputId = $("#id").val();
				console.log("아이디 중복검사");
				$.ajax({
					url:"${pageContext.request.contextPath}/member/idDuplicate.do",
					data:{"inputId":inputId},
					contextType : "application/json; charset=utf-8",
					success(data){
						console.log(data);
						/* #idDupleMsg 태그의 내용을 해당 문자열로 채운다. */
						$("#idDupleMsg").html(`<th>사용가능 여부</th><td><span>\${data.msg}</span></td>`);
						
						/* controller에서 받은 posibleCode값에 따라 문자열의 색 분기처리 */
						if(data.posibleCode == 1){
							$("#idDupleMsg span").css("color","blue");
						}else{
							$("#idDupleMsg span").css("color","red");
							
						}
						/* form 유효성 검사를 할 때 사용할 posibleCode값을 넣어준다. */
						$("#posibleCode").val(data.posibleCode);
					},
					error:console.log
					
				});
			});
			
			/* 중복검사 후 입렧한 ID를 바꿀 경우를 대비해 ID값이 바뀌면 posibleCode을 초기화한다.  */
			$("#id").change(e=>{
				console.log("ID 변경");
				
				/* posibleCode 값 초기화 */
				$("#posibleCode").val(0);
			});
			
			
			/* 회원가입 form 유효성 검사 */
			function validation(){
				
				/* 사용자 입력값 변수에 담기 */
				var id = $("#id").val();
				var pwd = $("#pwd").val();
				var name = $("#name").val();
				var checkPwd = $("#checkPwd").val();
				var memberType = $("#memberType").val();
				var birthDate = $("#birthDate").val();
				var posibleCode = $("#posibleCode").val();
				
				// 아이디 체크
				if(!/^[a-z0-9]{4,12}$/.test(id)){
					alert("아아디는 4글자 이상 12글자 이하의 영소문자와 숫자의 조합으로 입력해주세요");
					$("#id").focus();
					return false;
				}
				// 이름 체크
				if(!/.{2,}/.test(name)){
					alert("이름을 확인해주세요");
					$("#name").focus();
					return false;
				}
				
				// 비밀번호 체크
				if(!/^[a-z0-9]{4,12}$/.test(pwd)){
					alert("비밀번호는 4글자 이상 12글자 이하의 영소문자와 숫자의 조합으로 입력해주세요.");
					$("#pwd").focus();
					return false;
				}
				
				// 비밀번호 확인 체크
				if(pwd != checkPwd){
					alert("비밀번호가 일치하지 않습니다.");
					$("#checkPwd").focus();
					return false;
				}
				// 생년월일 체크
				if(birthDate == ""){
					alert("생년월일을 선택해주세요.");
					$("#birthDate").focus();
					return false;
				}
				
				// 회원 유형 체크
				if(memberType == 0){
					alert("회원 유형을 선택해주세요.");
					return false;
				}
				
				// 중복검사 체크
				if(posibleCode == 0){
					alert("중복검사를 실행해주세요");
					return false;
				}
				
				return true;
			
			}
			
			
			
		</script>
			
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>