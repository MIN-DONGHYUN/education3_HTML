<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="chap03.MemberDTO" %>    
    
<%
	// 스크립틀릿 

	// == MemberDTO  객체 생성하기 == //
	MemberDTO mbr1 = new MemberDTO();    // 기본생성자
	mbr1.setName("이순신");
	mbr1.setJubun("9703291");
	
	String name1 = mbr1.getName();
	String jubun1 = mbr1.getJubun();
	String gender1 = mbr1.getGender();
	int age1 = mbr1.getAge();
	
	//////////////////////////////////////////////////
	
	MemberDTO mbr2 = new MemberDTO("엄정화", "0103294");   // 파라미터가 있는 생성자 
	
	String name2 = mbr2.getName();
	String jubun2 = mbr2.getJubun();
	String gender2 = mbr2.getGender();
	int age2 = mbr2.getAge();
	
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 표준 액션 중 useBean 에 대해서 알아봅니다.</title>
</head>
<body>
	<div>
		<h2>스크립틀릿 을 사용하여 MemberDTO 클래스의 객체 정보 불러오기</h2>
	</div>
	
	<ul>
		<li>성명 : <%= name1%></li>
		<li>주민번호 : <%= jubun1%></li>
		<li>성별 : <%= gender1%></li>
		<li>나이 : <%= age1%></li>
	
	</ul>
	
	<br>
	
	<ul>
		<li>성명 : <%= name2%></li>
		<li>주민번호 : <%= jubun2%></li>
		<li>성별 : <%= gender2%></li>
		<li>나이 : <%= age2%></li>
	
	</ul>
	
	
	<hr style="border: solid 1px red;">
	
	<div>
		<h2>JSP 표준액션중 useBean 을 사용하여 MemberDTO 클래스의 객체 정보 불러오기</h2>
		<jsp:useBean id="mbr3" class="chap03.MemberDTO" />
		
		<%-- 
			위의 것은 아래의 뜻이다.
			chap03.MemberDTO mbe3 = new chap03.MemberDTO();  // 기본 생성자 (기본 생성자는 곡 필요하다)
			
		   즉, chap03.MemberDTO 클래스의 기본생성자로 mbr3 이라는 객체를 생성하는 것이다.
		   그래서 JSP 표준 액션 중 useBean을 사용하려면 반드시 기본 생성자가 존재해야 한다.
		 --%>
		 
		
		 <jsp:setProperty property="name" name="mbr3" value="김태희"/>  <!-- peoperty 는 항상 첫 글자 소문자, 이름엔 객체 넣기 --> 
		<%-- 
			위의 것은 아래의 뜻이다.
			mbr3.setName("김태희"); 와 같은 것이다.
		
		 --%>
		 
		 <jsp:setProperty property="jubun" name="mbr3" value="8904022"/>
		 
		 <ul>
		 	<li>성명 : <jsp:getProperty property="name" name="mbr3" /></li>
		 	<%--
		 		위의 것은 아래의 뜻이다.
		 		mbr3.getName();
		 	 --%>
		 	<li>주민번호 : <jsp:getProperty property="jubun" name="mbr3" /></li>		<!-- 이것은 메소드 -->

		 	<li>성별 : <jsp:getProperty property="gender" name="mbr3" /></li>
		 	<%--
		 		위의 것은 아래의 뜻이다.
		 		mbr3.getGender();
		 	 --%>
		 	<li>나이 : <jsp:getProperty property="age" name="mbr3" /></li>
		 </ul>
		 	
	</div>


</body>
</html>