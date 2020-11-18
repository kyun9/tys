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
			<button type="reset">되돌리기</button>
			<button id="submit">수정하기</button>
		</div>
	</form>
	
	
<script>
</script>

</body>
</html>