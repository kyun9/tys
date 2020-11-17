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

<body>
<h2>게시물 작성</h2>
<form name ="form1" method="post" action="insert">
	
	<input type="hidden" name="b_userid" value="a">
	<input type="hidden" name="b_updateuser" value="a">
	<input type="hidden" name="b_type" value="1">
	
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

</body>
</html>