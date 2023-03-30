<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- ===== JSTL(JSP Standard Tag Library) 사용하기 ===== --%>    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choose 를 사용하여 전송되어져온 주민번호를 가지고 성별을 파악한 결과물 출력하기</title>
</head>
<body>

	<c:set var= "jubun" value="${param.jubun}" /> 
	<c:set var="len"    value="${fn:length(jubun)}"/>     <!-- 함수의 길이를 나오게 해서 변수에 넣는다.  -->
	<c:set var="genderno" value="${fn:substring(jubun, 6, 7)}"/>   <!-- "9803302234567" 같이 쓸때 6번째에서 7번째 전까지 봅는다. -->
	
	주민번호 : ${jubun} <br>
	주민번호 문자열 길이 :  ${len} <br>
	성별을 나타내어주는 숫자 : ${genderno} <br>
	
	<c:if test="${len eq 0}">
		<span style="color: red;">주민번호를 입력하지 않으셨습니다.</span>
	</c:if>
	
	
	<c:if test="${len ne 0 and len ne 13}">      <!-- 0자리, 13 자리가 아니면 -->
		<span style="color: blue;">주민번호의 길이가 맞지 않습니다.</span>
	</c:if>
	
	
	<c:if test="${len eq 13}">      <!-- 13자리 이면은 -->
		<c:choose>
			<c:when test="${genderno eq '2'}">
				1900년대생 여자입니다.  <br>
			</c:when>
		
			<c:when test="${genderno eq '4'}">
				2000년대생 여자입니다.  <br>
			</c:when>
			
			<c:otherwise>
				남자입니다. <br>
			</c:otherwise>
		
		</c:choose>
	</c:if>
	
	
	<br>
	
	
	<c:choose>
			<c:when test="${genderno eq '1' or genderno eq '3'}">
				남자입니다.  <br>
			</c:when>
				
			<c:otherwise>
				여자입니다. <br>
			</c:otherwise>
	</c:choose>
	

</body>
</html>