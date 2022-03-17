<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

			<nav>
				<h2><i class="fas fa-edit mr10"></i>게시판</h2>
				<ul id="navBoardList">
					<!-- 로그인한 회원의 권한 == ('ad' or 'sd') 게시판 생성 버튼이 활성화 -->
					<c:if test="${loginMember.getAuthority() eq 'ad' or loginMember.getAuthority() eq 'sd' }">
						<li><button id ="createBoardBtn">게시판 생성</button></li>		
					</c:if>
					
				</ul>
			</nav>
