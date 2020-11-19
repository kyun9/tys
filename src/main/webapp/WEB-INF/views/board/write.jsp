<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물작성</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
   $(document).ready(function(){
      $("#btnSave").click(function(){
         var title = $("#title").val();
         var content = $("#content").val();
         if(title==""){
            alert("제목을 입력해주세요~");
            document.form1.title.focus();
            return;
         }
         if(content==""){
            alert("내용을 입력해주세요~");
            document.form1.content.focus();
            return;
         }
         document.form1.submit();
      });   
   });
</script>

</head>
<style>

input[type=text], select {
	width: 50%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

textarea[type=text], select {
	width: 50%;
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

<div id = "buttonDiv">
<h2>게시물 작성</h2>
<form name ="form1" method="post" action="insert">
	
	<input type="hidden" name="b_userid" value="${userInfo.user_id}">
	<input type="hidden" name="b_updateuser" value="${userInfo.user_id}">
	<input type="hidden" name="b_type" value="${deptInfo.d_num }">
	
   <div>
      제목
      <input name="b_title" id="title" size="80" placeholder="제목을 입력해주세요">
   </div>
   <div>
      내용
      <textarea name="b_content" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요"></textarea>
   </div>
   <div style="width:650px; text-align: center;">
      <button type="button" id="btnSave">확인</button>
      <button type="reset">취소</button>
   </div>
</form>
</div>
<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
</body>
</html>