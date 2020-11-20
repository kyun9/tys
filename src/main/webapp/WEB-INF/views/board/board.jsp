<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>test</title>
</head>
<style>
table {
	margin-left: auto;
	margin-right: auto;
}

h3 {
	text-align: center;
}

#buttonDiv {
	margin: 0 auto;
	width: 560px;
	text-align: center;
}
</style>
<body>
	<!-- partial:partials/header.jsp -->
	<%@ include file="../partials/header.jsp"%>
	<!-- partial -->


	<script>
		function moveWrite() {
			location.href = "/tys/board/write";
		}

		function changeValue(e) {
			var val = $(e).attr('id')
			
			if(val ==9){
				location.href ="/tys/board/list";
			}else{
				$('#form1').attr("action", "/tys/board/list");
				$('#teamNum').attr('value', val);
				form1.submit();				
			}
		}
	</script>
	<div id="buttonDiv">
		<!-- 키워드 검색 폼 -->
		<h3 class="display-3">게시판</h3>
		<!-- 키워드 검색 폼 -->
		<form name="form1" id="form1" method="get" action="/tys/board/selectedList"
			class="form-inline my-2 my-lg-0">
			<div>
			<select name="searchType" class="form-control">
				<!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
				<option value="b_userid">작성자</option>
				<option value="b_content">내용</option>
				<option value="b_title">제목</option>
			</select> <input type="hidden" value="search" id="action" name="action">
			<input class="form-control mr-sm-2" name="keyword"> <input
				type="submit" class="btn btn-secondary my-2 my-sm-0" value="조회">
			<button class="btn btn-danger	" type="button" id="btnWrite"
				onclick="moveWrite()">글쓰기</button>
			</div>
			<div id="#buttonDiv">
			<input type="hidden" name="teamNum" id="teamNum">
			<button class="btn btn-danger" type="button" id="9"
				onclick="javascript:changeValue(this)">전체</button>
			<c:forEach var="dept" items="${deptList}">
				<button class="btn btn-danger" type="button" id="${dept.d_num}"
					onclick="javascript:changeValue(this)">${dept.d_name}</button>
			</c:forEach>
			</div>
		</form>
		<br>
	</div>

	<br>

	<div class="contianer">
		<table class="table table-bordered table-hover table-striped"
			style="width: 50%; text-align: center;">
			<thead>
				<tr>
					<th>글번호</th>
					<th width="150px">제목</th>
					<th>작성자</th>
					<th>부서명</th>
					<th>등록날짜</th>
					<th>조회수</th>
				</tr>
			</thead>

			<c:if test="${list } eq null">
				<tr>
					<td colspan="5">등록된 게시글이 없습니다.</td>
				</tr>
			</c:if>

			<c:forEach var="row" items="${list }">
				<tr>
					<td><c:out value="${row.b_num}"></c:out></td>
					<td><a href="/tys/board/boardDetail?b_num=${row.b_num}"> <c:out
								value="${row.b_title }"></c:out>
					</a></td>
					<td><c:out value="${row.b_userid }"></c:out></td>
					<td><c:out value="${row.b_deptName }"></c:out></td>
					<td><c:out value="${row.b_date }"></c:out></td>
					<td><c:out value="${row.b_cnt }"></c:out></td>
				</tr>
			</c:forEach>

		</table>
	</div>
	<hr>



	<br>
	<!-- 페이징 -->
	<nav aria-label="..."
		style="align-items: center; width: 50%; float: none; margin: 0 auto">
		<ul class="pagination pagination-sm">
				<c:if test="${paging.startPage != 1 }">
					<li class="page-item"><a class="page-link"
						href="list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
					<!-- 이전으로 이동 -->
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
					var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<li class="page-item active" aria-current="page"><span
								class="page-link"><b>${p}</b><span class="sr-only">(current)</span>
							</span></li>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<c:if test="${p > paging.startPage}">
							</c:if>
							<li class="page-item"><a class="page-link"
								href="selectedList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<li class="page-item"><a class="page-link"
						href="list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
					<!-- 뒷 페이지로 이동 -->
				</c:if>
		</ul>
	</nav>
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