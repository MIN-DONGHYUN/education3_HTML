<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--  자바 코드를 뜻한다. -->    
<% 
	String s_firstNum = request.getParameter("firstNum");   /* 웹이기 때문에 String 타입으로 받는다.  */
	String s_secondNum = request.getParameter("secondNum");
	
	/* 유효성 검사를 해왔기 때문에 무조건 다 숫자이므로 exception 을 해 줄 필요가 없다. */
	int firstNum = Integer.parseInt(s_firstNum);
	int secondNum = Integer.parseInt(s_secondNum);
	
	// 결과를 보기 위해 과정들
	int sum = 0;
	for(int i=firstNum; i<=secondNum; i++)
	{
		sum += i;
	} // end of for
	
	// 결과물은 sum이다
	//System.out.println("sum => " + sum);
			
	/* 
		!!!!!! 중요 ( 꼭 암기하기 ) !!!!!!
		== request 내장객체는 클라이언트(02_forward_calc_execute_01.jsp) 가
		   보내온 데이터를 읽어들이는 역할 ( request.getParameter("name명"); ) 도 있고 
		   또한 어떤 결과물을 저장시키는 저장소 기능(request.setAttribute("키", 저장할 객체); )도 있다.
	*/	
	
	
	//request.setAttribute("firstNum", new Integer(firstNum));
	//request.setAttribute("secondNum", new Integer(secondNum));
	// 또는
	request.setAttribute("firstNum", firstNum);
	request.setAttribute("secondNum", secondNum);
	
	//request.setAttribute("sum", new Integer(sum));       // "sum"은 키, new 부분은 객체 
	// 원래는 위처럼 객체를 만들어서 저장을 해야 하지만 자바가 알아서 auto boxing(자동적으로 객체로 만들어 주는것) 해주기 때문에 아래처럼 쓸 수 있다. 
	request.setAttribute("sum", sum);                    // autoboxing 으로 객체를 이렇게 써도 됨
	// sum 결과물은 02_forward_calc_view_03.jsp 이 파일만 사용할 수 있다.(꺼내올 수 잇다.)
	
	
	
	/////////////////////////////////////////////////////////////////////////////////////
	
	
	request.setAttribute("firstNum_EL", firstNum);
	request.setAttribute("secondNum_EL", secondNum);
	request.setAttribute("sum_EL", sum); 
	
	
%>			


<jsp:forward page="02_forward_calc_view_03.jsp" />     <!--  넘겨버린다. URL은 02번 이지만 보여주는것은 03 번이 보여지게 된다.  -->
