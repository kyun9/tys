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

<body>
	<!-- partial:partials/header.jsp -->
	<%@ include file="../partials/header.jsp"%>
	<!-- partial -->

	<h3>My Page</h3>
	${deptInfo.d_name} ${userInfo.user_id} ${positionInfo.p_name}의 마이페이지입니다.


	<a href="#">회원수정</a>
	<a href="#">작성글보기</a>

	<script>
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
	<h1>회원 수정하기</h1>
	<form method="get" action="/updateUserInfo" id="updateForm">
		<img src="/tys/resources/users/${userInfo.user_image}" id="photo" width="150px" height="150px" /><br>
		<input type="file" name="user_image" id="img" placeholder="이미지 선택" accept="image/*"
			onchange="previewImage(this);">
		<input type="button" id="deleteTempImage" onclick="deleteImg()" value="사진삭제"> <br>
		<br>이름 : ${userInfo.user_name}
		<br>비밀번호 : <input type="password" name="user_pwd" id="pwd" placeholder="변경할 비밀번호를 입력하세요.">
		<br>비밀번호확인: <input type="password" id="pwd2" placeholder="비밀번호확인">
		<br>이메일 : <input type="email" name="user_email" id="email" placeholder="${userInfo.user_email}">
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