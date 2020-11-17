<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<title>test</title>
</head>

<body>
	<!-- partial:partials/header.jsp -->	
	<%@ include file="../partials/header.jsp"%>
	<!-- partial -->


	<script>
		function moveWrite() {
		location.href = "/tys/board/write";
	}
	</script>

	<h2>게시판</h2>

	<!-- 키워드 검색 폼 -->
	<form name="form1" method="post" action="/tys/board/selectedList" class="form-inline my-2 my-lg-0">
		<select name="searchOption">
			<!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
			<option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}" />>작성자+내용+제목</option>
			<option value="b_userid" <c:out value="${map.searchOption == 'b_userid'?'selected':''}" />>작성자</option>
			<option value="b_content" <c:out value="${map.searchOption == 'b_content'?'selected':''}" />>내용</option>
			<option value="b_title" <c:out value="${map.searchOption == 'b_title'?'selected':''}" />>제목</option>
		</select> <input class="form-control mr-sm-2" name="keyword" value="${map.keyword}"> <input type="submit"  class="btn btn-secondary my-2 my-sm-0" value="조회">
		<button class="form-control mr-sm-2" type="button" id="btnWrite" onclick="moveWrite()">글쓰기</button>
	</form>


	<table border="1">

		<tr>
			<th>글번호</th>
			<th width="150px">제목</th>
			<th>작성자</th>
			<th>등록날짜</th>
			<th>조회수</th>
		</tr>

		<c:if test="${list } eq null">
			<tr>
				<td colspan="5">등록된 게시글이 없습니다.</td>
			</tr>
		</c:if>

		<c:forEach var="row" items="${list }">
			<tr>
				<td>
					<c:out value="${row.b_num}"></c:out>
				</td>
				<td><a href="/tys/board/boardDetail?b_num=${row.b_num}">
						<c:out value="${row.b_title }"></c:out>
					</a></td>
				<td>
					<c:out value="${row.b_userid }"></c:out>
				</td>
				<td>
					<c:out value="${row.b_date }"></c:out>
				</td>
				<td>
					<c:out value="${row.b_cnt }"></c:out>
				</td>
			</tr>
		</c:forEach>

	</table>

	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
</body>

</html>