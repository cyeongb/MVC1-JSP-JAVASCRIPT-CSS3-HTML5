
<%@page import="java.sql.Timestamp"%>
<%@page import="funwebmember.MemberBean"%>
<%@page import="funwebmember.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 </title>
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
				<li><a href="join.jsp">회원가입하기 </a></li>
				<li><a href="update.jsp">회원 정보수정하기</a></li>
				<li><a href="withdraw.jsp">탈퇴하기</a></li>
				<li><a href="info.jsp">마이페이지 가기</a></li>
			</ul>
		</nav>

		<!-- 게시판 -->
		<!-- 본문들어가는 곳 -->

	<h2 style="color:gray;"><i> 회 원 정 보 수 정 </i></h2>
	<%
String id = (String) session.getAttribute("id");	
MemberDAO mdao=new MemberDAO();
MemberBean mb=new MemberBean();
mb=mdao.getMember(id);
%>
<br>
<form action="updatePro.jsp" method="post">
<table border="1" width="350px" height="450px">
<tr><th colspan="2"><h2><i>Modify Information</i></h2></th></tr>
<tr>
<th>아이디</th><td><input type="text" name="id" value="<%=id%>" readonly></td></tr>
<tr><th>비밀번호</th><td><input type="password" name="password" value="<%=mb.getPassword() %>" readonly></td> </tr>
<tr><th>이름</th><td><input type="text" name="name" value="<%=mb.getName()%>"></td></tr>
<tr><th>이메일</th><td><input type="text" name="email" value="<%=mb.getEmail()%>"></td></tr>
<tr><th>우편번호</th><td><input type="text" name="postcode" value="<%=mb.getPostcode()%>"></td></tr>
<tr><th>주소</td><th><input type="text" name="address" value="<%=mb.getAddress() %>"></td></tr>
<tr><th>전화번호</th><td><input type="text" name="phonenum" value="<%=mb.getPhonenum()%>"></td></tr>
<tr><th>휴대폰번호</th><td><input type="text" name="mobilenum" value="<%=mb.getMobilenum()%>"></td></tr>
<input type="submit" value="수정하기">
</table>
</form>
		<div class="clear"></div>
		<!-- 푸터들어가는 곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터들어가는 곳 -->
	</div>	
</body>
</html>