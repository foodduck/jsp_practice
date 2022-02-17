<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  ajax_form sample -->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sevlet to jsp - 폼 데이터를 전송하는 곳 - 아이디중복체크</title>
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
			url:'IdCheckCtrl',
			type:'post',
			data:query
		}).done(function(data2){		//다시 처리된 결과를 받아오는 부분
				console.log(data2);
				const obj = JSON.parse(data2);			//JSON 형태를 파싱
			    //console.log(obj.result);
				if(obj.result == "no"){
					$("#result").text("사용이 불가능한 아이디 입니다.");
				} else {
					$("#result").text("사용이 가능한 아이디입니다.");
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