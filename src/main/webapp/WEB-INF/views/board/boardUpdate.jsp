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
	

	<h2>게시글 수정하기</h2>

	<form name="updatForm" method="post" action="/tys/board/update">
		<div>
			수정자 <input name="b_updateuser" id="updateuser" size="5" value="${userInfo.user_id} " readonly="readonly">
		</div>
		
		<div>
			<input name="b_num" type="hidden" value="${param.b_num}">
			제목 <input name="b_title" id="title" size="80" value="${param.b_title}">
		</div>
		
		<div>
			내용
			<textarea name="b_content" id="content" rows="4" cols="80"
				>${param.b_content}</textarea>
		</div>
		
		<div style="width: 650px; text-align: center;">
			<button type="reset">되돌리기</button>
			<button id="submit">수정하기</button>
		</div>
	</form>
	
	
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