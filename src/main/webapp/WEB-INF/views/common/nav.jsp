<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>    

<div id="navContainer">
	<ul>
		
	</ul>
</div>

<script>

/* 페이지가 load 될때마다 이벤트 발생 */
$(()=>{
	console.log("페이지 로딩");
	$.ajax({
		url : "${pageContext.request.contextPath}/common/navLoding.do",
		contentType : "application/json; charset=utf-8",
		success(data){
			console.log(data);
			
			/* 응답 받은 데이터 중 boardList를 꺼내서 변수에 담는다. */
			const boardList = data.boardList;
			console.log(boardList);
			
			/* 반복문 내에서 boardName 값을 담을 함수 선언 */
			

			/* 변수 list에 boardList 내의 boardName 값을 담아준다 */
			for(let i = 0; i < boardList.length; i++){
				var list +=	`<li>\${boardList[i].boardName}</li>`;				
			}

			/* #navContainer의 ul태그 내부에 list에 담아둔 문자열을 찍는다. */
			$("#navContainer ul").html(list);
			
		},
		error : console.log
		
	});
	
});
</script>