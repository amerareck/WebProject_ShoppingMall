<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@include file="/header.jsp"%>
<script type="text/javascript">
	function goQnaDetailModal(inquireNum) {
		var param = {
				inquireNum: inquireNum,
		};
		$.ajax({
	        type: 'POST',
	        url: 'popup/qnaDetail.do',
	        data: param,
	        success: function(data) {
	             if(data != null) {
	            	 $("#pop_layer_0").html(data);
	                 $("#qnaDetail").modal();
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
			<div class="main-content">
				<div class="container-fluid">
					<!-- 공지목록 -->
					<div class="panel panel-headline">
						<div class="panel-heading">
							<div class="row">
								<div class="col-md-12">
									<h3 class="panel-title">1:1 문의관리 목록</h3>
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
						        <div class="col-md-8">
								    <form action="qna.do" method="post">
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
										<th>번호</th>
										<th>상품명</th>
										<th>문의자</th>
										<th>문의제목</th>
										<th>문의일</th>
										<th>답변여부</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${qnaList}" var="qna">
										<tr>
											<td><a href="javascript:goQnaDetailModal(${qna.inquireNum })">${qna.inquireNum }</a></td>
											<td><a href="javascript:goQnaDetailModal(${qna.inquireNum })">${qna.stockName }</a></td>
											<td><a href="javascript:goQnaDetailModal(${qna.inquireNum })">${qna.memberId }</a></td>
											<td><a href="javascript:goQnaDetailModal(${qna.inquireNum })">${qna.inquireTitle }</a></td>
											<td><a href="javascript:goQnaDetailModal(${qna.inquireNum })">${qna.inquireDate }</a></td>
											<td><a href="javascript:goQnaDetailModal(${qna.inquireNum })"><c:if test="${qna.replyStatus =='Y' }">답변완료</c:if><c:if test="${qna.replyStatus =='N' }">답변대기</c:if></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- END 공지목록 -->
				</div>
			</div>
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
</html>>