<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <jsp:include page="header.jsp" />

	<!-- 상단 컨텐츠 시작 -->
	<div class="row custom-topcontents">
		<div class="col-md-3">
			<h2>Board</h2>
			<p>회원 또는 비회원 게시물을 확인할 수 있고 질문과 답변 코너를 이용한 다양한 질문에 대한 관리자의 상세
			      답변을 확인할 수 있습니다.
			</p>
		</div>
		<div class="col-md-9">
			<img src="./images/Penguins.jpg" class="img-fluid" alt="반응형 게시판 이미지">
		</div>
	</div>
	<!-- row 끝 -->
	<!-- 상단 컨텐츠 끝 -->
		
	<!-- 중앙 컨텐츠 시작 -->
	<div class="row custom-topcontents">
		<div class="col-md-3">
			<ul class="nav flex-column">
			  <li class="nav-item">
			    <a class="nav-link" href="#">회원전용</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="#">비회원전용</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="#">질문과 답변</a>
			  </li>
			</ul>
		</div>
		<div class="col-md-9">
			<div class="table-responsive">
			    <!-- .table-responsive 반응형 테이블(테이블의 원래 크기를 보존해주기 위한 것으로써, 디바이스의 width가 작아지면 테이블 하단에 스크롤이 생김) --> 
				<table class="table table-striped">
					<tr>
						<th>#</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Username</th>
					</tr>
					<tr>
						<td>1</td>
						<td>Mark</td>
						<td>Otto</td>
						<td>@mdo</td>
					</tr>
					<tr>
						<td>2</td>
						<td>Park</td>
						<td>Soon</td>
						<td>@sns</td>
					</tr>
					<tr>
						<td>3</td>
						<td>Park</td>
						<td>Soon</td>
						<td>@sns</td>
					</tr>
					<tr>
						<td>4</td>
						<td>Park</td>
						<td>Soon</td>
						<td>@sns</td>
					</tr>
					<tr>
						<td>5</td>
						<td>Park</td>
						<td>Soon</td>
						<td>@sns</td>
					</tr>
					<tr>
						<td>6</td>
						<td>Park</td>
						<td>Soon</td>
						<td>@sns</td>
					</tr>
					<tr>
						<td>7</td>
						<td>Park</td>
						<td>Soon</td>
						<td>@sns</td>
					</tr>
					<tr>
						<td>8</td>
						<td>Park</td>
						<td>Soon</td>
						<td>@sns</td>
					</tr>
					<tr>
						<td>9</td>
						<td>Park</td>
						<td>Soon</td>
						<td>@sns</td>
					</tr>
				</table>
			</div>
				
			<!-- 페이지네이션 -->
			<nav>
			  <ul class="pagination justify-content-center">
			    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
			    <li class="page-item"><a class="page-link" href="#">1</a></li>
			    <li class="page-item"><a class="page-link" href="#">2</a></li>
			    <li class="page-item"><a class="page-link" href="#">3</a></li>
			    <li class="page-item"><a class="page-link" href="#">Next</a></li>
			  </ul>
			</nav>
		</div>
	</div>
	<!-- row 끝 -->
	<!-- 중앙 컨텐츠 끝 -->
		
<jsp:include page="footer.jsp" />	
