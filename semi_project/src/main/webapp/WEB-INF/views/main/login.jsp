<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<a href="#"><i class="fa fa-home"></i> Home</a>
					<span>Login</span>
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
				<div class="login-form">
					<h2>Login</h2>
					<form action="login.me" method="post">
						<div class="wfont group-input">
							<label for="username">아이디</label> <input type="text" name="memberId"/>
						</div>
						<div class="pfont group-input">
							<label for="pass">비밀번호</label> <input type="password" name="memberPass"/>
						</div>
						<div class="group-input gi-check">
							<div class="gi-more">
								<label for="save-pass">비밀번호 저장<input type="checkbox" name="save-pass"> <span class="checkmark"></span>
								</label>
							</div>
						</div>
						<button type="submit" class="site-btn login-btn">Login</button>
					</form>
					<div class="wfont switch-login">
						<a href="register.me" class="or-login" style="font-size: 20px">회원가입</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Register Form Section End -->
<%@include file ="/footer.jsp" %>