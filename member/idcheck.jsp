<%@page import="funwebmember.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function idok() {
		opener.document.join.id.value=document.wfr.userid.value;
		window.close();
	}
</script>
</head>
<body>
	<%
		MemberDAO mdao = new MemberDAO();
		String id = request.getParameter("userid");
		int check = mdao.idCheck(id);
		
		if (check == 0) {
	%>
	<script>
		alert("사용 가능한 아이디입니다.");
	</script>
	<input type="button" value=" 이 아이디 사용하기" onclick="idok()">
	<%
		} else if (check == 1) {
	%>
	<script>
	alert(" 아이디가 중복입니다.");
//		document.wfr.userid.value.focus();
	</script>
	<%
		}
	%>
	<form action="idcheck.jsp" name="wfr">
		ID 입력 해 주세요:<input type="text" name="userid" value="<%=id%>"><br>
		<input type="submit" value="다시 아이디 중복체크하기">
	</form>
</body>
</html>