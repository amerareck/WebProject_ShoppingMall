<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@include file="/header.jsp"%>
<script type="text/javascript">
	function goPaymentDetailModal(transactionNum) {
		var param = {
				transactionNum: transactionNum,
		};
		$.ajax({
	        type: 'POST',
	        url: 'popup/paymentDetail.do',
	        data: param,
	        success: function(data) {
	             if(data != null) {
	            	 $("#pop_layer_0").html(data);
	                 $("#paymentDetail").modal();
	             }
	        }
		});
	}
	
	function updatePaymentStatus(transactionNum) {
		
		if(confirm("거래상태를 결제완료로 변경하시겠습니까?")){
			$("#transactionNum").val(transactionNum);
			$("#updatePaymentStatusForm").submit();
			alert("변경을 완료하였습니다.");
		}
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
					<!-- 결제내역 -->
					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-headline">
								<div class="panel-heading">
									<div class="row">
										<div class="col-md-12">
											<h3 class="panel-title">결제 목록</h3>
											<p class="right" id="clock"></p>
										</div>
									</div>
								</div>
								<div class="panel-body">
									<div class="row">    
								        <div class="col-md-8">
								        	<form id="updatePaymentStatusForm" action="updatePaymentStatus.do" method="POST">
								        		<input type="hidden" id="transactionNum" name="transactionNum" value="">
								        	</form>
										    <form action="payment.do" method="post">
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
												<th>결제번호</th>
												<th>상품코드</th>
												<th>상품명</th>
												<th>색상</th>
												<th>사이즈</th>
												<th>주문일</th>
												<th>주문자</th>
												<th>거래상태</th>
												<th>상태변경</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${paymentList}" var="payment">
												<tr>
													<td><a href="javascript:goPaymentDetailModal(${payment.transactionNum })">${payment.transactionNum }</a></td>
													<td><a href="javascript:goPaymentDetailModal(${payment.transactionNum })">${payment.stockCode }</a></td>
													<td><a href="javascript:goPaymentDetailModal(${payment.transactionNum })">${payment.stockName }</a></td>
													<td><a href="javascript:goPaymentDetailModal(${payment.transactionNum })">${payment.optionColor }</a></td>
													<td><a href="javascript:goPaymentDetailModal(${payment.transactionNum })">${payment.optionSize }</a></td>
													<td><a href="javascript:goPaymentDetailModal(${payment.transactionNum })">${payment.transactionDate }</a></td>
													<td><a href="javascript:goPaymentDetailModal(${payment.transactionNum })">${payment.memberId }</a></td>
													<c:if test="${payment.transactionStatus == 'Y' }">
														<td><a href="javascript:goPaymentDetailModal(${payment.transactionNum })">결제완료</a></td>
														<td>-</td>
													</c:if>
													<c:if test="${payment.transactionStatus == 'N' }">
														<td><a href="javascript:goPaymentDetailModal(${payment.transactionNum })">결제대기중</a></td>
														<td><button type="button" class="btn btn-default updatebtn detail" onclick="updatePaymentStatus(${payment.transactionNum })">완료</button></td>
													</c:if>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
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
	<script type="text/javascript">
		// 예약취소 버튼 눌리면 수행
		$(".canceledbtn").on(
				"click",
				function() {
					$(location).attr("href",
							"admincancel.do?bcode=" + $("[name=bcode]").val());
				});

		function printTime() {
			// 출력할 장소 선택
			var clock = document.getElementById("clock");

			// 현재시간
			var now = new Date();
			var nowTime = now.getFullYear() + "년" + (now.getMonth() + 1) + "월"
					+ now.getDate() + "일" + now.getHours() + "시"
					+ now.getMinutes() + "분" + now.getSeconds() + "초";

			// 현재시간을 출력
			clock.innerHTML = nowTime;

			// setTimeout(“실행할함수”,시간) 시간은1초의 경우 1000
			setTimeout("printTime()", 1000);
		}

		window.onload = function() {
			// 페이지가 로딩되면 실행
			printTime();
		}
	</script>
</body>
</html>


