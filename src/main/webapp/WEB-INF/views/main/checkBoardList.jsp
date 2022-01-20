<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/header.jsp"%>
<!-- Breadcrumb Section Begin -->
<center>
		
		<h3> 나의 게시글 확인하기.</h3>
		<%-- <h3> ${id.name}님! 게시판에 오신걸 환영합니다...<a href="#">Log-out</a> --%>
		<!-- 검색 시작 -->
		<form action="#" method="post">
			<table border="1" cellpadding="0" cellspacing="0" width="700">
				<tr>
					<td align="right">
					<select name="searchCondition">
						<%-- <c:forEach items="${conditionMap }" var="option">
							<option value="${option.value }">${option.key }
							searchCondition에 등록된 conditionMap을 꺼내와서 foreach 돌림.
							conditionMap의 value를 옵션value로 담고, key는 출력한다.
						</c:forEach> --%>							
					</select> 
					<input name="searchKeyword" type="text" /> 
					<input type="submit" value="검색" /></td>
				</tr>
			</table>
		</form>
		<!-- 검색 종료 -->
		<table border="1" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<th bgcolor="orange" width="100">번호</th>
				<th bgcolor="orange" width="200">제목</th>
				<th bgcolor="orange" width="150">작성자</th>
				<th bgcolor="orange" width="150">등록일</th>
				<th bgcolor="orange" width="100">조회수</th>
			</tr>
			<%-- <c:forEach items="${boardList}" var="board">
				<tr>
					<td>${board.seq }</td>
					<td align="left">
						<a href="getBoard.do?seq=${board.seq }">
							${board.title }
						</a>
					</td>
					<td>${board.writer }</td>
					<td>${board.regdate }</td>
					<td>${board.cnt }</td>
				</tr>
			</c:forEach> --%>
		</table>
		<br> <a href="#">새글 등록</a>
	</center>
<!-- Register Form Section End -->
<%@include file ="/footer.jsp" %>