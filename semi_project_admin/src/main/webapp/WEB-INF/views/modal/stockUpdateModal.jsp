<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<script type="text/javascript">
function lcChange(obj) {

    let param = {
        lcategoriesNum: $(obj).val()
    };

    $.ajax({
        type: 'POST',
        url: 'lcategoriesChange.do',
        data: param,
        success: function(result) {
            var data = JSON.parse(result);

            let html = '';
            html += '<option value="">소분류를 선택해주세요</option>'
            if(data != null && data.length > 0) {
                for(let i=0;i<data.length;i++) {
                    html += '<option value="' + data[i].scategoriesNum + '">' + data[i].scategoriesName + '</option>';
                }
            }

            $('#scategoriesNum').html(html);
        }
	});
}

function stockUpdateProc() {
	
	if($("#stockName").val()=="") {
		alert("상품명을 입력하세요.");
		return;
	} else if($("#stockPrice").val()=="") {
		alert("상품가격을 입력하세요.");
		return;
	} else if($("#scategoriesNum").val()=="") {
		alert("상품소분류를 선택하세요.");
		return;window.location.replace
	} else if($("#stockInfo").val()=="") {
		alert("상세설명을 입력하세요.");
		return;
	}
	
	$("#stockInsert").modal("hide");
	$(".modal-backdrop").remove();
	
	if(confirm("수정하시겠습니까?")){
		
		$("#stockUpdate").modal("hide");
		$(".modal-backdrop").remove();
		
		var form = $('#stockUpdateForm')[0];
		var formData = new FormData(form);
		
		$.ajax({
	        type: 'POST',
	        url: 'stockUpdateProc.do',
	        data: formData,
	        enctype:'multipart/form-data',
	        processData:false,
	        contentType:false,
	        cache:false,
	        success: function(data) {
	        	alert("수정이 완료되었습니다.")
	        	location.reload();
	        }
		});
	}
}
</script>
<!-- 회원정보 수정 모달 -->
<div id="stockUpdate" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modalAdd" aria-hidden="true">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="false">&times;</button>
				<h4 class="modal-title">상품 정보 수정</h4>
			</div>
			<div class="modal-body">
				<form id="stockUpdateForm" action="stockUpdateProc.do" method="post">
					<input type="hidden" id="stockNum" name="stockNum" value="${stock.stockNum }">
					<div class="row">
						<!-- 상품 기본정보 -->
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<div class="col-md-3">상품코드</div>
								<div class="col-md-9">
									<input type="text" class="form-control" id="stockCode" name="stockCode" value="${stock.stockCode }" readonly>
									<span id="errMsg" style="display: none;"></span>
								</div>
							</div>
							<div class="form-group col-md-1"></div>
						</div>
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<div class="col-md-3">상품명</div>
								<div class="col-md-9">
									<input type="text" class="form-control" id="stockName" name="stockName" value="${stock.stockName }">
								</div>
							</div>
							<div class="form-group col-md-1"></div>
						</div>
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<div class="col-md-3">상품가격</div>
								<div class="col-md-9">
									<input type="text" class="form-control" id="stockPrice" name="stockPrice" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="${stock.stockPrice }">
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
									<select name="lcategoriesNum" onchange="lcChange(this);" >
									    <c:forEach items="${lcategories}" var="lcategorie">
									    	<option value="${lcategorie.lcategoriesNum }" <c:if test="${lcategorie.lcategoriesNum == stock.lcategoriesNum }">selected</c:if>> ${lcategorie.lcategoriesName }</option>
									    </c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group col-md-1"></div>
						</div>
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<div class="col-md-3">상품 소분류</div>
								<div class="col-md-9">
									<select name="scategoriesNum" id="scategoriesNum" >
										<c:forEach items="${scategories}" var="scategorie">
									    	<option value="${scategorie.scategoriesNum }" <c:if test="${scategorie.scategoriesNum == stock.scategoriesNum }">selected</c:if>> ${scategorie.scategoriesName }</option>
									    </c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group col-md-1"></div>
						</div>
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<div class="col-md-3">현재 사진</div>
								<div class="col-md-9">
									<span>${stock.stockPhoto} </span> 
								</div>
							</div>
							<div class="form-group col-md-1"></div>
						</div>
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<div class="col-md-3">메인 사진</div>
								<div class="col-md-9">
									<input name="uploadFile" type="file">
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
						</div>
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group">
								<div class="col-md-12">
									<div class="col-md-6">
										<button type="button" id="modifyBtn" class="btn btn-primary btn-block" onclick="stockUpdateProc()">완료</button>
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