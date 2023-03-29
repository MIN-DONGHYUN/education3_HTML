<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- ===== JSTL(JSP Standard Tag Library) 사용하기 ===== --%>    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전송 되어져 온 값을 if 를 사용하여 비교한 결과물 출력하기</title>
</head>
<body>

	<c:if test="${param.first eq param.second }">     <!-- test 에는 비교조건을 넣어야 한다.  , eq 는 같냐는 것이다.-->
		${param.first} 와 ${param.second} 은 <span style="color: blue;">같습니다.</span>
	</c:if>
	
	<c:if test="${param.first ne param.second }">     <!-- else if 는 없기에 if를 또 씀 test 에는 비교조건을 넣어야 한다.  , ne 는 같지 않냐는 것이다.-->
		${param.first} 와 ${param.second} 은 <span style="color: red;">같지 않습니다.</span>
	</c:if>
	
	
	<hr style="border: solid 1px red;">
	
	
	<c:if test="${param.first == param.second }">     <!-- test 에는 비교조건을 넣어야 한다.  , eq 는 같냐는 것이다.-->
		${param.first} 와 ${param.second} 은 <span style="color: blue;">같습니다.</span>
	</c:if>
	
	<c:if test="${param.first != param.second }">     <!-- else if 는 없기에 if를 또 씀 test 에는 비교조건을 넣어야 한다.  , ne 는 같지 않냐는 것이다.-->
		${param.first} 와 ${param.second} 은 <span style="color: red;">같지 않습니다.</span>
	</c:if>
	
	
</body>
</html>