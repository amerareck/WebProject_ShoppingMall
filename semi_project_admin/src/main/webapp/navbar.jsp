<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- NAVBAR -->
<div class="navbar navbar-default" style="background-color: rgb(0, 135, 163);">
	<div class="container" style="width: 100%; height: 24px; background-color: rgb(0, 135, 163);">
		<div class="navbar-header">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a class="navbar-brand mainbar" href="dashboard.do"> 
						<span><img src="assets/img/logo.png" style="width: 20px; height: 20px;">&nbsp;&nbsp;OreoT</span>
					</a>
				</li>
			</ul>
		</div>
		<div>
			<ul class="nav navbar-nav navbar-right">
				<li>
					<a class="mainbar">admin 접속 중</a>
				</li>
				<li class="dropdown">
					<a href="#" class="glyphicon glyphicon-fire" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 20px;"></a>
					<ul class="dropdown-menu" role="menu">
						<li>
							<a href="adminlogout.do">로그아웃</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</div>
<!-- LEFT SIDEBAR -->
<div id="sidebar-nav" class="sidebar">
	<div class="sidebar-scroll">
		<nav>
			<ul class="nav">
				<li><a href="dashboard.do" class=""><i class="lnr lnr-home"></i> <span>대시보드</span></a></li>
				<li><a href="memberlist.do" class=""><i class="lnr lnr-user"></i> <span>회원관리</span></a></li>
				<li><a href="payment.do" class=""><i class="lnr lnr-code"></i> <span>결제관리</span></a></li>
				<li><a href="stockmanagement.do" class=""><i class="lnr lnr-home"></i> <span>재고관리</span></a></li>
				<li><a href="qna.do" class=""><i class="lnr lnr-file-empty"></i> <span>1:1문의관리</span></a></li>
				<li><a href="notice.do" class=""><i class="lnr lnr-alarm"></i> <span>공지관리</span></a></li>
			</ul>
		</nav>
	</div>
</div>