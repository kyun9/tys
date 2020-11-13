<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Right now</title>
</head>
<body>
	<!-- partial:partials/header.jsp -->
	<%@ include file="./partials/header.jsp"%>
	<!-- partial -->

	<script>
		<c:if test="${text!= null}">
			alert("${text}");
		</c:if>
	</script>



	<c:if test="${userInfo!= null}">
		<a href="/tys/register">회원등록</a>
	</c:if>



</body>

</html>