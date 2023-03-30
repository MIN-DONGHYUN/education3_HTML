<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	String ctxPath = request.getContextPath();
	// ctxPath => /JSPServletBegin
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두개의 문자열을 입력 받아서 같은지 다른지 검사하기</title>

<%-- 
	<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.4.min.js"></script>
			또는
--%>
	<script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.6.4.min.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function() {
			
			$("form[name='myFrm']").submit( () => {  /*  form 태그의 이름 myFrm 인곳 */
				
				const first_val = $("input:text[name='first']").val().trim();
				const second_val = $("input:text[name='second']").val().trim();
				
				if( first_val == "" || second_val == "" ) {
					alert("문자를 입력하세요!!!");
					return false;  // submit 을 하지 않는다.
				}
				
			}); //end of if( first_val == "" || second_val == "" ) {
			
			
		}); // end of $(document).ready(function() {
	
	
	</script>

</head>
<body>

	<form name="myFrm" action="02_if_result_02.jsp">
       첫번째 입력란 : <input type="text" name="first" />
       두번째 입력란 : <input type="text" name="second" />
       세번째 입력란 : <input type="text" name="third" /> 
       
       <br>
       
       <input type="submit" value="확인" />
       <input type="reset" value="취소" /> 
    </form>	

</body>
</html>