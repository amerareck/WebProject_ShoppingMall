<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/header.jsp"%>
<style type="text/css">
 @font-face {
    font-family: 'OTWelcomeRA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
  
 }
.wfont {
 	font-family: 'OTWelcomeRA', sans-serif;
 }
 
.pfont {
	font-family: 'OTWelcomeRA', sans-serif;
	font-size: 18px;
	color: black;
}

input[type=password] {
	font-family:"Muli";
}
</style>


<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<a href="/"><i class="fa fa-home"></i> Home</a>
					<a href="myPage.me">마이페이지</a>
					<span> 회원정보 수정 </span>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Register Section Begin -->
<div class="register-login-section spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 offset-lg-3">
				<div class="register-form">
					<h2 class="wfont"> 회원정보 수정 </h2>
					
					<form action="editInfo.me" method="post">
						<div class="wfont group-input">
							<label for="memberId">아이디*</label> 
							<input type="text" id="memberId" name="memberId" value="${main.memberId}" disabled>
						</div>
						<div class="wfont group-input">
							<label for="memberPass">비밀번호*</label>
							<input type="password" id="memberPass" name="memberPass">
						</div>
						<div class="wfont group-input">
							<label for="con_memberPass">비밀번호확인*</label> 
							<input type="password" id="con_memberPass" name="con_memberPass">
								<!-- 일단 스크립트는 생략하고 내부에서 간단하게 비교할게용...; -->
						</div>
						<div class="pfont group-input">
							<label for="memberName">이름*<br><br>
							<input type="text" name="memberName" value="${main.memberName}" disabled>
							</label>
						</div>
						<div class="wfont group-input">
							<label for="memberEmail">이메일*</label> <input type="text"
								id="memberEmail" name="memberEmail" value="${main.memberEmail}">
						</div>
						<div class="wfont group-input">
							<label for="memberTel">전화번호*</label> <input type="text"
								id="memberTel" name="memberTel" value="${main.memberTel}">
						</div>
						<div class="group-input">
									<fmt:parseNumber value="${main.year}" var="year"/>
									<fmt:parseNumber value="${main.month}" var="month"/>
									<fmt:parseNumber value="${main.day}" var="day"/>
							<label for="memberBirth"> <p class="pfont">생년월일*</p>
								<select name="year" class="selectpicker" style="height:30px">
									<c:forEach begin="1900" end="2020" var="i">
										<c:choose>
											<c:when test="${year == i }">
												<option selected>${year}</option>
											</c:when>
											<c:otherwise>
												<option>${i}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select> 
								<select name="month" class="selectpicker" style="height:30px">
									<c:forEach begin="1" end="12" var="i">
										<c:choose>
											<c:when test="${month == i }">
												<option selected>${month}</option>
											</c:when>
											<c:otherwise>
												<option>${i}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select> 
								<select name="day" class="selectpicker" style="height:30px">
									<c:forEach begin="1" end="31" var="i">
										<c:choose>
											<c:when test="${day == i }">
												<option selected>${day}</option>
											</c:when>
											<c:otherwise>
												<option>${i}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</label>
						<!-- 
						*** 정보 수정에서 필요없는 내역이라 판단하여, 삭제하였습니다.
						</div>
						<label> <input type="checkbox" name="memberAgree"
							value="Y" checked disabled> 14세 이상입니다. (필수)
						</label>
						<div>
							<p>* 회원가입에 필요한 최소한의 정보만 입력 받음으로써 고객님의 개인정보 수집을 최소화하고 편리한
								회원가입을 제공합니다.</p>
						-->
						</div> 
						<button type="submit" class="wfont site-btn register-btn" style="font-size: 25px;">정보 수정</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Register Form Section End -->
<%@include file="/footer.jsp"%>