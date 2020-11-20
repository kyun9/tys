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

	<title>test</title>
</head>
<style>
form {
	margin: 0 auto;
	width: 400px;
}

input[type=text], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=email], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=password], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

#buttonDiv{
margin: 0 auto;
	width: 560px;
	text-align : center;	
}
</style>
<body>
	<!-- partial:partials/header.jsp -->
	<%@ include file="../partials/header.jsp"%>
	<!-- partial -->


	<script>

		//비밀번호 확인
		$(function () {
			$('#pwd2').blur(function () {
				if ($('#pwd').val() != $('#pwd2').val()) {
					if ($('#pwd2').val() != '') {
						$('#pwdChk').text('비밀번호가 일치 하지않습니다.');
						$('#pwdChk').css("color", "red");
						$('#pwd2').val('');
						$('#pwd2').focus();
					}
				} else {
					$('#pwdChk').text('비밀번호가 일치합니다.');
					$('#pwdChk').css("color", "green");
				}
			})
		});

		//이메일 유효성검사
		function checkEmail() {
			var email = $("#email").val();
			var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			// 정규식 -전화번호 유효성 검사
			var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;

			if (email == "") {
				alert('이메일주소를 입력 해 주세요');
				email.focus();
				return false;
			} else {
				if (!regEmail.test(email)) {
					alert('이메일 주소가 유효하지 않습니다');
					email.focus();
					return false;
				}
			}
		}

		//회원등록처리
		function goToEnroll() {
			var pwd = $("#pwd").val();
			var pwd2 = $("#pwd2").val();
			var email = $("#email").val();

			 if (pwd == "") {
				alert("패스워드를 입력하세요");
			} else if (pwd2 == "") {
				alert("패스워드 확인하세요");
			} else if (checkEmail()) {
				alert("이메일을 확인하세요")
			} else {
				alert("성공적으로 수정되었습니다.");
				updateForm.submit();
			}
		}

		//미리보기 사진삭제
		function deleteImg() {
			$("#photo").attr("src",
				"/tys/resources/users/default.png");
			$("#img").val("");
		}

		//사진 미리보기
		function previewImage(f) {
			var file = f.files;
			// 확장자 체크
			if (!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)) {
				alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);
				// 선택한 파일 초기화
				f.outerHTML = f.outerHTML;
				document.getElementById('preview').innerHTML = '';
			}
			else {
				// FileReader 객체 사용
				var reader = new FileReader();
				// 파일 읽기가 완료되었을때 실행
				reader.onload = function (rst) {
					$("#photo").attr("src", rst.target.result);
				}
				// 파일을 읽는다
				reader.readAsDataURL(file[0]);
			}
		}
	</script>
	<div id ="buttonDiv">
	
	<h3>My Page</h3>
	${deptInfo.d_name} ${userInfo.user_id} ${positionInfo.p_name}의 마이페이지입니다.


	<a href="#">회원수정</a>
	<a href="#">작성글보기</a>
	
	<h1>회원 수정하기</h1>
		</div>
	<form method="post" action="/tys/updateUserInfo" id="updateForm" name="registerForm" enctype="multipart/form-data">
		<img src="/tys/resources/users/${userInfo.user_image}" id="photo" width="150px" height="150px" /><br>
		<input type="file" name="user_image" id="img" placeholder="이미지 선택" accept="image/*"
			onchange="previewImage(this);">
		<input type="button" id="deleteTempImage" onclick="deleteImg()" value="사진삭제"> <br>
		<br>이름 : ${userInfo.user_name}
		<br>비밀번호 : <input type="password" name="user_pwd" id="pwd" placeholder="변경할 비밀번호를 입력하세요.">
		<br>비밀번호확인: <input type="password" id="pwd2" placeholder="비밀번호확인">
		<br>이메일 : <input type="email" name="user_email" id="email" value="${userInfo.user_email}">
		<br><input type="submit" value="수정하기" />
	</form>
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