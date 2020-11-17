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
	<h2>게시글 조회</h2>

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

</body>
</html>