<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="CORE_METHOD" name="title"/>
</jsp:include>

		<div id="cont">
			<!-- nav 가져오기  -->
			<jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include> 
			<div class="contents">
				<div class="container">
					<div class="inner">
						<h3>게시물 등록</h3>
						<form 
							action="${pageContext.request.contextPath}/post/createPost.do"
							method="POST">			
							<table class="detail_type">
								<colgroup>
								<col width="80">
								<col width="*">								         
								</colgroup>               
								<tbody>
									<tr>
										<th>제목</th>
										<!-- 게시판의 code 값 전달 -->
										<input type="hidden" id="boardCode" name="boardCode" value="${board.boardCode }" />
										
										<!-- 현재 로그인 회원 id 값 전달 -->
										<input type="text" id="loginMemberId" name="loginMemberId" value="${loginMember.id }"/>
										
										<td><input type="text" id="title" name="title" class="block"></td>										                                             
									</tr>  
									<tr>
										<th>내용</th>
										<td>
											<div class="teatareabox">
												<textarea name="content" id="content" cols="30" rows="12" placeholder="내용을 입력해주세요"></textarea>
											</div>
										</td>										                                            
									</tr>  
									<!-- 게시판의 첨부파일 허용 여부가 Y일때만 노출한다. -->
									<c:if test="${board.attachYn == 'N' }">
									<tr>
										<th>첨부</th>
										<td>
											<div class="filebox bs3-primary">
												<input class="upload-name" value="파일선택"  disabled="disabled">				
												<label for="ex_filename" class="ml2">파일찾기</label> 
												<input type="file" id="ex_filename" class="upload-hidden"> 
											</div>
										</td>										                                            
									</tr>  							     
									</c:if>  
								</tbody>
							</table>
							<div class="btn-wrap">
								<button type="submit" class="btn4 btn-darkblue mr5">등록</button><button type="button" class="btn4 btn-gray">취소</button>
							</div>
						</form>
					</div>				
				</div>
			</div>		
		<!-- #cont 끝 -->	
		</div>
		

	<script>
	
	/* input 태그에 파일명 넣어주기 (제공) */
	$(document).ready(function(){
		var fileTarget = $('.filebox .upload-hidden');

		fileTarget.on('change', function(){
				if(window.FileReader){
						var filename = $(this)[0].files[0].name;
				} else {
						var filename = $(this).val().split('/').pop().split('\\').pop();
				}

				$(this).siblings('.upload-name').val(filename);
		});
	}); 
	</script>
		
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>