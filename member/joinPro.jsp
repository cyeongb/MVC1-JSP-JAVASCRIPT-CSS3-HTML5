<%@page import="java.io.PrintWriter"%>
<%@page import="funwebmember.MemberDAO"%>
<%@page import="funwebmember.MemberBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
 PrintWriter script=response.getWriter();

MemberBean mb=new MemberBean();
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
out.println(id);
String pass=request.getParameter("pass");
out.println(pass);
String pass2=request.getParameter("pass2");
String name = request.getParameter("name");
String email = request.getParameter("email");
String address = request.getParameter("address")+request.getParameter("address2");
String phonenum = request.getParameter("phonenum")+request.getParameter("phonenum2");
//substr()
String mobilenum = request.getParameter("mobilenum1")+request.getParameter("mobilenum2")+request.getParameter("mobilenum3");
String postcode=request.getParameter("postcode1")+request.getParameter("postcode2");
Timestamp reg_date= new Timestamp(System.currentTimeMillis());

if(pass.equals(pass2)){
mb.setUserID(id);
mb.setName(name);
mb.setPassword(pass);
mb.setEmail(email);
mb.setAddress(address);
mb.setPhonenum(phonenum);
mb.setMobilenum(mobilenum);
mb.setReg_date(reg_date);
mb.setPostcode(postcode);

MemberDAO mdao=new MemberDAO();
mdao.insertMember(mb);

script.println("<script>");
script.println("alert('회원가입이 완료 되었습니다.')");
script.println("location.href='../main/main.jsp'");
script.println("</script>");
}else{
	script.println("<script>");
	   script.println("alert('비밀번호가 맞지 않습니다.')");
	   script.println("history.back();");
	   script.println("</script>");
}
%>
<jsp:useBean id="mb2" class="funwebmember.MemberBean"/>
<jsp:setProperty property="*" name="mb2"/>

</body>
</html>