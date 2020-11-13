<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<title>Right now</title>
</head>

<body>
	<!-- partial:partials/header.jsp -->
	<%@ include file="./partials/header.jsp"%>
	<!-- partial -->

	<c:choose>
		<c:when test = "${userInfo!= null}">

			<h1>${userInfo.id}</h1>
			<a href="/tys">로그아웃</a>

		</c:when>
		<c:otherwise>

			<a href="/tys/login">로그인</a>

		</c:otherwise>
	</c:choose>



</body>

</html>