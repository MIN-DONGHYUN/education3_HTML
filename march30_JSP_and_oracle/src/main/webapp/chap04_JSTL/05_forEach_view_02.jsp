<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.* , chap03.PersonDTO" %>    

<%-- ===== JSTL(JSP Standard Tag Library) 사용하기 ===== --%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  



<%
	String[] arr_friend = (String []) request.getAttribute("arr_friend");  /* 키 값으로 내용 가져온다.  */
	List<PersonDTO> person_list = (List<PersonDTO>) request.getAttribute("person_list");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구명단 출력하기(스크립틀릿, JSTL)</title>

<style type="text/css">

	ul.ul_person > li {
		color: orange;
		font-size: 14pt;
	}
	
	ul.person_ul2 > li {
		color: navy;
		font-size: 14pt;
	}

</style>

</head>
<body>

	<h2>스크립틀릿을 사용한 것</h2>
	
		<!-- 자바코드를 아래처럼 끊어서 하면 그 사이에는 HTML 코드를 사용 할 수 있다. -->
		<%
			if(arr_friend.length == 0) {
		%>		
			<div>	
				<span style="color: red;">친구명단이 없습니다.</span>
			</div>
		<% 
			}
			else{
		%>	
			<ol>
		<% 	
				for(int i=0; i<arr_friend.length; i++) {
		%>
					<li style="color: green;"><%= arr_friend[i] %></li>
		<% 
				}
			}
		%>
	</ol>
	
	<hr style="border: solid 1px red;">
	
	
	<h2>JSTL을 사용한 것</h2>

	<c:if test="${ empty requestScope.arr_friend}">
		<div>
			<span style="color: white; background-color: red;">친구 명단이 없습니다.</span>
		</div>
	</c:if>

	<c:if test="${not empty requestScope.arr_friend}">
	

		<ol>
			<%-- !!!!!!! 기억하기!!!!!!! items="${}" 에 들어오는 것은 배열 또는 LIST가 오게 된다. !!!!! --%>
			<c:forEach var="friendName" items= "${requestScope.arr_friend }">
				<li style="color: blue;">${friendName}</li>   
				
			</c:forEach>
			
		</ol>
	</c:if>	
	
	
	<hr style="border: solid 1px blue;">
	
	
	<h2>스크립틀릿을 사용한 것</h2>
	
	<!-- 자바코드를 아래처럼 끊어서 하면 그 사이에는 HTML 코드를 사용 할 수 있다. -->
		<%
			if( person_list.size() == 0) {
			
		%>		
			<div>	
				<span style="color: red;">회원명단이 없습니다.</span>
			</div>
		<% 
			}
			else{
				for(PersonDTO person : person_list) {
		%>
					<ul class="ul_person">
						<li>성명 : <%= person.getName()%></li>
						<li>학력 : <%= person.getSchool()%></li>
						<li>색상 : <%= person.getColor()%></li>
						<li>음식 : <%= person.getStrFoodes()%></li>				
					</ul>
		
		<%		
				}// end of for
			}// end of else
		%>	

	
	<h2>JSTL을 사용한 것</h2>
	
	<c:if test="${empty requestScope.person_list}">
	
		<div>	
			<span style="color: white; background-color: red;">회원명단이 없습니다.</span>
		</div>
	
	</c:if>
	
	
	<c:if test="${not empty requestScope.person_list}">
	
		<%-- !!!!!!! 기억하기!!!!!!! items="${}" 에 들어오는 것은 배열 또는 LIST가 오게 된다. !!!!! --%>
		<c:forEach var="person_dto" items="${requestScope.person_list}">
			
			<ul class="person_ul2">
				<li>성명 : ${person_dto.name}</li>
				<%-- !!!! 중요 !!!! 
					${person_dto.name} 에서 name 은 필드 명이 아니라 
					getName{} 에서 get 다음에 나오는 Name 이고 
					반드시 첫글자는 소문자 이어야 한다. 그래서 name 이다.
				--%>
				<li>학력 : ${person_dto.school}</li>
				<li>색상 : ${person_dto.color}</li>
				<li>음식 : ${person_dto.strFoodes}</li>			
			</ul>	
		</c:forEach>
	
	</c:if>
	
	
	
</body>
</html>