<%@page import="networkboard.networkBoardBean"%>
<%@page import="networkboard.networkBoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="funwebmember.MemberBean" %>
<%@page import="funwebboard.funwebBoardBean"%>
<%@page import="java.util.List"%>
<%@page import="funwebboard.funwebBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YoungBeveloper</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">

</head>
<body>
<div style="background-color:beige">

<div id="wrap">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더파일들어가는 곳 -->
<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>
<div id="main_img" style="background-color:beige"><img src="../images/sky1.jpg"
 width="971" height="282"><a href="main.jsp"></a></div>
<!-- 메인이미지 들어가는곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">

<div class="clear"></div>
<div id="news_notice">
<h3><span class="orange">Portfolio</span> 목록</h3>
<table>
<%

networkBoardDAO bdao= new networkBoardDAO();
int count2=bdao.getboardCount();
List boardList2=null;
if(count2!=0){
	boardList2=bdao.getBoardList(1, 6);
	for(int i=0;i<boardList2.size();i++){
		networkBoardBean bb2 =(networkBoardBean)boardList2.get(i);
		%>
		<tr><td class="context">[<%=bb2.getNum()%>] <%=bb2.getSubject() %></td>
		<td class="file"><a href="../upload/"></a>
<img src="../upload/<%=bb2.getFile() %>" width="60" height="60">	
		</td>
    <td><%=bb2.getDate() %></td>
    <td>  by <%=bb2.getName() %>님</td>
    </tr>	
	<%
	}
}
%>
</table>
</div>
<div id="news_notice">
<h3><span class="brown"><i>게시판</i></span> 글목록</h3>
<table>
<%

funwebBoardDAO fbdao= new funwebBoardDAO();
int count=fbdao.getboardCount();
List boardList=null;
if(count!=0){
	boardList=fbdao.getBoardList(1, 6);
	for(int i=0;i<boardList.size();i++){
		funwebBoardBean bb =(funwebBoardBean)boardList.get(i);
		%>
		<tr><td class="context">[<%=bb.getNum()%>] <%=bb.getSubject() %></td>
		<td class="file"><a href="../upload/"></a>
<img src="../upload/<%=bb.getFile() %>" width="60" height="60">	
		</td>
    <td><%=bb.getDate() %></td>
    <td>  by <%=bb.getName() %>님</td>
    </tr>	
	<%
	}
}
%>
</table>
</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>