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
<style>
form {
	margin: 0 auto;
	width: 600px;
}

input[type=text], select {
	width: 50%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

</style>
<body>
<!-- partial:partials/header.jsp -->
	<%@ include file="../partials/header.jsp"%>
	<!-- partial -->

	<h2 style="margin: 0 auto;
	width: 560px;
	text-align: center;">공지사항 조회</h2>

<%-- 
	<table class="board_view" border="1">
		<colgroup>
			<col width="15%">
			<col width="35%">
			<col width="15%">
			<col width="*">
		</colgroup>

		<tbody>
			<tr>
				<th>제목</th>
				<td>${detail.title}</td>
				<th>수정시간</th>
				<td>"detail.updateDate"</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>user테이블 추가후 세션에서 값 받아오기</td>
				<th>등록시간</th>
				<td>${detail.regdate }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">${detail.content }</td>
			</tr>
		</tbody>
	</table>
 --%>
	<form name="updatForm" method="get" action="/tys/noticeBoard/noticeBoardUpdate">
		<input name="n_num" type="hidden" value="${detail.n_num }">
		
		<div>
			작성자 : ${detail.n_userid}
			<%-- <input name="n_userid" id="userid" size="80" value="${detail.n_userid}"   
				readonly="readonly"> --%>
		</div>
		
		<div>
			제목 <input name="n_title" id="title" size="80" value="${detail.n_title}"
				readonly="readonly">
		</div>
		
		<div>
			내용
			<textarea name="n_content" id="content" rows="4" cols="80"
				readonly="readonly">${detail.n_content}</textarea>
		</div>
		

		<div style="width: 650px; text-align: center;">
			<button type="submit" class="btn btn-primary">수정하기</button>
			<button id="noticeBoardDelete" class="btn btn-secondary">삭제하기</button>
		</div>
	</form>

	


	<script>
$(function() {
	$("#noticeBoardDelete").click(function(){
		alert("삭제하기 클릭");		
		location.href='/tys/noticeBoard/noticeBoardDelete?n_num=${detail.n_num}';
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