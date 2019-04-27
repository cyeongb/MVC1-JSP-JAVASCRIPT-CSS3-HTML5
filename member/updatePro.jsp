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
<title>회원정보 수정</title>
</head>
<body>
	<jsp:useBean id="mb2" class="funwebmember.MemberBean" />
	<jsp:setProperty property="*" name="mb2" />

	<%
		String password = request.getParameter("password");
		String id = request.getParameter("id");
		mb2.setUserID(id);
		MemberDAO mdao = new MemberDAO();

		if (password.equals(mb2.getPassword())) {
			int check = mdao.updateMember(mb2);
			if (check == 1) {
	%>
	<script>
		alert("회원수정 성공!");
		location.href = "info.jsp";
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
		 } else {
	%>
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.back();
	<% } %>	
	</script>
</body>
</html>