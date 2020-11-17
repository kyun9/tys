<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<!-- 네이비게이터 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="/tys"><img src="/tys/resources/static/logo.svg" style="float: left;width: 50px;"></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarColor03" aria-controls="navbarColor03"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarColor03">
		<ul class="navbar-nav mr-auto">

			<c:choose>
				<c:when test="${userInfo!= null}">
					<li class="nav-item"><a class="nav-link" href="#">${deptInfo.d_name} ${userInfo.user_id} ${positionInfo.p_name}님 반갑습니다.</a></li>
					<li class="nav-item"><a class="nav-link" href="/tys/mypage">마이페이지</a></li>
					<li class="nav-item"><a class="nav-link" href="/tys/logout"
						onclick="alert('로그아웃 되엇습니다.');">로그아웃</a></li>
				</c:when>
				<c:otherwise>
					<li class="nav-item"><a class="nav-link" href="/tys/login">로그인</a></li>
				</c:otherwise>
			</c:choose>

		</ul>
	</div>
</nav>
<br>