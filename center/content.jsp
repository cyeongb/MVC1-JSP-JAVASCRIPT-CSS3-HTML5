<%@page import="funwebboard.funwebBoardBean"%>
<%@page import="java.util.List"%>
<%@page import="funwebboard.funwebBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 공간</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
function view_original(){
    var v_filename = file_name.value;
    var v_width = file_size.width;
    var v_height = file_size.height;
    //window.open("오픈할파일,주소","창이름","창의크기,위치,..");
    var url = "../upload/"+v_filename;
    var title = "원본크기로 보기";
    var win = window.open("", "", "width ="+(v_width+10)+" height="+(v_height+10)+"_blank");
    win.document.write("<title>"+title+"</title>");
    win.document.write("<img src ="+url+" width ="+v_width+" height="+v_height+" onclick=window.close()>");
}
</script>

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
				<li><a href="jsp.jsp">J s p </a></li>
				<li><a href="java.jsp">J a v a </a></li>
				<li><a href="networkNotice.jsp">N e t w o r k</a></li>
				<li><a href="database.jsp">D a t a b a s e </a></li>
				<li><a href="html.jsp">H t m l 5 & C s s </a></li>
				<li><a href="notice.jsp">F r e e   B o a r d </a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<%
// int num = num파라미터 가져오기
int num=Integer.parseInt(request.getParameter("num"));
// 객체생성 BoardDAO bdao
funwebBoardDAO fbdao=new funwebBoardDAO();
fbdao.updateReadcount(num);

// BoardBean bb  =   getBoard(num)
funwebBoardBean bb=fbdao.contentboard(num);

%>
<article>
<h1><i>W r i t e </i></h1>

<table id="notice">
<tr><td class="tno">글번호</td><td><%=bb.getNum() %></td>
<td class="tno">조회수</td><td><%=bb.getReadcount() %></td></tr>
<tr><td class="tno">작성자</td><td><%=bb.getName() %></td>
    <td class="tno">글쓴날짜</td><td><%=bb.getDate() %></td></tr>
<tr><td class="tno">제목</td><td colspan="3"><%=bb.getSubject() %></td></tr>
<tr><td class="file">첨부파일</td><td colspan="3"><a href="../upload/<%=bb.getFile() %>" ><%//bb.getFile() %></a>
<%-- <img src="../upload/<%=bb.getFile() %>" width="80" height="80" > --%>
<img src="../upload/<%=bb.getFile() %>" height="80" width="80"  onclick="view_original()" /> 
<input type="hidden" value="<%=bb.getFile() %>" name="file_name">
<img src="../upload/<%=bb.getFile() %>"  hidden name="file_size">
<% if(bb.getFile()==null){
%><h3><i>No  f i l e.</i></h3>	
<%}%></td></tr>
<tr><td class="tno">글내용</td><td colspan="3"><%=bb.getContent() %></td></tr>
</table>
<div id="table_search">
<%
//세션값 가져오기
String id=(String)session.getAttribute("id");
if(id!=null){
	if(id.equals(bb.getName())){
		%>
<input type="button" value="글수정" class="btn" 
onclick="location.href='updateForm.jsp?num=<%=bb.getNum()%>'">
<input type="button" value="글삭제" class="btn" 
onclick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>'">		
		<%
	}
}
%>
<input type="button" value="글목록" class="btn" onclick="location.href='notice.jsp'">
</div>
<div class="clear"></div>
<div id="page_control">
</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>