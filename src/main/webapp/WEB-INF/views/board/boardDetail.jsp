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
	text-align: center;">게시글 조회</h2>

	<form name="updatForm" method="get" action="/tys/board/boardUpdate">
		<input name="b_num" type="hidden" value="${detail.b_num }">

		<div>
			작성자 <input value="${detail.b_userid}" readonly="readonly" size="3">
			수정자 <input value="${detail.b_updateuser}" readonly="readonly"
				size="3">
		</div>

		<div>
			제목 <input name="b_title" id="title" size="80"
				value="${detail.b_title}" readonly="readonly">
		</div>

		<div>
			내용
			<textarea name="b_content" id="content" rows="4" cols="80"
				readonly="readonly">${detail.b_content}</textarea>
		</div>


		<div style="width: 650px; text-align: center;">
			<!-- 권한에 따라 수정하기 버튼 표시 여부 결정 -->
			<c:if
				test="${(userInfo.user_position == 1) or (userInfo.user_id == detail.b_userid) or (userInfo.user_position == 2 and userInfo.user_deptno == detail.b_type) }">
				<button type="submit" class="btn btn-primary">수정하기</button>
			</c:if>
			<!-- 총괄관리자 또는 이 게시글의 작성자 또는 해당 부서 관리자일 경우에만 삭제 버튼 표시 -->
			<c:if
				test="${(userInfo.user_position == 1) or (userInfo.user_id == detail.b_userid) or (userInfo.user_position == 2 and userInfo.user_deptno == detail.b_type) }">
				<input type="button" id="boardDelete" class="btn btn-secondary" value = "삭제"/>
			</c:if>

		</div>
	</form>



	<script>
		$(function() {
			// 삭제하기 버튼 클릭시 확인, 취소 버튼있는 경고창 띄우기
			$("#boardDelete")
					.click(
							function() {
								if (confirm("게시글을 삭제하시겠습니까?") == true) {
									location.href = '/tys/board/boardDelete?b_num=${detail.b_num}';
								}
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