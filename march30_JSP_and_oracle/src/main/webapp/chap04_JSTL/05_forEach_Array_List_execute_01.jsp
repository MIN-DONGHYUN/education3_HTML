<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*, chap03.PersonDTO" %>

<%
	String[] arr_friend = {"임윤아", "배수지" , "정은비", "정예린", "이나은", "이지은"};  /*  "임윤아", "배수지" , "정은비", "정예린", "이나은", "이지은" */

	request.setAttribute("arr_friend", arr_friend);  /* arr_friend를 키값으로 준다. */
	
	
	////////////////////////////////////////////////////////////////////////////////
	
	/* 리스트로 만들어 보기 */
	List<PersonDTO> person_list = new ArrayList<>();
	
	PersonDTO person_1 = new PersonDTO();
	
	person_1.setName("이지은");
	person_1.setSchool("대졸");
	person_1.setColor("green");
	person_1.setFood("초콜릿,마이쥬,육회비빔밥,광어회,조개구이,참이슬".split("\\,")); // ,도 되지만 \\,로 한다
	
	PersonDTO person_2 = new PersonDTO();
	
	person_2.setName("이나은");
	person_2.setSchool("고졸");
	person_2.setColor("blue");
	person_2.setFood("순대,라면,떡볶이".split("\\,"));
	
	PersonDTO person_3 = new PersonDTO();
	
	person_3.setName("정은비");
	person_3.setSchool("대학원졸");
	person_3.setColor("green");
	person_3.setFood("감자탕,부대찌개,순대국,곰탕".split("\\,"));
	
	person_list.add(person_1);
	person_list.add(person_2);
	person_list.add(person_3);
	
	request.setAttribute("person_list", person_list);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("05_forEach_view_02.jsp");
	dispatcher.forward(request, response);		/* 넘겨주기 위해 */
	
%>	
	
	
	