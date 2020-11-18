<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js">
	$(document).ready(function() {
		$("#btnWrite").click(function() {
			// 페이지 주소 변경(이동)
			location.href = "/tys/noticeBoard/write";
		});
	});
</script>

</head>

<body>

	<script>
		function moveWrite() {
			location.href = "/tys/noticeBoard/write";
		}
	</script>
	<h2>공지사항 목록</h2>
	<form name="form1" method="post" action="/tys/noticeBoard/selectedList">
		<select name="searchOption">
			<!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
			<option value="all"
				<c:out value="${map.searchOption == 'all'?'selected':''}"/>>작성자+내용+제목</option>
			<option value="n_userid"
				<c:out value="${map.searchOption == 'n_userid'?'selected':''}"/>>작성자</option>
			<option value="n_content"
				<c:out value="${map.searchOption == 'n_content'?'selected':''}"/>>내용</option>
			<option value="n_title"
				<c:out value="${map.searchOption == 'n_title'?'selected':''}"/>>제목</option>
		</select> <input name="keyword" value="${map.keyword}"> <input
			type="submit" value="조회">
		<button type="button" id="btnWrite" onclick="moveWrite()">글쓰기</button>
	</form>

	<table border="1" width="600px">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>

		<c:forEach var="row" items="${map.list}">
			<tr>
				<td>${row.n_num}</td>
				<td><a
					href="/tys/noticeBoard/noticeBoardDetail?n_num=${row.n_num}">${row.n_title}</a></td>
				<td>${row.n_userid}</td>
				<td>
					<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 --> <c:out value="${row.n_date }"></c:out>
				</td>
				<td>${row.n_cnt }</td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>