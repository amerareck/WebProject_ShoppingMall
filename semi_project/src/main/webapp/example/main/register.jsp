<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/header.jsp"%>
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<a href="#"><i class="fa fa-home"></i> Home</a> <span>Register</span>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Breadcrumb Form Section Begin -->

<!-- Register Section Begin -->
<div class="register-login-section spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 offset-lg-3">
				<div class="register-form">
					<h2>Register</h2>
					<form action="#">
						<div class="group-input">
							<label for="memberId">아이디 *</label> <input type="text"
								id="memberId" name="memberId">
						</div>
						<div class="group-input">
							<label for="pass">비밀번호 *</label> <input type="text"
								id="memberPass" name="memberPass">
						</div>
						<div class="group-input">
							<label for="con-pass">비밀번호확인 *</label> <input type="text"
								id="con_memberPass">
						</div>
						<div class="group-input">
							<label for="memberName">이름 *</label> <input type="text"
								id="memberName" name="memberName">
						</div>
						<div class="group-input">
							<label for="username">이메일 *</label> <input type="text"
								id="memberEmail" name="memberEmail">
						</div>
						<div class="group-input">
							<label for="username">휴대폰번호 *</label> <input type="text"
								id="memberTel" name="memberTel">
						</div>
						<div class="group-input">
							<label for="memberBirth">생년월일 *</label> <select id="year">
								<option>1900</option>
							</select> <select id="month">
								<option>08</option>
							</select> <select id="day">
								<option>01</option>
							</select>
						</div>
						<label> <input type="checkbox" name="memberAgree"
							value="Y"> 14세 이상입니다. (필수)
						</label>
						<div>
							<p>* 회원가입에 필요한 최소한의 정보만 입력 받음으로써 고객님의 개인정보 수집을 최소화하고 편리한
								회원가입을 제공합니다.</p>
						</div>
						<button type="button" class="site-btn register-btn">회원가입</button>
					</form>
					<div class="switch-login">
						<a href="login.me" class="or-login">Login</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Register Form Section End -->
<%@include file ="/footer.jsp" %>