<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int price = 500;
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 표준액션 중 include 에 대해서 알아봅니다.</title>
</head>
<body>
	<h3>책소개</h3>
	도서명 : 삼국지<br/>
	저자 : 이순신<br/>
	페이지 : 300페이지<br/>
	<div style="margin: 20px 0;">
		<%-- <%@ include file="01_include.jsp" %> --%>     <!-- 01_include 파일 실행  -->
	</div>										<!-- 이것은 파일 전체가 다 들어온다.  -->
	
	<div style="margin: 20px 0;">
		<jsp:include page="01_include.jsp" />  <!-- jsp 표준액션 : 이것은 결과물만 가져온다. -->
	</div>

	가격 : <%= price %>원 <br/>

</body>
</html>