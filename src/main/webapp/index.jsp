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
						<h3>메인 페이지</h3>
						<div class="new_registerframe"><button class="button_type boardregister">신규등록</button></div>
						<div class="search_inner">            
			            	<!--search fiels st-->
							<div class="search_col">
			              		<div class="row">                
			                  		<span class="serch_title">제목</span>
				                	<select name="" id="" style="width:180px;margin-right:3px;">
				                    	<option value="">선택하세요</option>
				                    </select>
									<input type="text" style="width:300px" placeholder="검색어를 입력하세요.">
			               		</div>               
				                <div class="row none">
									<div>
										<button class="button_type search"><i class="fas fa-search mr5"></i>검색</button>
									</div>         
				            	</div>
			            	</div>             
			            <!--//search fiels ed--> 
			            </div>
						<div class="list_inner">
							<div class="table_button">
								<button class="button_type tablebutton01 mr5">전체선택</button><button class="button_type tablebutton03">삭제</button>
								<span><button class="button_type tablebutton02"><i class="fas fa-file-excel mr5"></i>엑셀다운로드</button></span>		
							</div>
			                <table class="list_type">
				            	<colgroup>
				                	<col width="6%">
				                    <col width="4%">
				                    <col width="*">
				                    <col width="10%">
				                    <col width="8%">
				                    <col width="13%">
				                </colgroup>
				                <thead>
				                	<tr>
					                    <th></th>
					                    <th>순번</th>
					                    <th>제목</th>
					                    <th>등록일</th>
					                    <th>등록자</th>
					                    <th>조회수</th>                                  
				                	</tr>
				                </thead>
			               	 	<tbody>
			                    <tr>
				                    <td class="center"><input type="checkbox" id="ch01"><label for="ch01"></label></td>
				                    <td>7</td>
				                    <td><a href="#a">제목이 들어가는 자리</a></td>
				                    <td class="center">2022/03/01</td>
				                    <td class="center">홍길동</td>
				                    <td class="center">1,234</td>
			                    </tr>
			                    <tr>
				                    <td class="center"><input type="checkbox" id="ch02"><label for="ch02"></label></td>
				                    <td>6</td>
				                    <td><a href="#a">제목이 들어가는 자리</a></td>
				                    <td class="center">2022/03/01</td>
				                    <td class="center">홍길동</td>
				                    <td class="center">1,234</td>
			                    </tr>
			                    <tr>
				                    <td class="center"><input type="checkbox" id="ch03"><label for="ch03"></label></td>
				                    <td>5</td>
														<td><a href="#a">제목이 들어가는 자리</a></td>
				                    <td class="center">2022/03/01</td>
				                    <td class="center">홍길동</td>
				                    <td class="center">1,234</td>
			                    </tr>
			                    <tr>
				                    <td class="center"><input type="checkbox" id="ch04"><label for="ch04"></label></td>
				                    <td>4</td>
				                    <td><a href="#a">제목이 들어가는 자리</a></td>
									<td class="center">2022/03/01</td>
				                    <td class="center">홍길동</td>
				                    <td class="center">1,234</td>
			                    </tr>
			                    <tr>
				                    <td class="center"><input type="checkbox" id="ch05"><label for="ch05"></label></td>
				                    <td>3</td>
									<td><a href="#a">제목이 들어가는 자리</a></td>
				                    <td class="center">2022/03/01</td>
				                    <td class="center">홍길동</td>
				                    <td class="center">1,234</td>
			                    </tr>
			                    <tr>
				                    <td class="center"><input type="checkbox" id="ch06"><label for="ch06"></label></td>
				                    <td>2</td>
									<td><a href="#a">제목이 들어가는 자리</a></td>
									<td class="center">2022/03/01</td>
				                    <td class="center">홍길동</td>
				                    <td class="center">1,234</td>
			                    </tr>
			                    <tr>
				                    <td class="center"><input type="checkbox" id="ch07"><label for="ch07"></label></td>
				                    <td>1</td>
				                    <td><a href="#a">제목이 들어가는 자리</a></td>
				                    <td class="center">2022/03/01</td>
				                    <td class="center">홍길동</td>
				                    <td class="center">1,234</td>
			                	</tr>					                  
			                </tbody>
		                </table>
						<div class="paging-wrap">
							<div class="paging network">
								<a href="#" class="direction first">이전</a>
								<a href="#" class="direction prev">pre</a>
								<a href="#">1</a>
								<a href="#" class="on">2</a>
								<a href="#">3</a>
								<a href="#">4</a>
								<a href="#">5</a>
								<a href="#">6</a>
								<a href="#">7</a>
								<a href="#">8</a>
								<a href="#">9</a>
								<a href="#">10</a>
								<a href="#" class="direction next">next</a>
								<a href="#" class="direction last">다음</a>
							</div>
						<!-- .paging-wrap 끝 -->
						</div>
						<!-- .list_inner끝 -->	
            			</div>
            		<!-- .inner 끝  -->
					</div>				
				</div>
			<!-- #content 끝 -->	
			</div>
		<!-- #cont 끝 -->	
		</div>
		
	<script>
	
	</script>
		
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>