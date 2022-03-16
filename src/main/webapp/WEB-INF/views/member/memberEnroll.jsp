<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="CORE_METHOD" name="title"/>
</jsp:include>
		<div id="enrollCont">
			<div class="register">
				<div class="mem_copy">필수 입력사항입니다.</div>
				
				<table class="register_type">
					<colgroup>
						<col width="14%">
						<col width="*">								         
					</colgroup>               
					<tbody>
						<tr>
							<th><span>회원ID</span></th>
							<td><input type="text" id="id" name="id" placeholder="아이디를 입력해주세요" style="width:500px;">
							<button id="idDupleBtn" class="button_type memberegister ml5">중복확인</button></td>										                                             
						</tr>
						<tr id="idDupleMsg">
				
						</tr>  
						<tr>
							<th><span>비밀번호</span></th>
							<td><input type="text" placeholder="비밀번호를 입력해주세요" style="width:500px;"></td>										                                            
						</tr>    
						<tr>
							<th><span>비밀번호확인</span></th>
							<td><input type="text" placeholder="" style="width:500px;"></td>										                                            
						</tr> 
						<tr>
							<th><span>회원유형</span></th>
							<td>
								<select id="" name="" style="width:500px;">
									<option value="">관리자</option>
								</select>
							</td>										                                            
						</tr>
					</tbody>
				</table>
				<div class="buttonframe">
					<button class="custom-btn btn-ani3 btenw"><span>등록</span></button>
				</div>
			</div>
		</div>
		
		<script>
			/* 중복확인 버튼 클릭시 비동기 처리를 통해 중복검사 실행 */
			$("#idDupleBtn").click(e=>{
				var inputId = $("#id").val();
				console.log("아이디 keyup");
				$.ajax({
					url:"${pageContext.request.contextPath}/member/idDuplicate.do",
					data:{"inputId":inputId},
					contextType : "application/json; charset=utf-8",
					success(data){
						console.log(data);
						$("#idDupleMsg").html(`<th>사용가능 여부</th><td><span>\${data.msg}</span></td>`);
						if(data.posibleCode == 1){
							$("#idDupleMsg span").css("color","blue");
						}else{
							$("#idDupleMsg span").css("color","red");
							
						}
					},
					error:console.log
					
				});
			});
		</script>
			
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>