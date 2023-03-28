package chap02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
=== Servlet 이란 ? 웹서비스 기능을 해주는 자바 클래스를 말한다. ===

*** Servlet 이 되기 위한 조건은 3가지 규칙을 따라야 한다. ***
1. 서블릿(Servlet)은 반드시 
   javax.servlet.http.HttpServlet 클래스를 부모 클래스로 상속을 받아와야 한다. 

2. 웹클라이언트의 요청방식이 GET 방식으로 요청을 해오면
     doGet() 메소드로 응답을 해주도록 코딩을 해야하고,
     웹클라이언트의 요청방식이 POST 방식으로 요청을 해오면
     doPost() 메소드로 응답을 해주도록 코딩을 해주어야만 한다.
      그러므로  반드시  doGet() 메소드와  doPost() 메소드를 
   Overriding(재정의)를 해주어야만 한다.
   
   doGet() 메소드와 doPost() 메소드의 
           첫번째 파라미터는 HttpServletRequest 타입이고,
           두번째 파라미터는 HttpServletResponse 타입이다. 
           
3. 만약에  서블릿(Servlet)에서 결과물을 웹브라우저상에 출력하고자 한다라면 
   doGet() 메소드와 doPost() 메소드 모두 
      서블릿(Servlet)의 두번째 파라미터인 HttpServletResponse response 를 
      사용하여 출력해준다.
*/   


public class GetMethod_01 extends HttpServlet {
 
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		System.out.println("~~~~ 확인용 : doGet 메소드가 호출됨 ~~~~~");
		
		// 첫번째 파라미터인 HttpServletRequest request 가 폼태그에서 전송되어져온 데이터를 처리해주는 용도로 쓰인다.
		String name = request.getParameter("name");     // !!!!!!!!! 암기하기 !!!!!!!!!   전 페이지에서 써준 이름의 값이 나온다 
		String school = request.getParameter("school");   //    school 에 담겨진 값을 얻어온다.
		String color = request.getParameter("color");     //    color 에 담겨진 값을 얻어온다.
		String[] arr_food = request.getParameterValues("food");    // 복수개 선택하는것을 배열로서 받아오는 것이다.
		
		
		//*** 콘솔에 출력하기 시작 *** //      
	      System.out.println("name => "+name);
	      System.out.println("school => "+school);
	      
	      if(color == null) {
	         color = "없음";
	      }
	      
	      System.out.println("color => " +color);
	      
	      if(arr_food != null) {
	      
	         for(int i=0; i<arr_food.length; i++) {
	            System.out.println("arr_food ["+i+"] => " + arr_food[i]);
	         }// end of for--------------
	         
	         String likeFoodes = String.join(",", arr_food);
	         
	         System.out.println("좋아하는 음식은 =>"+ likeFoodes);
	         
	      }
	      else {
	         System.out.println("좋아하는 음식이 없습니다");
	      }
	      //*** 콘솔에 출력하기 끝 *** //
		
		
		// **** 웹 브라우저에 출력하기 시작 **** //
		//HttpServletResponse response 객체는 전송되어져온 데이터를 조작해서 결과물을 나타내고자 할 때 쓰인다.
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		// out 은 웹브라우저에 기술하는 대상제라고 생각하자
		
		out.println("<html>");
		out.println("<head><title>개인성향 테스트 결과 화면</title></head>");
		out.println("<body>");
		out.println("<h2>개인성향 테스트 결과(GET)</h2>");
		out.printf("<span style='color: blue; font-weight: bold;'>%s</span>님의 개인 성향은<br><br>", name);
		
		if(!"없음".equals(color)) {
			out.printf("학력은 %s 이며, %s 색을 좋아합니다.<br><br>", school, color);
		}
		else {
			out.printf("학력은 %s 이며, 좋아하는 색이 없습니다.<br><br>", school);
		}
		/* 
		 	%d ==> decimal 정수
		 	%f ==> float   실수
		 	%s ==> String  문자열
		
		*/
		
		String foodes = "";
		
		if(arr_food != null) {
			foodes = String.join(",",arr_food) + " 입니다.";
		}
		else {
			foodes = "없습니다.";
		}
		
		out.println("좋아하는 음식은 => " + foodes);
		out.println("</body>");
		out.println("</html>");
		
		// **** 웹 브라우저에 출력하기 끝 **** //
	}
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		System.out.println("#### 확인용 : doPost 메소드가 호출됨 ####");
	}
	
	
}
