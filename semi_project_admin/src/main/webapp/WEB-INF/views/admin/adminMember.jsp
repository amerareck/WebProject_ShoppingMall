<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@include file="/header.jsp"%>
<script type="text/javascript">
	function memberInfoUpdateModal(memberNum) {
		var param = {
			memberNum: memberNum,
		};
		$.ajax({
	        type: 'POST',
	        url: 'popup/memberInfoUpdate.do',
	        data: param,
	        success: function(data) {
	             if(data != null) {
	            	 $("#pop_layer_0").html(data);
	                 $("#memberInfoUpdate").modal();
	             }
	        }
		});
	}
</script>
</head>
<body>
	<div id="pop_layer_0"></div>
	<!-- WRAPPER -->
	<div id="wrapper">
		<%@include file="/navbar.jsp"%>
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<!-- ADMIN LIST TABLE -->
					<div class="panel panel-headline">
						<div class="panel-heading">
							<div class="row">
								<div class="col-md-12">
									<h3 class="panel-title">회원 목록</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse">
											<i class="lnr lnr-chevron-down"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-6">
									<form action="memberlist.do" method="post">
										<div class="input-group">
											<span style="font-size:15px;" class="input-group-btn">
												<select id="searchCondition" name="searchCondition" style="width: 100px; height: 32px;">
													<c:forEach items="${conditionMap}" var="option">
														<option value="${option.value}" <c:if test="${option.value eq searchCondition }">selected</c:if>>${option.key}</option>
													</c:forEach>
												</select>
											</span>
											<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="Search..." value="${searchKeyword }">
											<span class="input-group-btn">
												<button id="search" class="btn btn-default" type="submit">
													<span class="glyphicon glyphicon-search"></span>
												</button>
											</span>
										</div>
									</form>
								</div>
							</div>
							<table class="table">
								<thead>
									<tr>
										<th>회원코드</th>
										<th>아이디</th>
										<th>이름</th>
										<th>휴대폰번호</th>
										<th>이메일</th>
										<th>주소</th>
										<th>가입일</th>
										<th>상태변경</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${memberList}" var="member">
									<tr>
										<td>${member.memberNum }</td>
										<td>${member.memberId }</td>
										<td>${member.memberName }</td>
										<td>${member.memberTel }</td>
										<td>${member.memberEmail }</td>
										<td>${member.memberAddress }</td>
										<td>${member.memberDate }</td>
										<td>
											<button id="updateMemInfo" type="button" class="btn btn-default updatebtn" onclick="memberInfoUpdateModal(${member.memberNum })">수정</button>
											<button type="button" class="btn btn-default deletebtn" style="background-color: #ff4d4d;" value="${member.memberNum }">삭제</button>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- END ADMIN LIST TABLE -->
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="assets/scripts/klorofil-common.js"></script>
</body>
</html>