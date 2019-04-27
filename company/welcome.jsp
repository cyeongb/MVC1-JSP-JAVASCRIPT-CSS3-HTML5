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
<!-- 헤더가 들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더가 들어가는 곳 -->

<!-- 본문 들어가는 곳 -->
<!-- 서브페이지 메인이미지 -->
<div id="sub_img"></div>
<!-- 서브페이지 메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
			<ul>
			     <li><a href="welcome.jsp">A b o u t   M e</a></li>
				<li><a href="location.jsp">M a p </a></li>
				</ul>
				</nav>
<!-- 왼쪽메뉴 -->
<!-- 내용 -->
<article>
<h1><i> Introduction</i></h1>
<h4>젊은 감각을 가진 개발자</h4><h2><i>YoungBeveloper</i></h2>
<figure class="ceo"><img src="../images/me.jpg" width="180" height="226" 
alt="CEO"><figcaption>Choe Yeongbi</figcaption>
</figure>
<p>
<img src="career2.JPG" width="430" height="520">
</p>
</article>
<!-- 내용 -->
<!-- 본문 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>



