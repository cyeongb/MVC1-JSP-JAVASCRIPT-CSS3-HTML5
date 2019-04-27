
<%@page import="funwebboard.funwebBoardBean"%>
<%@page import="funwebboard.funwebBoardDAO"%>
<%@page import="java.util.List"%>
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
				<li><a href="network.jsp">N e t w o r k</a></li>
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
if(id==null){
%><script>
	alert("로그인 페이지로 이동합니다.");
	location.href="../member/login.jsp";
</script>	
<%}
//int num = num파라미터 가져오기
funwebBoardDAO bdao=new funwebBoardDAO();
int num=Integer.parseInt(request.getParameter("num"));
funwebBoardBean bb=new funwebBoardBean();
bb=bdao.contentboard(num);
%>
<article>
<h1>게시판 글 삭제하기</h1>
<form action="deletePro.jsp" method="post" >
<input type="hidden" name="num" value="<%=num%>">
<table id="notice">
<tr><th class="writer">글쓴이</th>
<td><input type="text" name="name" value="<%=bb.getName()%>" readonly></td></tr>
<tr><th class="tno">비밀번호</th><td><input type="password" name="pass" required="required"></td></tr>

</table>
<div id="table_search">
<input type="submit" value="글삭제" class="btn">
<input type="button" value="글목록" class="btn" onclick="location.href='notice.jsp'">
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