package chap03;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/registerPerson.do")
public class RegisterPerson extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getMethod();   // GET 또는 POST 를 알아오는 것이다 (꼭 암기하기 !!!!!!!!)
		
		System.out.println("확인용 method => " + method);
		
		// 대소문자 구분 X
		if("POST".equalsIgnoreCase(method)) {
			// POST 방식으로 들어온 경우 
			
			
			// doPost() 에서 한글이 안 깨지기 위해서 
			//request.setCharacterEncoding("UTF-8);  을 넣어줘야 하지만
			// my.filter.EncodeFilter 필터를 작성했기 때문에 넣어줄 필요가 없다.
			
			
			// 이름, 학력, 색상, 음식 값을 넘겨준다.
			String name = request.getParameter("name");		//form 태그에서 넘어온 것
			String school = request.getParameter("school");		//form 태그에서 넘어온 것
			String color = request.getParameter("color");		//form 태그에서 넘어온 것
			String[] arr_food = request.getParameterValues("food");		//form 태그에서 넘어온 것 
			
			String foodes = String.join(",", arr_food);    // 체크박스 이므로 여러개를 받기 위해 join
			
			// 맵에 담는다.
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("name", name);
			paraMap.put("school", school);
			paraMap.put("color", color);
			paraMap.put("foodes", foodes);
			
			
			request.setAttribute("paraMap", paraMap);   // 넘거준다.
			
			
			// 필수 암기 부분   (잘못되어지면 에러 파일을 만들자 )
			RequestDispatcher dispatcher = request.getRequestDispatcher("/chap03_StandardAction/03_forward_post_view_03.jsp");
			// forward 되어질 페이지를 "" 에 넣는다.
			dispatcher.forward(request, response);   // 넘긴다.
			
		}
		else {
			// GET 방식으로 들어온 경우 
			
			// 필수 암기 부분
			RequestDispatcher dispatcher = request.getRequestDispatcher("/chap03_StandardAction/03_forward_get_error_02.jsp");
			// forward 되어질 페이지를 "" 에 넣는다.
			dispatcher.forward(request, response);   // 넘긴다.
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
