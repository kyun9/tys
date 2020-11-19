<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">


<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./resources/css/style.css" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<title>test</title>
</head>

<body width="100%" height="100%"
	style="background-color: black !important">

	<script>
		function login() {
			$.ajax({
				url : "/tys/loginChk",
				type : "POST",
				data : $('#frm').serialize(),
				dataType : 'JSON',
				success : function(data) {
					if (data.status == 1) {
						alert("아이디가 존재하지 않습니다");
					} else if (data.status == 2) {
						alert("비밀번호가 틀렸습니다. \n" + data.checkCnt
								+ "/5 횟수 틀리면 계정이 비활성화 됩니다.");
					} else if (data.status == 3) {
						alert("비밀번호가 틀렸습니다. 5번이 넘어서 비활성화 되었습니다.");
					} else if (data.status == 9) {
						alert("로그인에 성공하였습니다");
						location.href = "/tys/board/list";
					} else if (data.status == 10) {
						alert("비밀번호 5회실패하여 계정이 비활성화 되었습니다. \n 관리자한테 문의하세요.");
					}
				},
				error : function() {
					alert("error");
				}

			})
		}
	</script>
	<c:if test="${text!= null}">
		<script>
			alert("aa");
		</script>
	</c:if>

	<br>
	<form id="frm" class="loginForm">

		<h2>Login</h2>
		<div class="idForm">
			<input type="text" class="id" name="user_id" id="id" placeholder="ID">
		</div>
		<div class="passForm">
			<input type="password" class="pw" name="user_pwd" id="pwd"
				placeholder="PW">
		</div>
		<button type="button" class="btn" id="btn"
			onclick="javascript:login()">LOG IN</button>
		<div class="bottomText">
			Don't you have ID? <a href="#">sign up</a>
		</div>


		<!-- id : <input type="text" name="user_id" id="id"><br>
		pwd : <input type="password" name="user_pwd" id="pwd">
		<button type="button" id="btn" onclick="javascript:login()">확인</button> -->
	</form>



	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
</body>