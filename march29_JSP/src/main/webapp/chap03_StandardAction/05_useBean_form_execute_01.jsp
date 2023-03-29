<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	// 암기 하기
	// 컨텍스트 패스명(context path name)을 알아오고자 한다.
	String ctxPath = request.getContextPath();
	// 결과 :  ctxPath => /JSPServletBegin   <== WAS (톰켓서버) Document Base Path 설정의 기본값임.

%>    

    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GET 방식으로 데이터 전송하기</title>

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
		
		// === 유효성 검사 === //
		$("form[name='registerFrm'] > fieldset > ul > li:last-child > button:first-child").click( function(){
			
			// 1. 성명은 필수 입력 검사
			if($("input:text[name='name']").val().trim() == "" ) {     // :text 는 타입, [name] 은 이름 
				alert("성명은 필수항목 이오니 성명을 입력하세요!!");
				return;   // 종료
			}
			
			// 2. 학력도 필수 입력 검사
			if($("select[name='school']").val() == "선택하세요" ) {    
				alert("학력은 필수항목 이오니 입력하세요!!");
				return;   // 종료
			}
			
			// 3. 색상도 필수 입력 검사
			const color_checked_length = $("input:radio[name='color']:checked").length;    
			if(color_checked_length == 0) {
				alert("색상을 선택하세요!!");
				return;   // 종료
			}
			
			// 4. 음식도 필수 입력 검사
			const food_checked_length = $("input:checkbox[name='food']:checked").length;     
			if(food_checked_length == 0) {	
				alert("선호하는 음식을 최소한 1개 이상 선택하세요");
				return;   // 종료
			}
			
			// 5. submit 을 해준다.
			
			const frm = document.registerFrm;    /*  frm 이 form 태그의 부분을 나타내고 있다.  즉 이 문서에서 이름이 registerfrm 인것을 나타낸다. */
			/* 상대 경로 이용 */
			frm.action = "05_useBean_form_02.jsp"   
			
		<%-- 
		    frm.method = "get"; //생략하면 GET방식이다.
            frm.method = "post";
         --%>
			
			frm.submit();
			
		});// end of $("form[name='registerFrm'] > fieldset > ul > li:last-child > button:first-child").click( function(){
		
		
	}); // end of $(document).ready(function(){


</script>



</head>
<body>
	
	<form name="registerFrm">  
	
		<fieldset>
	      <legend>개인성향 테스트(GET method)</legend>
	      <ul>
		         <li>
		            <label for="name">성명</label>
		            <input type="text" name="name" id="name" placeholder="성명입력"/> 
		         </li>
		         <li>
		            <label for="school">학력</label>
		            <select name="school" id="school"> 
		               <option >선택하세요</option>  
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
		            <button type="button">전송</button>
		            <button type="reset">취소</button>
		         </li>
		      </ul>
	   </fieldset>
	
	
	</form>
	
</body>
</html>