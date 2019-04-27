<%@page import="funwebmember.MemberBean"%>
<%@page import="funwebmember.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴하기</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		MemberDAO mdao = new MemberDAO();
		int check = mdao.userCheck(id, password);

		if (check == 1) {
			mdao.deleteMember(id);
			session.invalidate();
	%>
	<script>
		alert("탈퇴 처리 되었습니다.");
		location.href = "../main/main.jsp";
	</script>
	<%
		} else if (check == 0) {
	%>
	<script>
		alert("비밀번호를 다시 입력하세요");
		history.back();
	</script>
	<%
		} else {
	%>
	<script>
		alert("오류발생");
		history.back();
	</script>
	<%
		}
	%>
</body>
</html>