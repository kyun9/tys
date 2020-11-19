<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원조회/관리</title>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
		integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<!-- jquery  -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>


</head>
<body>
	<!-- partial:partials/header.jsp -->	
	<%@ include file="../partials/header.jsp"%>
	<!-- partial -->
	<script>

function userDelete(userid){
	 if (confirm("회원을 삭제하시겠습니까?")==true) {
		 location.href='/tys/deleteUser?user_id='+userid;
     }
}


function userModify(userid){
	if (confirm("회원 정보를 수정 하시겠습니까?")==true) {
		 location.href='/tys/userDetail?user_id='+userid;
     }
}

</script>
	
	<table border="1">
		<tr>
			<th>이름</th>
			<th>이메일</th>
			<th>부서</th>
			<th>직책</th>
		</tr>

		<c:if test="${list } eq null">
			<tr>
				<td colspan="5">등록된 회원이 없습니다.</td>
			</tr>
		</c:if>
		<c:choose>
			<c:when test="${(userInfo.user_position == 3) }">
		 	<c:forEach var="row1" items="${list1 }">
				<tr>
					<td>
						<c:out value="${row1.user_name}"></c:out>
					</td>
					<td>
						<c:out value="${row1.user_email }"></c:out>
					</td>
					<td>
						<c:out value="${row1.user_deptname }"></c:out>
					</td>
					<td>
						<c:out value="${row1.user_posiname }"></c:out>
					</td>
				</tr>
	
			</c:forEach>
				<div style="display: block;">
		<c:if test="${paging1.startPage != 1 }">
			<a href="searchUser?nowPage=${paging1.startPage - 1 }&user_deptno=${userInfo.user_deptno}&cntPerPage=${paging1.cntPerPage}">&lt;</a><!-- 이전으로 이동 -->
		</c:if>
		<c:forEach begin="${paging1.startPage }" end="${paging1.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging1.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging1.nowPage }">
				<c:if test="${p > paging1.startPage}">
					
				</c:if>
					<a href="searchUser?nowPage=${p }&user_deptno=${userInfo.user_deptno}&cntPerPage=${paging1.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging1.endPage != paging1.lastPage}">
			<a href="searchUser?nowPage=${paging1.endPage+1 }&user_deptno=${userInfo.user_deptno}&cntPerPage=${paging1.cntPerPage}">&gt;</a><!-- 뒷 페이지로 이동 -->
		</c:if>
	</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="row" items="${list }">
			<tr>
				<td>
					<c:out value="${row.user_name}"></c:out>
				</td>
				<td>
					<c:out value="${row.user_email }"></c:out>
					</td>
				<td>
					<c:out value="${row.user_deptname }"></c:out>
				</td>
				<td>
					<c:out value="${row.user_posiname }"></c:out>
				</td>
				<td>
				<c:if test="${(userInfo.user_position == 1) or (userInfo.user_deptno == row.user_deptno and userInfo.user_position == 2) }">
     			 <button onclick="javascript:userDelete('${row.user_id }')" value="${row.user_id }" >삭제</button>
     			 <button onclick="javascript:userModify('${row.user_id }')" value="${row.user_id }">수정</button>
   				</c:if>
				</td>
			</tr>
		</c:forEach>
	<div style="display: block;">
		<c:if test="${paging.startPage != 1 }">
			<a href="searchUser?nowPage=${paging.startPage - 1 }&user_deptno=${userInfo.user_deptno}&cntPerPage=${paging.cntPerPage}">&lt;</a><!-- 이전으로 이동 -->
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
				<c:if test="${p > paging.startPage}">
					
				</c:if>
					<a href="searchUser?nowPage=${p }&user_deptno=${userInfo.user_deptno}&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="searchUser?nowPage=${paging.endPage+1 }&user_deptno=${userInfo.user_deptno}&cntPerPage=${paging.cntPerPage}">&gt;</a><!-- 뒷 페이지로 이동 -->
		</c:if>
	</div>	
			</c:otherwise>
		</c:choose>
	</table>

	

<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->

	<!-- ajax slim이면 안된다. 왜 일까? -->
	<!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>

</body>
</html>