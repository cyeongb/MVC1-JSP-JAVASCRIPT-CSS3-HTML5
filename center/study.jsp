<%@page import="java.util.List"%>
<%@page import="funwebboard.funwebBoardDAO"%>
<%@page import="funwebboard.funwebBoardBean"%>
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
				<li><a href="#">C 언어</a></li>
				<li><a href="java.jsp">J a v a </a></li>
				<li><a href="#">B o o t s t r a p </a></li>
				<li><a href="../center/fnotice.jsp">정보처리 필기</a></li>
				<li><a href="#">정보처리 실기</a></li>
				<li><a href="#">E n g l i s h </a></li>
				<li><a href="#">F r e n c h </a></li>
				<li><a href="#">C h i n e s e </a></li>
				<li><a href="#">J a p a n e s e </a></li>
			</ul>
		</nav>
		<!-- 왼쪽메뉴 -->

		<!-- 게시판 -->


		<article>
			<h1>
				<i> M y   S t u d y </i>
			</h1>
			<h3><i>여기는 제가 학원 외 공부한 것들을 올린 게시판입니다.</i></h3>
				
		</article>
		<!-- 게시판 -->
		<!-- 본문들어가는 곳 -->
		<img src="study2.png" width="200" height="220">
		<div class="clear"></div>
		<!-- 푸터들어가는 곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터들어가는 곳 -->
	</div>
</body>
</html>