<%@page import="networkboard.networkBoardBean"%>
<%@page import="networkboard.networkBoardDAO"%>
<%@page import="funwebmember.MemberBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

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
			//패키지 board 파일이름 BoardDAO
			//객체생성 BoardDAO bdao
			networkBoardDAO fbdao = new networkBoardDAO();
			MemberBean mb=new  MemberBean();

			//int count = 메서드호출 getBoardCount()
			

			//한화면에 보여줄 글개수
			int pageSize = 6;
			//페이지번호 가져오기
			String pageNum = request.getParameter("pageNum");
			//페이지번호가 없으면 "1" 설정
			if (pageNum == null) {
				pageNum = "1";
			}
			//시작하는 행번호 구하기
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage - 1) * pageSize + 1;
			//끝나는 행번호 구하기
			int endRow = currentPage * pageSize;
					
			int count = fbdao.getboardCount();
			List boardList = null;
			if (count != 0) {
				//boardList = getBoardList(시작행번호, 몇개) 게시판 글 가져오기  메서드호출
				boardList = fbdao.getBoardList(startRow, pageSize);
			}
		%>
		<article>
			<h1>
				<i>N e t w o r k </i>
			</h1>
			<br>
			<h3>
				[전체글 개수 :
				<%=count%>]
			</h3>
			<br>
			<table id="notice" class="table-table-striped">
				<tr>
					<th class="no">No.</th>
					<th class="title">제목</th>
					<th class="writer">글쓴이</th>
					<th class="date">작성 날짜</th>
					<th class="file">첨부파일</th>
					<th class="read">조회수</th>
				</tr>
				<%
					if (count != 0) {
						for (int i = 0; i < boardList.size(); i++) {
							networkBoardBean bb = (networkBoardBean) boardList.get(i);
				%>
				<tr onclick="location.href='networkContent.jsp?num=<%=bb.getNum()%>'">
					<td><%=bb.getNum()%></td>
					<td class="left"><%=bb.getSubject()%></td>
					<td><%=bb.getName()%></td>
					<td><%=bb.getDate()%></td>
					<% if(bb.getFile()!=null){ %>
					<td><%=bb.getFile()%></td>
					<%} else{%><td></td>
					<%} %>
					<td><%=bb.getReadcount()%></td>
				</tr>
				<%
					}
					}
				%>
			</table>
			<div id="table_search">
				<%
					//String id = 세션값 가져오기
					String id = (String) session.getAttribute("id");
					//세션값이 있으면  글쓰기 버튼이 보이기
					if (id.equals("admin")) {
				%>
				<input type="button" value="글쓰기" class="btn"
					onclick="location.href='networkWrite.jsp'">
				<%
					}else {}
				%>
			</div>
			<div id="table_search">
			<form action="networkSearch.jsp" method="post">
				<input type="text" name="search" class="input_box"> 
				<input type="submit" value="검색하기" class="btn">
				</form>
			</div>
			<div class="clear"></div>
			<div id="page_control">
				<%
					if (count != 0) {
						int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
						int pageBlock = 6;
						int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
						int endPage = startPage + pageBlock - 1;
						if (endPage > pageCount) {
							endPage = pageCount;
						}
						//[이전] startPage 1아니고 11부터 [이전]글자 보이기
						if (startPage > pageBlock) {
				%><a href="networkNotice.jsp?pageNum=<%=startPage - pageBlock%>">이전</a>
				<%
					}
						// 출력 [1][2][3]....[10]
						for (int i = startPage; i <= endPage; i++) {
				%><a href="networkNotice.jsp?pageNum=<%=i%>">[<%=i%>]
				</a>
				<%
					}
						//[다음] endPage보다 pageCount 가 더크면
						if (endPage < pageCount) {
				%><a href="networkNotice.jsp?pageNum=<%=startPage + pageBlock%>">다음</a>
				<%
					}
					}
				%>
			
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