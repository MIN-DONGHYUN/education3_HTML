<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- ===== JSTL(JSP Standard Tag Library) 사용하기 ===== --%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forTokens 를 이용하여 친구 이름 출력하기</title>
</head>
<body>
	
	<%-- null 도 사용할 수 있는지 확인해 보자  --%>
	
	<c:if test="${requestScope.key_null == null }">   <%-- request 영역에 있는 key_null을 받아옴 --%>
		<div>
			<span style="color: red;">널 이군요!!</span>
		</div>
	</c:if>
	
	
	<c:if test="${empty requestScope.key_null }">  
		<div>
			<span style="color: blue;">널 이군요!!</span>
		</div>
	</c:if>
	
	
	<hr style="border: solid 2px gray;">
	
	
	<c:if test="${requestScope.str_list == null }">   
		<div>
			<span style="color: red;">리스트가 널이군요!!</span>
		</div>
	</c:if>
	


	<%-- empty 를 사용하면 null 도 가능하고 데이터가 없는것도 가능하기 때문에 null 일때를 비교할 필요가 없다. --%>
		
	<c:if test="${empty requestScope.str_list}">   
		<div>
			<span style="color: blue;">리스트가 널이거나 아니면 저장된 데이터가 없군요!!</span>
		</div>
	</c:if>
	




	<h2>forTokens 를 이용하여 친구 이름 출력하기 - 1</h2>
	
	<c:if test="${empty requestScope.friend_name_1}">  <%--  request 영역에 있는 friend_name_1 key를 가진 내용을 가져옴 --%>
		<div>
			<span style="color: red;">친구가 없으시군요~~^______^</span>
		</div>
	</c:if>
	
	
	<c:if test="${not empty requestScope.friend_name_1}">  <%--  request 영역에 있는 friend_name_1 key를 가진 내용을 가져옴 --%>
		<div>
			<ol>
			
				<%-- delims 는 자르는 문자를 선언 즉 items 는 문자열이고 delims는 , 를 기준으로 자른다. --%>
				<c:forTokens var="name" items="${requestScope.friend_name_1}" delims=",">		<%-- 하나의 문자열이 온다. --%>
				<%-- 
					forTokens 에서 items="${}" 에 들어오는 것은 배열이나 List 가 아닌 하나의 문자열이 들어온다.
					delims="," 에서 "," 의 뜻은 분자열을 쪼개는 구분자 역할이다.
				--%>
				
					<li style="color: red;">${name}</li>
					
				</c:forTokens>
			</ol>
		</div>
	</c:if>
	
	
	<c:if test="${not empty requestScope.friend_name_2}">  <%--  request 영역에 있는 friend_name_1 key를 가진 내용을 가져옴 --%>
		<div>
			<ol>
			
				<%-- delims 는 자르는 문자를 선언 즉 items 는 문자열이고 delims는 ,./ 를 기준으로 자른다. --%>
				<c:forTokens var="name" items="${requestScope.friend_name_2}" delims=",./">		<%-- 하나의 문자열이 온다. --%>
				<%-- 
					forTokens 에서 items="${}" 에 들어오는 것은 배열이나 List 가 아닌 하나의 문자열이 들어온다.
					delims=",./" 에서 ",./" 의 뜻은 분자열을 쪼개는 구분자 로서 , 또는 . 또는 / 이다.
				--%>
				
					<li style="color: blue;">${name}</li>
					
				</c:forTokens>
			</ol>
		</div>
	</c:if>
	
	
	
		
	<h2>split 함수를 사용하여 배열로 만든 다음 forEach를 이용하여 친구 이름 출력하기 - 2</h2>
	
	
	<c:if test="${not empty requestScope.friend_name_1}">  <%--  request 영역에 있는 friend_name_1 key를 가진 내용을 가져옴 --%>
		
		<c:set var="arr_friend" value= "${fn:split(requestScope.friend_name_1, ',')}" />
		
		<div>
			<ol>
				<c:forEach var="name" items="${arr_friend}">  <%-- 배열, List를 가져오는것이 forEach --%>
					<li style="color: gold;">${name}</li>
				</c:forEach>
				
			</ol>
		</div>
	</c:if>
	
	
	<c:if test="${not empty requestScope.friend_name_2}">  <%--  request 영역에 있는 friend_name_1 key를 가진 내용을 가져옴 --%>
		
		<c:set var="arr_friend" value= "${fn:split(requestScope.friend_name_2, ',./')}" />
		<%-- 구분자는 ,./ 이다. split은 배열을 만드는 것이다. --%>
		
		<div>
			<ol>
				<c:forEach var="name" items="${arr_friend}">  <%-- 배열, List를 가져오는것이 forEach --%>
					<li style="color: green;">${name}</li>
				</c:forEach>
				
			</ol>
		</div>
	</c:if>
	
	
	
</body>
</html>