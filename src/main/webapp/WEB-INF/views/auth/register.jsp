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

	<title>test</title>
</head>


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
						$('#pwdChk').css("color","red");
						$('#pwd2').val('');
						$('#pwd2').focus();
					}
				} else {
					$('#pwdChk').text('비밀번호가 일치합니다.');
					$('#pwdChk').css("color","green");
				}
			})
		});

		var check= false;
		//아이디 중복체크
		function idChk() {
			var id = $('#id').val();
			console.log(id);
			$.ajax({
				url: '/tys/idChk?id=' + id,
				type: 'get',
				success: function (data) {
					if (data == 1) {
						$('#idBox').text('사용가능한 아이디입니다.');
						$('#idBox').css("color","green");
						check = true;
					} else {
						$('#idBox').text(id + "는 이미 사용중인 아이디입니다.");
						$('#idBox').css("color","red");
						$("#id").val("");
						$("#id").focus();
					}
				},
				error: function () {
					alert("에러입니다");
				}
			});
		}

		//회원등록처리
		function goToEnroll() {
			var id = $("#id").val();
			var pwd = $("#pwd").val();
			var pwd2= $("#pwd2").val();

			if (id == "") {
				alert("id를 입력하세요.");
			}else if(check==false){
				alert("아이디중복 확인하세요");
			}
			else if (pwd == "") {
				alert("패스워드를 입력하세요");
			}
			else if (pwd2 == "") {
				alert("패스워드 확인하세요");
			}else{
				alert("성공적으로 등록하였습니다.");
				registerForm.submit();
			}
		}
		
		//임시 사진 저장
		function changeImg(){
			var form = $('#registerForm')[0];
		    var formData = new FormData(form)
			
			$.ajax({
				type:"post",
				enctype:"multipart/form-data",
				url:"/tys/imgChk",
				data: formData,
				contentType : false,
		        processData : false, 
				success: function (data) {
					$("#photo").attr("src", "/tys/resources/temp/"+data);
				},
				error: function () {
					alert("에러입니다");
				}
			})
		}
		
		//임시사진 폴더에서 삭제
		function deleteImg(){
			var url = $("#photo").attr("src");
			$.ajax({
				type:"post",
				url:"/tys/deleteImg",
				data: {"url" : url},
				success: function (data) {
					alert(data);
					$("#photo").attr("src", "/tys/resources/users/default.png");
					$("#img").val("");
				},
				error: function () {
					alert("에러입니다");
				}
			})
		}
		
	</script>




	<form action="/tys/registerUser" method="post" name="registerForm" id="registerForm" enctype="multipart/form-data">
		<fieldset>
			<legend>Register</legend>
			<img src="/tys/resources/static/default.png"  id="photo" width="150px" height="150px" />
			<br><input type="file" name="img" id="img" placeholder="이미지 선택" accept="image/*" onchange="changeImg();">
					<input type="button" id= "deleteTempImage" onclick="deleteImg()" value="사진삭제">
			<br><input type="text" name="id" id="id" placeholder="아이디입력"> 
			<input type="button" id="idCheck" value="중복확인" onclick="javascript:idChk()" /> <div id="idBox" ></div>
			<br> <input type="password" name="pwd" id="pwd" placeholder="비번입력">
			<br> <input type="password" id="pwd2" placeholder="비번확인">
			<div id="pwdChk" ></div>
			<br> <input onclick = "goToEnroll(); " type="button"  value="등록" />
		</fieldset>
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