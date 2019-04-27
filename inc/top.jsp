<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header>
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="pic" style="text-align:center;">
	<img src="../images/pic.jpg" width="100" height="100" alt="Fun Web" >
	<h1><i>Young  Beveloper</i></h1>
</div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
	<ul>
		<li><a href="../main/main.jsp">H o m e </a></li>
		<li><a href="../company/welcome.jsp">A b o u t   M e</a></li>
		<li><a href="../center/notice.jsp">P r o g r a m m i n g</a></li>
		<li><a href="../center/study.jsp">S t u d y </a></li>
		<li><a href="../mail/mailForm.jsp">E -  M a i l </a></li>
	</ul>
</nav>
</header>
<body>
	<%
		if (session.getAttribute("id") == null) {
	%>
		<div id="login">
			<a href="../member/login.jsp">login</a> | <a
				href="../member/join.jsp">join</a>
		</div>
		<%
			} else {
				String id = (String) session.getAttribute("id");
		%>
		<div id="login">
			<%=id%>님  
				<a href="../member/logout.jsp">logout</a>
				| <a href="../member/info.jsp">info</a>
		</div>
		<%
			}
		%>
	
</body>