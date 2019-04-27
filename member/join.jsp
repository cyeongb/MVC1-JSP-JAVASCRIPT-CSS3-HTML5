<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입창</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	function idDupCheck() {
		if (document.join.id.value == "") {
			alert("아이디는 필수 사항입니다.");
			document.join.id.focus();
		} else if (document.join.id.value != "") {
			//자바스크립트 변수를 넘길떄는 변수에 저장하고  "+" 해서 넘긴다.
			var uid = document.join.id.value;
			window
					.open("idcheck.jsp?userid=" + uid, "",
							"width=500,height=600");
		}
	}
	function fun2() {
		window.open("postnum.jsp", "", "width=500 , height=500");
	}
</script>
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script type="text/javascript">
        function openDaumZipAddress() {

            new daum.Postcode({
                
                oncomplete:function(data) {

                    jQuery('#postcode1').val(data.postcode1);
                    jQuery('#postcode2').val(data.postcode2);
                    jQuery('#address').val(data.address);
                    jQuery('#address_etc').focus();
                    console.log(data);
                }
            }).open();
        }
    </script>
</head>
<body>
	<div id="wrap">
		<!-- 헤더들어가는 곳 -->
		<jsp:include page="../inc/top.jsp" />
		<!-- 헤더들어가는 곳 -->

		<!-- 본문들어가는 곳 -->
		<!-- 본문메인이미지 -->
		<div id="sub_img_member"></div>
		<!-- 본문메인이미지 -->
		<!-- 왼쪽메뉴 -->
		<nav id="sub_menu">
			<ul>
				<li><a href="../login.jsp">로그인하기</a></li>
			</ul>
		</nav>
		<!-- 왼쪽메뉴 -->
		<!-- 본문내용 -->
		<article>
			<h1>J o i n</h1>
			<form action="joinPro.jsp" id="join" method="post" name="join" >
				<fieldset>
					<legend>필수 입력 사항  </legend>
					*회원가입 후 아이디와 비밀번호는 수정이 되지 않습니다!*<br>
					<label>아이디</label> <input type="text" name="id" class="id" required="required">
					<input type="button" value="아이디 중복체크" required="required"
						onclick="idDupCheck()"><br> <!--  class="dup" -->
						<label>비밀번호</label> <input
						type="password" name="pass" required="required"><br> 
						<label>비밀번호 확인</label> <input type="password" name="pass2" required="required"><br>
					 <label>이름</label><input type="text" name="name" required="required"><br> 
					 <label>이메일</label><input type="email" name="email" required="required" placeholder="이메일 양식에 따라 입력 해 주세요"><br>
					<label>전화번호</label> <select name="phonenum">
						<option>010</option>
						<option>011</option>
						<option>012</option>
						<option>02</option>
						<option>031</option>
						<option>032</option>
						<option>033</option>
						<option>041</option>
						<option>042</option>
						<option>043</option>
						<option>044</option>
						<option>051</option>
						<option>052</option>
						<option>053</option>
						<option>054</option>
						<option>055</option>
						<option>061</option>
						<option>062</option>
						<option>063</option>
						<option>064</option>
					</select>
					 -<input type="text" name="phonenum2" class="form-control" placeholder="'-'없이 입력하세요" required="required" maxlength="8">
					
				</fieldset>

				<fieldset>
					<legend>선택 입력 사항</legend>
					<!--  jQuery('#postcode1').val(data.postcode1); -->
<!--                     jQuery('#postcode2').val(data.postcode2); -->
<!--                     jQuery('#address').val(data.address); -->
<!--                     jQuery('#address_etc').focus(); -->
<label>주소</label>
    <input id = "postcode1" name = "postcode1" type = "text" value = "" style="width:80px;" readonly/> 
    <input id = "postcode2" name = "postcode2" type = "text" value = "" style="width:80px;" readonly/> 
    <input type = "button" onClick = "openDaumZipAddress()" value = "우편번호 검색" />
    <br/>
    &nbsp;&nbsp;<input type="text" id = "address" name = "address" value = "" style = "width:240px;" readonly/><br>
    &nbsp;&nbsp;<input type="text" id = "address2" name = "address2" value = ""  placeholder="나머지 상세 주소" style = "width:200px;"/><br>								
					<label>휴대폰번호</label> <input id = "mobilenum1" name = "mobilenum1" type = "text" value = "" style="width:50px;" maxlength="3"/> -
					<input id = "mobilenum2" name = "mobilenum2" type = "text" value = "" style="width:50px;" maxlength="4"/> -
					<input id = "mobilenum3" name = "mobilenum3" type = "text" value = "" style="width:50px;" maxlength="4"/>
				</fieldset>
				<div class="clear"></div>
				<div id="buttons">
					 <input type="submit" value="회원가입하기" class="submit">
					 <input type="reset" value="리셋하기" class="cancel">
				</div>
			</form>
		</article>
		<!-- 본문내용 -->
		<!-- 본문들어가는 곳 -->
		<div class="clear"></div>
		<!-- 푸터들어가는 곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터들어가는 곳 -->
	</div>
</body>
</html>