<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="web.mail.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

MailSend ms=new MailSend();
ms.MailSend(request, response);
%>
<script>
alert("소중한 의견 감사합니다 ^^");
location.href="../main/main.jsp";
</script>
</body>
</html>