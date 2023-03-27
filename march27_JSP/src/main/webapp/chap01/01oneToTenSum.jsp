<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1부터 10까지의 합을 자바에서 구한 다음에 그 결과를 HTML 로 보여줄 것이다.</title>

<style type="text/css">

	span#result_1 {
		color: red;
	}
	
	span.result_2 {
		color: blue;
	}

</style>


<script type="text/javascript">

	// 여기는 자바스크립트의 주석문 입니다.
	
	<%-- 
		여기도 자바스크립트의 주석문 입니다.   (이렇게 사용하면 페이지 소스에서 안보인다.(JSP기준))
	--%>
	
	window.onload = function() {
		let sum = 0;
		for(let i=1; i<=10; i++) {
			sum += i;
		}
		
		document.querySelector("span#result_1").innerHTML = sum;
		
	}
	

</script>



</head>
<body>
	
	<%
		// *** 스크립플릿(scriptlet) 이라고 부른다. ***
		// 스크립플릿(scriptlet) 에 자바코드가 들어오는 부분이다.
		
		// 1줄 주석문
		
		/*
			여러줄 주석문
		*/
		
		int sum = 0;
	
		for(int i=1; i<=10; i++)
		{
			sum += i;
		}
	
	
	%>
	
	<!-- HTML 주석문  -->
	<%-- JSP 주석문 --%>
	
	<%-- 웹페이지에서 주석문을 안보이게 하는 방법이다. --%>
	<%-- 
		<% 로 시작하여 %> 로 끝나는 것을 "스크립플릿(scriptlet)" 이라고 부른다.
		"스크립플릿(scriptlet)" 에 자바 코딩이 들어가는 것이다.
		그런데 "스크립플릿(scriptlet)" 에 코딩된 부분은 웹 브라우저에서 소스보기를 하더라도 안 보여주므로 보안성이 좋다.
		
		 <%= %> 을 expression(표현식)이라고 부른다.
		 이 expression(표현식)은 "스크립플릿(scriptlet)" 에서 작성된 결과값" 을 웹브라우저 상에 보여주고자 할때 사용하는 것이다. 
	 
	 	
	  	================================================================================
	  	
		01oneToTenSum.jsp 라는 파일은 실제로는 
		   확장자가 .java 인 파일로 저장되어서 컴파일 되어진 파일 그리고 
		   확장자가 .class 인 파일로 저장되어 지는데 
		   어느 경로에 저장되어지는지 알아온다.
		   
		C:\NCS\workspace(JSP)\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\JSPServletBegin\org\apache\jsp\chap01\_01oneToTenSum_jsp.java 와 
		C:\NCS\workspace(JSP)\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\JSPServletBegin\org\apache\jsp\chap01\_01oneToTenSum_jsp.class 로 
		저장된다.
		
		혹가다가 01oneToTenSum.jsp 라는 파일을 수정을 했지만
		수정한대로 안 먹을 경우가 혹가다가 있다.
		
		이럴때 해결방법은 
		탐색기에서  _01oneToTenSum_jsp.java 파일과 _01oneToTenSum_jsp.class 파일을 삭제한다.
		그런 다음 다시 이클립스에서 01oneToTenSum.jsp을 저장시킨후 WAS(아파트 Tomcat)을 껏다가 다시 실행시키면
		올바르게 작동하는 _01oneToTenSum_jsp.java 파일과 _01oneToTenSum_jsp.class 파일이 생성된다.
	 	이렇게 하면 잘 될 것이다.
	 	
	 	
	 
	 --%>
	
	<h2>
		1부터 10까지의 합은 <span id="result_1"></span>입니다.
	</h2>


	<hr>   <!-- 선긋기 -->


	<h2>
		1부터 10까지의 합은 <span class="result_2"><%= sum %></span>입니다.
	</h2>


	<h2>
		1부터 10까지의 합애 10을 곱한값은?  <span class="result_2"><%= sum*10 %></span>입니다.
	</h2>



</body>
</html>