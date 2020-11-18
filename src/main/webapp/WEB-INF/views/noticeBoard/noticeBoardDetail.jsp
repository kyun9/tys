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
	<h2>공지사항 조회</h2>

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
			<button type="submit">수정하기</button>
		</div>
	</form>

	<button id="noticeBoardDelete">삭제하기</button>


	<script>
$(function() {
	$("#noticeBoardDelete").click(function(){
		alert("삭제하기 클릭");		
		location.href='/tys/noticeBoard/noticeBoardDelete?n_num=${detail.n_num}';
	});
});

</script>

</body>
</html>