<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" class="fullscreen-bg">
<head>
	<title>OreoT</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/vendor/linearicons/style.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="assets/css/main.css">
	<link rel="stylesheet" href="assets/css/admin.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){

			$(".btn-lg").click(function(){
				
				$("#errMsg").css("display", "none");
				
				if($("[name=memberId]").val()=="") {
					$("#errMsg").html("아이디를 입력해주세요.");
					$("#errMsg").css("display", "inline");
					$("#errMsg").css("margin-left", "100px");
				} else if($("[name=memberPass]").val()=="") {
					$("#errMsg").html("비밀번호를 입력해주세요.");
					$("#errMsg").css("display", "inline");
					$("#errMsg").css("margin-left", "90px");
				} else {
					var sendData = {
						memberId : $("[name=memberId]").val(),
						memberPass : $("[name=memberPass]").val()
					}
					
					$.ajax({
						type: "POST", 
						url: "checkAdminAjax.do", 
						data: sendData,
						dataType: 'json',
						success : function(data) {
							if(data.result == "fail"){
								$("#errMsg").html("아이디 또는 비밀번호가 정확하지 않습니다.");
								$("#errMsg").css("display", "inline");
								$("#errMsg").css("margin-left", "50px");	
							} else {
								$("form").submit();
							}
							
						}
					});
				} 
			});
		});
	</script>
</head>

<body>
	<div class="navbar navbar-default" style="background-color: rgb(0, 135, 163);">
		<div class="container" style="background-color: rgb(0, 135, 163);">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">
					<span><img src="assets/img/logo.png" style="width: 20px; height: 20px;">&nbsp;&nbsp;OREOT</span>
				</a>
			</div>
			<div>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a>로그인이 필요합니다.</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- WRAPPER -->
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="login-box">
					<div class="login-input">
						<div class="header">
							<div class="logo text-center">
								<span class="login-title">관리자 계정 로그인</span>
							</div>
							<div class="br"></div>
						</div>
						<!-- form -->
						<form class="form-auth-small" action="adminlogin.do" method="post">
							<div class="form-group">
								<label for="memberId" class="control-label sr-only">id</label>
								<input type="text" class="form-control" name="memberId" placeholder="아이디를 입력하세요.">
							</div>
							<div class="form-group">
								<label for="memberPass" class="control-label sr-only">password</label>
								<input type="password" class="form-control" name="memberPass"  placeholder="패스워드를 입력하세요.">
							</div>
							<button type="button" class="btn btn-primary btn-lg btn-block">LOGIN</button><br>
							<span id="errMsg" style="color: red; display: none;"></span>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END WRAPPER -->
</body>
</html>
