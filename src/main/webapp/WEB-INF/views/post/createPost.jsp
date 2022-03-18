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
						<table class="detail_type">
							<colgroup>
							<col width="80">
							<col width="*">								         
							</colgroup>               
							<tbody>
								<tr>
									<th>제목</th>
									<td><input type="text" class="block"></td>										                                             
								</tr>  
								<tr>
									<th>내용</th>
									<td>
										<div class="teatareabox">
											<textarea name="" id="" cols="30" rows="7" placeholder="여러분의 소중한 댓글을 입력해주세요"></textarea>
										</div>
									</td>										                                            
								</tr>    
								<tr>
									<th>첨부</th>
									<td>
										<div class="filebox bs3-primary">
											<input class="upload-name" value="파일선택" disabled="disabled">				
											<label for="ex_filename" class="ml2">파일찾기</label> 
											<input type="file" id="ex_filename" class="upload-hidden"> 
										</div>
									</td>										                                            
								</tr>  							     
							</tbody>
						</table>
						<div class="btn-wrap"><button class="btn4 btn-darkblue mr5">등록</button><button class="btn4 btn-gray">취소</button></div>
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