<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>공지사항 작성</title>
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

<body>
<h2>공지사항 작성</h2>
<form name ="form1" method="post" action="insert">
	
	<input type="hidden" name="n_userid" value="${userInfo.user_id}">
	<input type="hidden" name="n_updateuser" value="${userInfo.user_id}">
	<input type="hidden" name="n_type" value="${deptInfo.d_num }">
	
   <div>
      제목
      <input name="n_title" id="title" size="80" placeholder="제목을 입력해주세요">
   </div>
   <div>
      내용
      <textarea name="n_content" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요"></textarea>
   </div>
   <div style="width:650px; text-align: center;">
      <button type="button" id="btnSave">확인</button>
      <button type="reset">취소</button>
   </div>
</form>

</body>
</html>