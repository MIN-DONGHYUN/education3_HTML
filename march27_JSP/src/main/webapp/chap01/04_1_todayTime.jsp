<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 필요한 클래스를 import 하려면 <%@ page %> page directive(페이지 지시어)를 사용하여 import 를 한다. --%>    
    
<%@ page import="java.util.Date" %>   <%-- import를 하는 방법이다. --%> 
    
<%
	// *** 현쟈시각을 알아오기 (자바코드) *** //
	Date now = new Date();  // 현재시각
	
	String cuurentTime = String.format("%tF %tT %tA" , now, now, now);		//String 클래스, %t는 날자와 관련이 있다.

	String name = "엄정화";	
%>
    
<%= cuurentTime %>    
    
    
<%-- 똑같은 것은 파일 하나 생성후 끼워 넣기가 가능하다
	 이 파일은 04 부분 02와 03 에 끼워넣어졌다.
 --%>    
