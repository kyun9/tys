<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
		integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<title>Right now</title>
</head>

<body>
	<!-- partial:partials/header.jsp -->
	<%@ include file="../partials/header.jsp"%>
	<!-- partial -->

	<script>
		function login() {
			$.ajax({
				url: "/tys/loginChk",
				type: "POST",
				data: $('#frm').serialize(),
				dataType: 'JSON',
				success: function (data) {
					if (data.status == 1) {
						alert("아이디가 존재하지 않습니다");
					} else if (data.status == 2) {
						alert("비밀번호가 틀렸습니다. \n" + data.checkCnt + "/5 횟수 틀리면 계정이 비활성화 됩니다.");
					} else if (data.status == 3) {
						alert("비밀번호가 틀렸습니다. 5번이 넘어서 비활성화 되었습니다.");
					} else if (data.status == 9) {
						alert("로그인에 성공하였습니다");
						location.href = "/tys";
					} else if (data.status == 10) {
						alert("비밀번호 5회실패하여 계정이 비활성화 되었습니다. \n 관리자한테 문의하세요.");
					}
				},
				error: function () {
					alert("error");
				}

			})
		}


	</script>
	<form id="frm">
		id : <input type="text" name="id" id="id"><br>
		pwd : <input type="password" name="pwd" id="pwd">
		<button type="button" id="btn" onclick="javascript:login()">확인</button>
	</form>



	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
</body>