<%@page import="funwebboard.funwebBoardBean"%>
<%@page import="java.util.List"%>
<%@page import="funwebboard.funwebBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
				<li><a href="jsp.jsp">J s p </a></li>
				<li><a href="java.jsp">J a v a </a></li>
				<li><a href="networkNotice.jsp">N e t w o r k</a></li>
				<li><a href="database.jsp">D a t a b a s e </a></li>
				<li><a href="html.jsp">H t m l 5 & C s s </a></li>
				<li><a href="notice.jsp">F r e e   B o a r d </a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<%
//String id = 세션값 가져오기
String id=(String)session.getAttribute("id");
//세션값이 없으면  member/login.jsp 이동

if(! id.equals("admin")){
%>
<script>
	alert("이 곳의 글쓰기는 관리자 권한입니다.");
	history.back();
</script>	
<%
}
%>
<article>
<h1> <li>글 작성 공간</li></h1>
<form action="networkWritePro.jsp" method="post" enctype="multipart/form-data">
<table id="notice">
<tr><td class="tno">글쓴이</td>
<td><input type="text" name="name" value="<%=id%>" readonly></td></tr>
<tr><td class="tno">비밀번호</td><td><input type="password" name="pass" required="required"></td></tr>
<tr><td class="tno">제목</td><td><input type="text" name="subject" required="required"></td></tr>
<tr> <td>파일</td><td><input type="file" name="file"></td></tr>
<tr><td class="tno">내용</td>
<td><textarea name="content" rows="30" cols="20" required="required"></textarea></td></tr>
</table>
<div id="table_search">
<input type="submit" value="글쓰기" class="btn">
<input type="button" value="글목록" class="btn" onclick="location.href='networkNotice.jsp'">
</div>
</form>
<div class="clear"></div>
<div id="page_control">
</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>