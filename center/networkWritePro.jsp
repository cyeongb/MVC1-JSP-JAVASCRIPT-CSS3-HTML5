
<%@page import="networkboard.networkBoardDAO"%>
<%@page import="networkboard.networkBoardBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%//--------------------------------------writePro2.jsp  -----------------------------------------------
		/*cos.jar안에 있는 MultipartRequest, DefaultFileRenamePolicy
		 파일 업로드할때, 폼에서 들고 온 파일을 업로드한다.+한글처리 -->파라미터 정보 저장.
		 MultipartRequest multi=new MultipartRequest(request,업로드 할 폴더,파일크기,한글처리,업로드 한 파일 이름이 동일하면 이름 변경해 주어야 하는 작업하기.)
		 ---> 초기값을 5개 받는다.
		 -- 업로드 할 폴더를 webcontent안에 upload라는 폴더 만들기.+ 업로드 할 위치 지정하기.
		*/
		String uploadPath = request.getRealPath("/upload");

		//업로드 할 파일 크기 지정하기
		int maxSize = 5 * 1024 * 1024; //=5mega byte임.

		MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8",
				new DefaultFileRenamePolicy());

		//bean에 저장해야함.

		String name = multi.getParameter("name");
		String pass = multi.getParameter("pass");
		String subject = multi.getParameter("subject");
		String content = multi.getParameter("content");
		String file = multi.getFilesystemName("file");

		/*  *******  ********************
		보드 빈에도 파일 저장공간 만들기.
		디비에도 있어야 됨
		
		*/
		networkBoardBean bb = new networkBoardBean();
		networkBoardDAO bdao = new networkBoardDAO();
		bb.setName(name);
		bb.setPassword(pass);
		bb.setSubject(subject);
		bb.setContent(content);
		bb.setFile(file);
		bdao.finsertBoard(bb);
	%>
	<%-- <jsp:useBean id="bb2" class="board.BoardBean"/> --%>
	<%-- <jsp:setProperty property="*" name="bb2"/> --%>

	<script type="text/javascript">
		alert("글쓰기 성공!");
		location.href = "networkNotice.jsp";
	</script>
</body>
</html>