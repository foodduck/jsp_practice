3.<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="java.sql.*" %>
<%@ page import="com.shop.model.*" %>
<%@ page import="com.shop.view.*" %>
<%@ page import="com.shop.biz.*" %>
<%@ page import="com.shop.controller.*" %>
<%
	ArrayList<CustomVO> cusList = (ArrayList<CustomVO>) request.getAttribute("cusList");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객관리</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0, userscalable=no"/>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
ul { list-style: none; }
.tit { font-size:48px; text-align: center; }
.logo { float:left; }
.tnb { float:right; }
.tnb li { float:left; margin-left:15px; height: 42px;  }
.tnb li a { display:block; height:42px; line-height: 42px; }
#gnb { clear:both; }
.tit { font-size:48px; text-align: center; }
.btn-default { color:#fff; background-image: linear-gradient(to bottom,#111 0,#222 100%); }
.btn-default:hover { background-color:deepskyblue; }
</style>
</head>
<body>
<div class="container">
	<%@ include file="admin_header.jsp" %>
	<h2>회원 목록</h2>
	<div class="content">
		
		<table class="table">
			<thead>
				<tr>
					<th class="item1">연번</th>
					<th class="item2">회원아이디</th>
					<th class="item3">이름</th>
					<th class="item4">전화번호</th>
					<th class="item5">이메일</th>
					<th class="item6">등급</th>
					<th class="item7">편집</th>
				</tr>
			</thead>
			<tbody>
		<%
		int cnt = cusList.size();
		for(int i=0;i<cusList.size();i++) {
			CustomVO custom = null;
			custom = cusList.get(i);
			String grade = "";
			if(custom.getGrade()==1){
				grade = "관리자";
			} else if(custom.getGrade()==2) {
				grade = "우수회원";
			} else if(custom.getGrade()==3) {
				grade = "정회원";
			} else {
				grade = "준회원";
			}
		%>
				<tr>
					<td class="item1"><%=cnt - i %></td>
					<td class="item2"><%=custom.getCusid() %></td>
					<td class="item3"><%=custom.getCusname() %></td>
					<td class="item4"><%=custom.getCustel() %></td>
					<td class="item5"><%=custom.getCusemail() %></td>
					<td class="item6"><%=grade %></td>
					<td class="item7">
						<a href="GetCustomCtrl?cusid=<%=custom.getCusid() %>" class="btn btn-default">편집</a>
						<a href="DeleteCustomCtrl?cusid=<%=custom.getCusid() %>" class="btn btn-default">삭제</a>
					</td>
				</tr>
		<%
		}
		%>
			</tbody>
		</table>
	</div>
	<%@ include file="admin_footer.jsp" %>
</div>	
</body>
</html>