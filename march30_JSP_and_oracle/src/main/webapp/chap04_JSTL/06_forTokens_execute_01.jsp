<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.*"  %>    

<%
	
	request.setAttribute("key_null", null);  /* null 일때의 키는 key_null */
	
	/* 리스트 사용 위해   */
	// List<String> str_list = null;     이거 쓸바에는 나중에 empty 로 나타내는것이 좋다.
	List<String> str_list = new ArrayList<>();
	request.setAttribute("str_list" , str_list);
	
	///////////////////////////////////////////////////////////////////////////////


	String friend_name_1 = "이순신,엄정화,안중근,허준,유관순";
	String friend_name_2 = "이나은,배수지.류민희,정은비/이지은";
	
	request.setAttribute("friend_name_1", friend_name_1);
	request.setAttribute("friend_name_2", friend_name_2);
	
	
	
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("06_forTokens_view_02.jsp");
	dispatcher.forward(request, response);
%>