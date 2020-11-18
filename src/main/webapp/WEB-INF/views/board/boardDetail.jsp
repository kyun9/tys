<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<!-- partial:partials/header.jsp -->
	<%@ include file="../partials/header.jsp"%>
	<!-- partial -->
	

	<h2>게시글 조회</h2>

	<form name="updatForm" method="get" action="/tys/board/boardUpdate">
		<input name="b_num" type="hidden" value="${detail.b_num }">
		
		<div>
			작성자 : ${detail.b_userid}
			<%-- <input name="b_userid" id="userid" size="80" value="${detail.b_userid}"   
				readonly="readonly"> --%>
		</div>
		
		<div>
			제목 <input name="b_title" id="title" size="80" value="${detail.b_title}"
				readonly="readonly">
		</div>
		
		<div>
			내용
			<textarea name="b_content" id="content" rows="4" cols="80"
				readonly="readonly">${detail.b_content}</textarea>
		</div>
		

		<div style="width: 650px; text-align: center;">
			<button type="submit">수정하기</button>
		</div>
	</form>

	<button id="boardDelete">삭제하기</button>


	<script>
$(function() {
	$("#boardDelete").click(function(){
		alert("삭제하기 클릭");		
		location.href='/tys/board/boardDelete?b_num=${detail.b_num}';
	});
});

</script>
<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
</body>
</html>