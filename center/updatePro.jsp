<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="funwebboard.funwebBoardDAO"%>
<%@page import="funwebboard.funwebBoardBean"%>
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

request.setCharacterEncoding("utf-8");
int maxSize = 5 * 1024 * 1024;
String uploadPath = request.getRealPath("/upload");
MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8",
		new DefaultFileRenamePolicy());
int num=Integer.parseInt(multi.getParameter("num"));
String userId = (String)session.getAttribute("id");
String pass=multi.getParameter("pass");
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");
String file = multi.getFilesystemName("file");

///BoardBean bb 객체 생성
funwebBoardBean bb=new funwebBoardBean();
// 멤버변수 <= 파라미터값 저장

bb.setNum(num);
bb.setSubject(subject);
bb.setContent(content);
bb.setPassword(pass);
//bb.setUserID(userId);
bb.getDate();
bb.setFile(file);

// BoardDAO bdao 객체생성
funwebBoardDAO bdao=new funwebBoardDAO();

//  int check = numPassCheck(bb);
int check=bdao.updateBoard(bb);

// check==1   //updateBoard(bb) 메서드호출   // notice.jsp 이동
// check==0 "비밀번호틀림" 뒤로이동
// check==-1 "num없음" 뒤로이동
if(check==1){
	//업데이트보드에 저장.	
	bdao.updateBoard(bb);
%>
<script>

	alert("게시판 글 수정 완료 되었습니다.");
	location.href="notice.jsp";
</script>	
<%
}else if(check==-1){
	%>
	<script type="text/javascript">
		alert("비밀번호틀림");
		history.back();
	</script>
	<%
}else if(check==0){
	%>
	<script type="text/javascript">
		alert("num값이 없음");
		history.back();
	</script>
	<%
}
%>
</body>
</html>



