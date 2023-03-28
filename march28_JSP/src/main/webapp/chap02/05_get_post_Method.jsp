<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	// 암기 하기
	// 컨텍스트 패스명(context path name)을 알아오고자 한다.
	String ctxPath = request.getContextPath();

	System.out.println("ctxPath => " + ctxPath);
	// 결과 :  ctxPath => /JSPServletBegin   <== WAS (톰켓서버) Document Base Path 설정의 기본값임.
	// 톰켓에서 바꾼후 /aaa 로 결과 
	// 결과 :  ctxPath => /aaa			   <== WAS (톰켓서버) Document Base Path 설정을 /aaa으로 변경한 경우.
	// 톰켓에서 바꾼후 아무글자없는것으로 바꾼 결과 
	// 결과 :  ctxPath => 				   <== WAS (톰켓서버) Document Base Path 설정을 아무것도 없는것 또는 / 으로 변경한 경우.
	
	// 기본 주소: http://localhost:9090/JSPServletBegin/chap02/01_getMethod.jsp
	
	// 바꾸는 방법 : https://mdh2057.tistory.com/71
	
	
%>    

    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form 태그의 GET/POSt 방식으로 데이터 전송하기</title>

<style type="text/css">

	ul {
		list-style-type: none;
	}
	li {
		line-height: 200%;
	}
	

</style>

<script type="text/javascript" src="<%= ctxPath %>/js/jquery-3.6.4.min.js"></script>
<script type="text/javascript">


	$(document).ready(function(){
		
		$("form[name='registerFrm']").submit(function(){
			
			if($("input#name").val().trim() == "" ) {     // 이름이 공백이라면 
				alert("성명은 필수항목 이오니 성명을 입력하세요!!");
				return false;   // return false; 이 submit(전송)을 하지 말라는 뜻이다.
			}
			
		});
		
		
	});


</script>



