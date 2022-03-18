<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="CORE_METHOD" name="title"/>
</jsp:include>
	<div id="cont">
			<!-- nav 가져오기 -->
			<jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>
			<div class="contents">
				<div class="container">
					<div class="inner">
						<form
							action="${pageContext.request.contextPath}/board/insertBoard.do"
							method="POST"
							onsubmit="return duplicateBoard()"
							>
							
							<h3>게시판 생성</h3>
							
							<!-- 유효성 검사에서 사용할 값 -->
							<input type="hidden" id="posibleCode" />
							<!-- 유효성 검사에서 권한검사에 사용할 값 -->
							<input type="hidden" id="authorityCheck" value="${loginMember.authority }" />
							<table class="board">
								<colgroup>
								<col width="15%">
								<col width="*">								         
								</colgroup>               
								<tbody>
									<tr>
										<th>게시판명</th>
										<td><input type="text" id="boardName" name="boardName" placeholder="게시판 이름을 입력해주세요"></td>	
										<td id="buttonContainer"><button id="duplicateBoardName" type="button">중복검사</button></td>									                                             
									</tr>  
									<tr id="boardDupleMsg">
					
									</tr>
									<tr>
										<th>게시판 타입</th>
										<td>
											<select id="boardType" name="boardType">
												<option value="L">리스트형</option>
												<option value="F">액자형</option>
											</select>
										</td>										                                            
									</tr>
									<tr class="pd20">
										<th>게시판 공개</th>
										<td>
											<input type="radio" id="boardYn1" name="boardYn" value="Y">
											<label for="boardYn1" class="mr30">예</label>
											
											<input type="radio" id="boardYn2" name="boardYn" value="N">
											<label for="boardYn2">아니오</label>
										</td>										                                            
									</tr>
									<tr>
										<th>첨부파일 허용</th>
										<td>
											<input type="radio" id="attachYn1" name="attachYn" value="Y"><label for="attachYn1" class="mr30">예</label>
											<input type="radio" id="attachYn2" name="attachYn" value="N"><label for="attachYn2">아니오</label>
										</td>										                                            
									</tr>    
									<tr>
										<th>첨부파일갯수</th>
										<td>
											<input id="attachCount" name="attachCount" type="number" value="0" min="0" max="5"  />
										</td>										                                            
									</tr>
									<tr>
										<th>페이지 게시물 수</th>
										<td>
											<input id="pageCount" name="pageCount" type="number" value="10" min="5" max="15"  />
										</td>										                                            
									</tr> 
									<tr>
										<th>페이지바 표시 갯수</th>
										<td>
											<input id="pagebarCount" name="pagebarCount" type="number" value="5" min="3" max="10"  />
										</td>										                                            
									</tr> 
									<tr>
										<th>댓글여부</th>
										<td>
											<input type="radio" id="commentYn1" name="commentYn" value="Y"><label for="commentYn1" class="mr30">예</label>
											<input type="radio" id="commentYn2" name="commentYn" value="N"><label for="commentYn2">아니오</label>
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
			</div>
		<!-- #cont 끝 -->	
		</div>
		
	<script>
	
	// 게시판 이름 중복 검사
	$("#duplicateBoardName").click(e=>{
		var boardName = $("#boardName").val();
		console.log("게시판명 중복검사");
		$.ajax({
			url:"${pageContext.request.contextPath}/board/boardNameDuplicate.do",
			data:{"boardName":boardName},
			contextType : "application/json; charset=utf-8",
			success(data){
				console.log(data);
				
				/* #idDupleMsg 태그의 내용을 해당 문자열로 채운다. */
				$("#boardDupleMsg").html(`<th>사용가능 여부</th><td><span>\${data.msg}</span></td>`);
				
				/* controller에서 받은 posibleCode값에 따라 문자열의 색 분기처리 */
				if(data.posibleCode == 1){
					$("#boardDupleMsg span").css("color","blue");
				}else{
					$("#boardDupleMsg span").css("color","red");
					
				}
				/* form 유효성 검사를 할 때 사용할 posibleCode값을 넣어준다. */
				$("#posibleCode").val(data.posibleCode);
			},
			error:console.log
			
		});
	});
	
	/* 중복검사 후 입렧한 이름을 바꿀 경우를 대비해 boardName값이 바뀌면 posibleCode을 초기화한다.  */
	$("#boardName").change(e=>{
		console.log("boardName 변경");
		
		/* posibleCode 값 초기화 */
		$("#posibleCode").val(0);
	});
	
	
	// 게시판 생성 유효성 검사
	function duplicateBoard(){
		
		// 게시판명 유효성 검사
		if($("#boardName").val() == ""){
			alert("게시판명을 확인해주세요");
			$("#boardName").focus();
			return false;
		}
		
		// 게시판 공개 유효성 검사 - 예,아니요 둘다 선택이 안되어 있는 경우
		if(  $("#boardYn1").prop("checked") == false && $("#boardYn2").prop("checked") == false ) {
			
			console.log("게시판 체크 여부 = ", $("input[name=boardYn]").prop("checked"));
			alert(" 게시판 공개 여부를 선택해주세요.");
			return false;			
		}
		
		// 첨부파일 허용 - 예,아니요 둘다 선택이 안되어 있는 경우
		if( $("#attachYn1").prop("checked") == false && $("#attachYn2").prop("checked") == false ){
			
			console.log("첨부파일 체크 여부 = ", $("input[name=attachYn]").prop("checked"));
			
			alert("첨부파일 허용 여부를 선택해주세요.");
			return false;			
		}
		
		// 중복검사 체크
		if($("#posibleCode").val() == 0){
			alert("중복검사를 실행해주세요");
			return false;
		}
		
		// 댓글 허용
		if( $("#commentYn1").prop("checked") == false && $("#commentYn2").prop("checked") == false  ){
			console.log("첨부파일 체크 여부 = ", $("input[name=commentYn]").prop("checked") == false);
			alert("댓글 허용 여부를 선택해주세요.");
			return false;			
		}
		
		// 일반 회원이 url을 알고 게시판 생성 테이블에 들어왔을 경우를 대비하여 권한 검사를 한 뒤 전송
		var authority = $("#authorityCheck").val();
		
		if(authority == 'ad' || authority == 'sd' || authority == ""){
			alert(" ==== 게시판 생성은 관리자만 할 수 있습니다 =====");
			
			// 메인 타이틀을 클릭하게 만들어 index 페이지로 이동시킨다.
			$("#mainTitle").trigger("click");
			return false;
		}
	
	}
	
	</script>
		
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>