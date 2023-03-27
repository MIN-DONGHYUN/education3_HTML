<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 스케줄</title>


<link rel = "stylesheet" type="text/css" href="css/style.css">

</head>
<body>


	<h3>오늘의 일정</h3>
	<ol style="list-style-type: decimal-ledding-zero;">
		<li>기상</li>
		<li>식사</li>
		<li>놀기</li>
		<li>취침</li>
	</ol>	
	
	<div id="today">
		현재시각 : <%@ include file="04_1_todayTime.jsp" %>
		<%-- 
			include directive(지시어) 인 <%@ include %> 를 사용하여
			04_1_todayTime.jsp 파일과 내용물을 넣어주겠다 라는 말이다.
		--%>
	</div>
	
	
	<%-- <p><%= name %> </p> --%>   <%-- 1번파일에서 이름을 가져 왔기에 가능 --%>


</body>
</html>