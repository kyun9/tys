<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>test</title>
</head>
<body>
	<!-- partial:partials/header.jsp -->
	<%@ include file="./partials/header.jsp"%>
	<!-- partial -->

	<script>
		function moveBoard() {
			location.href = "/tys/board";
		}
		function moveNotice() {
			location.href = "/tys/notice";
		}
		function moveSearchUser() {
			location.href = "/tys/searchUser";
		}
		function moveRegister() {
			location.href = "/tys/register";
		}
	</script>


	<c:if test="${userInfo!= null}">
		<button type="button" id="btn" onclick="javascript:moveBoard()">게시판</button>
		<button type="button" id="btn" onclick="javascript:moveNotice()">공지사항</button>
		<button type="button" id="btn" onclick="javascript:moveSearchUser()">회원조회</button>
		<button type="button" id="btn" onclick="javascript:moveRegister()">회원등록</button>
		<br>

		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="text" placeholder="Search">
			<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
		</form>

	</c:if>

</body>

</html>