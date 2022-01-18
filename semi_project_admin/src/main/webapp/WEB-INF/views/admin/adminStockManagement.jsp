<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@include file="/header.jsp"%>
<script type="text/javascript">
function stockInsert() {
	var param = {};
	$.ajax({
        type: 'POST',
        url: 'popup/stockInsert.do',
        data: param,
        success: function(data) {
             if(data != null) {
            	 $("#pop_layer_0").html(data);
                 $("#stockInsert").modal();
             }
        }
	});
}

function stockDetail(stockNum) {
	var param = {
		stockNum : stockNum
	};
	$.ajax({
        type: 'POST',
        url: 'popup/stockDetail.do',
        data: param,
        success: function(data) {
             if(data != null) {
            	 $("#pop_layer_0").html(data);
                 $("#stockInfo").modal();
             }
        }
	});
}

function stockDelete(stockNum,countingStockNum) {
	$("#stockNumDel").val(stockNum);
	$("#countingStockNumDel").val(countingStockNum);
	
	if(countingStockNum > 0){
		alert("옵션이 등록되어있는 상품은 삭제할 수 없습니다.");	
	} else {
		if(confirm("정말 상품을 삭제하시겠습니까?")){
			alert("상품삭제가 완료되었습니다.");
			$("#deleteForm").submit();	
		}
	}
}

</script>
</head>
<body>
	<form action="deleteStock.do" method="POST" id="deleteForm">
		<input type="hidden" id="stockNumDel" name="stockNum" value="">
		<input type="hidden" id="countingStockNumDel" name="countingStockNum" value="">
	</form>
	<div id="pop_layer_0"></div>
	<!-- WRAPPER -->
	<div id="wrapper">
		<%@include file="/navbar.jsp"%>
		<!-- MAIN -->
		<div class="main">
			<div class="main-content">
				<div class="container-fluid">
					<!-- 재고목록 -->
					<div class="panel panel-headline">
						<div class="panel-heading">
							<div class="row">
								<div class="col-md-12">
									<h3 class="panel-title">재고 목록</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse">
											<i class="lnr lnr-chevron-down"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div style="padding-bottom: 10px; margin-bottom: 10px;">
								<button class="btn btn-default" onclick="stockInsert()">상품등록</button>
							</div>
							<table class="table">
								<thead>
									<tr>
										<th>재고번호</th>
										<th>상품코드</th>
										<th>상품명</th>
										<th>대분류명</th>
										<th>소분류명</th>
										<th>상품가격</th>
										<th>옵션 종류</th>
										<th>상품 총 수량</th>
										<th>상품 상세보기</th>
										<th>상품 삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${stockList}" var="stock">
										<tr>
											<td>${stock.stockNum }</td>
											<td>${stock.stockCode }</td>
											<td>${stock.stockName }</td>
											<td>${stock.lcategoriesName }</td>
											<td>${stock.scategoriesName }</td>
											<td>${stock.stockPrice }원</td>
											<td>${stock.countingStockNum }개</td>
											<td>${stock.totalAmount }개</td>
											<td><button type="button" class="btn btn-default unhidebtn rqstAns" onclick="stockDetail(${stock.stockNum })">조회</button></td>
											<td><button type="button" class="btn btn-default unhidebtn rqstHideBtn" style="background-color: red;" onclick="stockDelete(${stock.stockNum },${stock.countingStockNum })">삭제</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- END 재고목록 -->
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
</html>
