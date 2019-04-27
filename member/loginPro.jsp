<%@page import="funwebmember.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>L o g i n </title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");

		MemberDAO mdao = new MemberDAO();
		int check = mdao.userCheck(id, pass);

		if (check == 1) {
			session.setAttribute("id", id);
	%>
	<script>
		alert("로그인 되셨습니다.");		
		location.href = '../main/main.jsp';
	</script>
	<%
		} else if (check == 0) {
	%>
	<script>
		alert("비밀번호가 다릅니다.");
		history.back();
	</script>
	<%
		} else if (check == -1) {
	%>
	<script>
		alert("아이디가 없는 아이디 입니다.");
		history.back();
	</script>
	<%
		}
	%>
</body>
</html>