<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form 태그를 사용한 데이터 전송시 useBean 을 사용하여 결과 보여주기</title>
</head>
<body>

	<h2>개인성향 입력 결과 정보(JSP 표준액션 중 useBean 을 사용한 것)</h2>

	<jsp:useBean id="psdto" class="chap03.PersonDTO" />   <!-- 객체를 만들어 오고 -->
	
<%--	
	<jsp:setProperty property="name" name="psdto" value="${param.name}"/>   <!-- ${param.name} 은 자바 request.getParameter("name") 과 같다. -->
	<jsp:setProperty property="school" name="psdto" value="${param.school}"/>   <!-- ${param.school} 은 자바 request.getParameter("school") 과 같다. -->
	<jsp:setProperty property="color" name="psdto" value="${param.color}"/>   <!-- ${param.color} 은 자바 request.getParameter("color") 과 같다. -->
	<jsp:setProperty property="food" name="psdto" value="${paramValues.food}"/>   <!-- ${paramValues.food} 은 자바 request.getParameterValues("food") 과 같다. -->
--%>

<%-- 또는 위의 것을 아래의 것으로 대체가 가능하다
	 단, 전제조건은 05_useBean_form_execute_01.jsp 파일의 form 태그내에 name 값으로 준 것이 chap03.PersonDTO 의 field명과 같아야만 한다.
	 
	 
	 (~~~~~~~~~~~~~~~~~~~~~~~~   기억하기   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~)
	 
	 3박자가 맞아야 한다. form 태그에 있는 name의 값,  DTO 의 값 , 테이블에 있는 컬럼 값 이 모두 같아야 한다.
	 
 --%>
	
	<jsp:setProperty property="*" name="psdto"/>
	
	
	<ul>
		<li>성명 : <jsp:getProperty property="name" name="psdto"/></li>
		<li>학력 : <jsp:getProperty property="school" name="psdto"/></li>
		<li>색상 : <jsp:getProperty property="color" name="psdto"/></li>
		<li>음식 : <jsp:getProperty property="strFoodes" name="psdto"/></li>   <!-- strFoodes는 필요에 의해서 우리가 만든 것이다. -->
	
	
	</ul>
	

</body>
</html>