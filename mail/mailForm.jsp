
<%@page import="funwebboard.funwebBoardDAO"%>
<%@page import="funwebboard.funwebBoardBean"%>
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
	
		<!-- 왼쪽메뉴 -->

		<!-- 게시판 -->

		
		<article>
			<h1>
				<i>E m a i l 이메일 보내기</i>
			</h1>
			<h3>운영자에게 하고싶은말을 보내주세요 : )</h3>
			<div>
		<form action="sendMail.jsp" method="post" name="a">
			<table>
				<tr>
					<th colspan="2">jsp 메일 보내기</th>
				</tr>
				<tr>
				<td>from</td>
				<td><input type="email" name="from" placeholder="이메일 양식으로 적어주세요"/></td></tr>
				
				<tr>
					<td>to</td>
					<td><input type="email" name="to" value="cyeongb@naver.com" readonly/></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject"  required="required"/></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content" placeholder="운영자에게 하고싶은 말 적어주세요 . 예)개선사항,묻고싶은 말 무엇이든!"
							style="width: 170px; height: 200px;" required="required"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: right;"><input
						type="submit" value="전송하기" /></td>
				</tr>
			</table>
		</form>
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