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
	<h2>공지사항 수정하기</h2>

	<form name="updatForm" method="post" action="/tys/noticeBoard/update">
		<div>
			수정자 <input name="n_updateuser" id="updateuser" size="80" value="세션에서 받아올 값" readonly="readonly">
		</div>
		
		<div>
			<input name="n_num" type="hidden" value="${param.n_num}">
			제목 <input name="n_title" id="title" size="80" value="${param.n_title}">
		</div>
		
		<div>
			내용
			<textarea name="n_content" id="content" rows="4" cols="80"
				>${param.n_content}</textarea>
		</div>
		
		<div style="width: 650px; text-align: center;">
			<button type="reset" class="btn btn-secondary">되돌리기</button>
			<button id="submit" class="btn btn-primary">수정하기</button>
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