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
			작성자 <input value="${detail.n_userid}" readonly="readonly" size="3">
			수정자 <input value="${detail.n_updateuser}" readonly="readonly"
				size="3">
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
			<c:if
				test="${(userInfo.user_position == 1) or (userInfo.user_id == detail.n_userid) or (userInfo.user_position == 2 and userInfo.user_deptno == detail.n_type) }">
				<button type="submit" class="btn btn-primary">수정하기</button>
			</c:if>
			<!-- 총괄관리자 또는 이 게시글의 작성자 또는 해당 부서 관리자일 경우에만 삭제 버튼 표시 -->
			<c:if
				test="${(userInfo.user_position == 1) or (userInfo.user_id == detail.n_userid) or (userInfo.user_position == 2 and userInfo.user_deptno == detail.n_type) }">
				<button id="boardDelete" class="btn btn-secondary">삭제하기</button>
			</c:if>
			</div>
	</form>

	


	<script>
$(function() {
	$("#noticeBoardDelete").click(function(){
		if (confirm("게시글을 삭제하시겠습니까?") == true) {
		location.href='/tys/noticeBoard/noticeBoardDelete?n_num=${detail.n_num}';
		}});
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