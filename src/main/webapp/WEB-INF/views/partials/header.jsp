<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
div#headerBtn {
	margin : 0;
	position:absolute;
	top : 15%;
	left: 50%;
	transform : translate(-50%, -50%);
}
</style>

<!-- 네이비게이터 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="/tys/board/list"><img src="/tys/resources/static/logo.svg" style="float: left;width: 50px;"></a>
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


<script>
	function moveBoard() {
		location.href = "/tys/board/list"; 
	}
	function moveNotice() {
		location.href = "/tys/noticeBoard/list";
	}
	function moveSearchUser(userdeptno) {
		location.href = "/tys/searchUser?user_deptno="+userdeptno;
	}
	function moveRegister() {
		location.href = "/tys/register";
	}
</script>


<div id=headerBtn>
	<button type="button" class="btn btn-primary" value="board" id="btn"
		onclick="javascript:moveBoard()">게시판</button>
	<button type="button" class="btn btn-primary" value="notice" id="btn"
		onclick="javascript:moveNotice()">공지사항</button>
	<button type="button" id="btn" class="btn btn-primary" onclick="javascript:moveSearchUser('${userInfo.user_deptno }')" value="${userInfo.user_deptno }">회원조회</button>
	<c:if test="${userInfo.user_position != 3}">
		<button type="button" class="btn btn-danger" value="regUser" id="btn"
			onclick="javascript:moveRegister()">회원등록</button>
	</c:if>
</div>
<br><br><br><br>

