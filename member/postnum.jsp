<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title></title>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
</head>
<body>
<br><br><br>
<h2> 우편번호 검색하기</h2>
<div style="text-align:center; margin:0 0 100px 0; background:#555; line-height:80px;">
	<a style="color:#fff; font-weight:bold; font-family:tahoma; font-size:20pt;" ></a>
</div>

우편번호 : <input type="text" name="zip" style="width:80px; height:26px;" />
<button type="button" style="width:60px; height:32px;" onclick="openZipSearch()">검색</button><br>
주소 : <input type="text" name="addr1" style="width:300px; height:30px;" /><br>
상세 : <input type="text" name="addr2" style="width:300px; height:30px;" />

<script>
function openZipSearch() {
	new daum.Postcode({
		oncomplete: function(data) {
			  var addr = ''; // 주소 변수
              var extraAddr = ''; // 참고항목 변수
              if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                  addr = data.roadAddress;
              } else { // 사용자가 지번 주소를 선택했을 경우(J)
                  addr = data.jibunAddress;
              }
              if(data.userSelectedType === 'R'){
            	   if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                       extraAddr += data.bname;
                   }
            	   if(data.buildingName !== '' && data.apartment === 'Y'){
                       extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                   }
            	   if(extraAddr !== ''){
                       extraAddr = ' (' + extraAddr + ')';
                   }
            	   document.getElementById("sample6_extraAddress").value = extraAddr;
              } else {
                  document.getElementById("sample6_extraAddress").value = '';
              }
              document.getElementById('sample6_postcode').value = data.zonecode;
              document.getElementById("sample6_address").value = addr;
              // 커서를 상세주소 필드로 이동한다.
              document.getElementById("sample6_detailAddress").focus();
		}
	
	}).open();
}

</script>
</body>
</html>