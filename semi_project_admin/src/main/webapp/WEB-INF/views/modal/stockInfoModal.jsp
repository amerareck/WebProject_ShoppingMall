<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<script type="text/javascript">
function stockUpdateForm(stockNum) {
	
	$("#stockInfo").modal("hide");
	$(".modal-backdrop").remove();
	
	var param = {
		stockNum: stockNum
    };
     
	$.ajax({
        type: 'POST',
        url: 'popup/stockUpdateForm.do',
        data: param,
        success: function(data) {
             if(data != null) {
            	 $("#pop_layer_0").html(data);
                 $("#stockUpdate").modal();
             }
        }
	});
}

function stockOptionUpdate(optionNum) {
	
	$("#stockInfo").modal("hide");
	$(".modal-backdrop").remove();
	
	var param = {
		optionNum: optionNum
    };
	
	$.ajax({
        type: 'POST',
        url: 'popup/stockOptionUpdateForm.do',
        data: param,
        success: function(data) {
             if(data != null) {
            	 $("#pop_layer_0").html(data);
                 $("#stockOptionUpdate").modal();
             }
        }
	});
}
</script>
<div id="stockInfo" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="false">&times;</button>
				<h4 class="modal-title">상품 상세보기</h4>
			</div>
			<div class="modal-body">
				<form id="" action="" method="post">
					<div class="row">
						<!-- 상품 기본정보 -->
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<div class="col-md-3">상품코드</div>
								<div class="col-md-9">
									<span>${stock.stockCode }</span> 
								</div>
							</div>
							<div class="form-group col-md-1"></div>
						</div>
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<div class="col-md-3">상품명</div>
								<div class="col-md-9">
									<span>${stock.stockName }</span> 
								</div>
							</div>
							<div class="form-group col-md-1"></div>
						</div>
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<div class="col-md-3">상품가격</div>
								<div class="col-md-9">
									<span>${stock.stockPrice }</span> 
								</div>
							</div>
							<div class="form-group col-md-1"></div>
						</div>
						<!-- END 상품 기본정보 -->
						
						<!-- 상품 분류 -->
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<div class="col-md-3">상품 대분류</div>
								<div class="col-md-9">
									<span>${stock.lcategoriesName }</span> 
								</div>
							</div>
							<div class="form-group col-md-1"></div>
						</div>
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<div class="col-md-3">상품 소분류</div>
								<div class="col-md-9">
									<span>${stock.scategoriesName }</span> 
								</div>
							</div>
							<div class="form-group col-md-1"></div>
						</div>
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<div class="col-md-3">메인 사진</div>
								<div class="col-md-9">
									<span><a href="stockMainFileDownload.do?stockPhoto=${stock.stockPhoto }">${stock.stockPhoto}</a> </span> 
								</div>
							</div>
							<div class="form-group col-md-1"></div>
						</div>
						<!-- END 상품 분류 -->
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<div class="col-md-3">상세설명</div>
								<div class="col-md-9">
									<textarea class="form-control" id="stockInfo" name="stockInfo" style="height: 200px;">${stock.stockInfo}</textarea>
								</div>
							</div>
							<div class="form-group col-md-1"></div>
						</div>
						<hr>
						<c:forEach items="${options}" var="option" varStatus="status">
							<div class="form-group col-md-12" style="margin-bottom: 0px;">
								<div class="form-group col-md-1"></div>
								<div class="form-group col-md-10">
									<div class="col-md-3">옵션<c:out value="${status.count }"/>(색상/사이즈/수량)</div>
									<div class="col-md-9">
										<button type="button" class="btn btn-default unhidebtn" onclick="stockOptionUpdate(${option.optionNum })">수정</button>
										<span>${option.optionColor}/${option.optionSize}/${option.optionAmount} </span>
										
									</div>
								</div>
								<div class="form-group col-md-1"></div>
							</div>
						</c:forEach>
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group">
								<div class="col-md-12">
									<div class="col-md-6">
										<button type="button" id="modifyBtn" class="btn btn-primary btn-block" onclick="stockUpdateForm(${stock.stockNum})">수정</button>
									</div>
									<div class="col-md-6">
										<button type="button" class="btn btn-primary btn-block" data-dismiss="modal">취소</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>