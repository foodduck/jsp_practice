<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  ajax_form sample -->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼 데이터를 전송하는 곳</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script>
$(document).ready(function(){
	$("#check").click(function(){
		if($("#userid").val()==0 || $("#userid").val()=="") {
			$("#result").text("아이디를 입력해주세요");
			return;
		}
		query = { userid:$("#userid").val() };
		$.ajax({		//데이터를 보내는 부분
			url:'ajax_test1.jsp',
			type:'post',
			data:query,
			success : function(data2){		//다시 처리된 결과를 받아오는 부분
				//console.log(data2);
				var start = data2.search("<body>");
				var end = data2.search("</body>");
				var res = data2.substring(start+6,end);
				const obj = JSON.parse(res);			//JSON 형태를 파싱
			    //console.log(obj.result);
				if(obj.result == "ok"){
					$("#result").text(obj.username+"님의 이메일 : "+obj.email);
				} else {
					$("#result").text("존재하지 않는 아이디입니다.");
				}
			},
			error : function() {
				alert("서버요청 실패");
			}
		});
	});
});	
</script>	
</head>
<body>
	<label for="userid">USER ID</label> : 
	<input type="text" id="userid" /><br /><br />
	<label for="userpw">USER PW</label> : 
	<input type="password" id="userpw" />
	<button id="check">Check</button>
	<p id="result"></p>
</body>
</html>