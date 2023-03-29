<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 표준액션 중 foward 에 대해서 알아봅니다.</title>

<script type="text/javascript">

	//function Declaration
	function goSubmit(){
		
		// 정규표현식으로 유효성 검사 
		const regExp = /^[0-9]{1,5}$/;      // 숫자만 한자리에서 5자리까지 가능하다.
		
		const frm = document.myFrm;
		const num1 = frm.firstNum.value.trim();		// 첫번째 수의 값을 가져오고 공백 제거
		const num2 = frm.secondNum.value.trim();	// 두번째 수의 값을 가져오고 공백 제거
		
		// 숫자가 아니라면 
		if( !(regExp.test(num1) && regExp.test(num2))) {
			alert("숫자로만 입력하세요!!");
			frm.firstNum.value = "";    // 값을 초기화 한다.
			frm.secondNum.value = "";
			frm.firstNum.focus();    // 포커스를 첫번째 입력칸에 줌
			return;  				 // 종료
		}
		else {		// 숫자라면 
			if( Number(num1) > Number(num2) ) {     //num1 < num2 는 웹이 기본적으로 문자열이기 때문에 비교가 안됨 
				alert("첫번째 입력한 숫자가 두번째 입력한 숫자 보다 적어야 합니다.!!");
				frm.firstNum.value = "";    // 값을 초기화 한다.
				frm.secondNum.value = "";
				frm.firstNum.focus();    // 포커스를 첫번째 입력칸에 줌
				return;  				 // 종료
			}
		}
		
		frm.action = "02_forward_calc_02.jsp";  // action 을 주기위해
<%--	frm.method = "get";         //method 를 명기하지 않으면 기본은 "get" 이다.
		frm.method = "post"; 
--%>		
		frm.submit();
		
	}// end of function goSubmit()~~~~~~~~~~~

</script>


</head>
<body>

	<h2>입력한 두개의 수 사이를 누적한 값 알아오기</h2>

	<form name="myFrm">
		<p>
			첫번째 수 : <input type="text" name="firstNum" size="5" maxlength="5" /><br/>
			두번째 수 : <input type="text" name="secondNum" size="5" maxlength="5" /><br/>
			<button type="button" onclick="goSubmit()">계산하기</button>
		</p>
	</form>

</body>
</html>