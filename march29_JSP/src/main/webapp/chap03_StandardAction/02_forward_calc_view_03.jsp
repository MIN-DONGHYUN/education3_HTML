<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	int firstNum = (Integer) request.getAttribute("firstNum");
	int secondNum = (Integer) request.getAttribute("secondNum");

	int sum = (Integer) request.getAttribute("sum");		// 02번 파일의 키를 넣어주면 결과값 객체 sum 을 꺼내온다.
	// Integer 대신 int를 사용할 수 있는 것은 auto unboxing (Integer => int ) 로 가능하다.
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산된 결과값을 보여주는 곳</title>
</head>
<body>

	<h3>계산된 결과값 - 1</h3>
	<%= firstNum %>부터 <%= secondNum %>까지의 합은? <br/>
	결과값 : <span style="color: red;"><%= sum %></span>   <!-- 결과의 값을 가져온다.  -->
	
	<br><br>
	
	<h3>계산된 결과값(EL을 사용한 것) - 2</h3>
	${requestScope.firstNum_EL} 부터 ${requestScope.secondNum_EL} 까지의 합은? <br/>   
	결과값 : <span style="color: blue;">${requestScope.sum_EL}</span>   <!-- 결과의 값을 가져온다.  -->
	
	<br><br>
	
	<!-- 키가 중복이 없다면 이렇게도 사용 가능하다.  -->
	<h3>계산된 결과값(EL을 사용한 것) - 3</h3>
	${firstNum_EL} 부터 ${secondNum_EL} 까지의 합은? <br/>   
	결과값 : <span style="color: orange;">${sum_EL}</span>   <!-- 결과의 값을 가져온다.  -->
	
	
</body>
</html>