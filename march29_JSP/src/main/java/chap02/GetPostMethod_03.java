package chap02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetPostMethod_03 extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		execute(request, response);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		execute(request, response);
	}
	
	
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		String method = request.getMethod();    //form 태그에서 전송되어져온 method 방식을 알려주는 것이다.
		
		//System.out.println("method => " + method);
		// method => GET
		// method => POST
		
		if("GET".equals(method)) {
			System.out.println("~~~~~ 확인용 : GET 방식으로 exectue 메소드가 호출됨 ~~~~~");
		}
		else
		{
			System.out.println("~~~~~ 확인용 : POST 방식으로 exectue 메소드가 호출됨 ~~~~~");
		}
		
		/*
        post 방식으로 넘어온 데이터중 영어는 글자가 안깨지지만,
        한글은 글자모양이 깨져나온다.
        그래서  post 방식에서 넘어온 한글 데이터가 글자가 안깨지게 하려면 
        아래처럼 request.setCharacterEncoding("UTF-8"); 을 해야 한다.
        주의할 것은 request.getParameter("변수명"); 보다 먼저 기술을 해주어야 한다는 것이다.      
		 */
		
		request.setCharacterEncoding("UTF-8"); // 한글이 안깨지게 하기 위해 
		
		
		
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
		out.println("<h2>개인성향 테스트 결과("+method+")</h2>");
		out.printf("<span style='color: green; font-weight: bold;'>%s</span>님의 개인 성향은<br><br>", name);
		
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
	

}
