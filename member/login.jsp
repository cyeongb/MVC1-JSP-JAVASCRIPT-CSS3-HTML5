<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I o g i n </title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/><br><br>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../member/join.jsp">회원가입하기</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1 bgcolor="beige"> L o g i n </h1>
<form action="loginPro.jsp" id="join" method="post" >
<fieldset>
<legend>로그인하기 </legend>
<label>ID</label>
<input type="text" name="id" class="form-control" placeholder="아이디" required="required"><br>
<label>PASSWORD</label>
<input type="password" name="pass" class="form-control" placeholder="비밀번호" required="required"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="로그인하기" class="submit" >
<input type="reset" value="취소하기" class="submit" >
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>