</head>
<body>
	
	<form name="registerFrm" action="<%= ctxPath %>/05_getPostMethod.do">   <!-- method 에 get을 쓰면 전송되어질 값이 보이고 post 를 쓰면 전송되어질 값이 안보인다. (method 생략시 같다.) -->
	<%-- 
		<form name="registerFrm" action="<%= ctxPath %>/05_getPostMethod.do" method="Post">
	--%>
	
	<%-- !!! 중요 !!! (암기 부분)
		확장자가 .jsp 또는 .html 인 파일에서 URL 경로를 나타낼 때 맨 앞에 / 가 오면 
		그 앞에는 자동적으로 http://ip주소:포트번호 가 붙게 된다.	
	
		현재 <%= ctxPath %> 이 /JSPServletBegin 이므로 <%= ctxPath %>/01_getMethod.do 의 뜻은 
		http://localhost:9090/JSPServletBegin/01_getMethod.do 이라는 말이다.
		
	 --%>
	 <%--
	 	form 태그에서 submit(전송)을 하면 
	 	http://localhost:9090/JSPServletBegin/01_getMethod.do 으로 데이터를 전송시킨다
	 	만약에 mmethod를 생략하면 method="get" 으로 되어진다.
	 
	 	GET 방식은 웹브라우저 주소창에 http://URL주소?전송되어질데이터 와 같이 나타내주는 것이며   (? 가 나올시 GET 방식임을 기억하자)
	 	? 를 중심으로 왼쪽은 사이트 URL 주소이며, 오른쪽은 전송되어질 데이터를 나타낸다.
	 	전송되어질 데이터는 예를 들어 name=민콩&school=초대졸 와 같이 나오는데
	 	& 는 데이터구분자 역할을 해준다.
	 	
	 	GET 방식은 웹브라우저 주소창에 데이터 값을 공개하므로 보안성이 떨어지지만 
	 	그에 비해 POST 방식은 웹브라우저 주소창에 데어터값을 담는 것이 아니라 본문(body)에 데이터 값을 담아서 보내므로 보안성이 좋다.
	 	
	 	그런데 속도측면에서는 POST 방식 보다는 GET 방식이 좀 더 빠르다!!! (김밥 예시 => GET 은 그냥 김밥줌 , POST 보안을 위해 포장지에 김밥을 주고 김밥을 먹으려면 포장지를 뜻어야함 )
	 	
	 	그래서 일반적으로 보안과 관계없는 데이터조회(예: 물품정보 조회) 와 같은 select 절에서는 GET 방식을 주로 사용한다.
	 	회원가입시 또는 회원정보변경시 입력되어질 데이터는 개인 정보이므로 보안성이 있어야 한다.
	 	즉, insert 또는 update 와 같이 DML 작업은 일반적으로 POST 방식이 주로 사용된다.
	 	
	  --%>
	  
	  <%--
	  	submit(전송) 을 하면 <%= ctxPath %>/01_getMethod.do 로 보내어서 처리를 요청한다.
	  	/JSPServletBegin/01_getMethod.do 은 누가 처리를 해주는지 배치서술자인 web.sml 에 기술해주어야 한다.
	  
	  	web.xml 에 가보면 <servlet-mapping> 에 URL 패턴으로 /01_getMethod.do 가 기술되어 있고 
	  	이어서 실제로 처리해주는 <servlet-class> 에 클래스명으로 chap02.GetMethod_01 이 기술되어 있다.
	  	바로 이렇게 기술되어진 <servlet-class> 클래스명인 chap02.GetMethod_01 가 action 퍼리를 해주게 된다.
	  	
	  	!!! 아주 중요한 것은 web.xml 파일을 언제 읽어들이느냐 하면 
	  	WAS가 구동(start) 가 되어질 때 web.xml 파일에 기술된 내용을 딱 1번만 읽어들어서 web.xml 파일에 기술된 내용대로 WAS가 작동하도록 되어진다.
	  	그러므로 web.xml 파일에 내용을 추가하거나 삭제하는 등 변경되어지면 변경된 내용대ㅐ로 작동하기 위해서는 WAS를 반드시 껏다가 다시 켜애만 변경되어진 내용대로 작동된다. !!!!
	  	
	   --%>
	
		<fieldset>
	      <legend>개인성향 테스트(GET/POST method)</legend>
	      <ul>
		         <li>
		            <label for="name">성명</label>
		            <input type="text" name="name" id="name" placeholder="성명입력"/> 
		         </li>
		         <li>
		            <label for="school">학력</label>
		            <select name="school" id="school">   <!-- 관습상 id와 name 을 같게 한다. -->
		               <option >고졸</option>  <!-- value 값이 주소로 넘어감 안쓰면 쓴 내용이 value 값으로 넘어감 지금은 고졸 아래줄은 초대줄 -->
		               <option >초대졸</option>
		               <option >대졸</option>
		               <option value="대학원졸">대학원졸</option>
		            </select>
		         </li>
		         <li>
		            <label for="">좋아하는 색상</label>
		            <div>
		               <label for="red">빨강</label>
		               <input type="radio" name="color" id="red" value="red" />
		               
		               <label for="blue">파랑</label>
		               <input type="radio" name="color" id="blue" value="blue" />
		               
		               <label for="green">초록</label>
		               <input type="radio" name="color" id="green" value="green" />
		               
		               <label for="yellow">노랑</label>
		               <input type="radio" name="color" id="yellow" value="yellow" />
		            </div>
		         </li>
		         <li>
		            <label for="">좋아하는 음식(다중선택)</label>
		            <div>
		                <label for="food1">짜장면</label>
		               <input type="checkbox" name="food" id="food1" value="짜장면" />
		               &nbsp;
		               
		               <label for="food2">짬뽕</label>
		               <input type="checkbox" name="food" id="food2" value="짬뽕" />
		               &nbsp;
		               
		               <label for="food3">탕수육</label>
		               <input type="checkbox" name="food" id="food3" value="탕수육" />
		               &nbsp;
		               
		               <label for="food4">양장피</label>
		               <input type="checkbox" name="food" id="food4" value="양장피" />
		               &nbsp;
		               
		               <label for="food5">팔보채</label>
		               <input type="checkbox" name="food" id="food5" value="팔보채" />
		            </div>
		         </li>
		         <li>
		            <input type="submit" value="전송" />
		            <input type="reset" value="취소" />
		         </li>
		      </ul>
	   </fieldset>
	
	
	</form>
	
</body>
</html>