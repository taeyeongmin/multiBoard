<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
		
		<footer>
			<h3>COPYRIGHT 2022 COREMETHOD. ALL RIGHTS RESERVED.</h3>
		</footer>
	</div>
	
<script>

/* 로그인 후 이름을 누르면 로그아웃 할 수 있는 버튼 노출 */
$("#afterLogin").click(e=>{
	console.log("test");
	$("#logoutBtn").toggle("500",e=>{
		$(this).css("display","inline");
	});
});

/* 로그아웃 버튼 클릭시 로그아웃 처리 */
$("#logoutBtn").click(e=>{
	location.href="${pageContext.request.contextPath}/member/memberLogout.do";
});


/* 메인 타이틀 클릭시 index 페이지로 이동 */
$("#mainTitle").click(e=>{
	console.log("mainTitle 클릭");
	location.href="${pageContext.request.contextPath}/";
}); 


/* 게시판 생성 클릭 이벤트 */
$("#createBoardBtn").click(e=>{
	console.log("게시판 생성");
	location.href="${pageContext.request.contextPath}/board/createBoard.do";
});

/* 페이지가 load 될때마다 이벤트 발생 */
$(()=>{
	console.log("페이지 로딩");
	$.ajax({
		url : "${pageContext.request.contextPath}/board/boardList.do",
		contentType : "application/json; charset=utf-8",
		success(data){
			console.log(data);
			
			/* 응답 받은 데이터 중 boardList를 꺼내서 변수에 담는다. */
			const boardList = data.boardList;
			console.log(boardList);
			
			/* 반복문 내에서 boardName 값을 담을 함수 선언 */
			

			/* 변수 list에 boardList 내의 boardName 값을 담아준다 */
			let list = "";
			for(let i = 0; i < boardList.length; i++){
				list = list + `<li class="board-title"><a href="${pageContext.request.contextPath}/?boardCode=${boardList[i].boardCode}">\${boardList[i].boardName}</a></li>`;	
			}

			/* #navContainer의 ul태그 내부에 list에 담아둔 문자열을 찍는다. */
			$("#navBoardList").append(list);
			
			
		},
		error : console.log
		
	});
	
});

</script>


</body>

</html>