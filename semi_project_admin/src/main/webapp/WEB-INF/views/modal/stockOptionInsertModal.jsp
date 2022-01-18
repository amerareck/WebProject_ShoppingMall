<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<script type="text/javascript">
function stockOptionInsertProc() {
	
	if($("#optionColor").val()=="") {
		alert("상품색상을 입력하세요.");
		return;
	} else if($("#optionSize").val()=="") {
		alert("상품사이즈를 입력하세요.");
		return;
	} else if($("#optionAmount").val()=="") {
		alert("상품 수량을 입력하세요.");
		return;
	} 
	
	$("#stockOptionInsert").modal("hide");
	$(".modal-backdrop").remove();
	
	$.ajax({
        type: 'POST',
        url: 'stockOptionInsertProc.do',
        data: $("#stockOptionInsertForm").serialize(),
        success: function(data) {
        	if(data != null) {
	        	alert("상품옵션이 정상적으로 등록되었습니다.");
	        	
	        	if(confirm("다른옵션을 추가로 등록하시겠습니까?")){
	        		 $("#pop_layer_0").html(data);
	                 $("#stockOptionInsert").modal();
	        	} else {
	        		location.reload();
	        	}
        	}
        }
	});
}
</script>
<!-- 회원정보 수정 모달 -->
<div id="stockOptionInsert" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modalAdd" aria-hidden="true">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="false">&times;</button>
				<h4 class="modal-title">상품 등록</h4>
			</div>
			<div class="modal-body">
				<form id="stockOptionInsertForm" action="" method="post">
					<input type="hidden" id="stockNum" name="stockNum" value="${stockNum }"/>
					<div class="row">
						<!-- 상품 기본정보 -->
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<div class="col-md-3">상품 색상 추가</div>
								<div class="col-md-9">
									<input type="text" class="form-control" id="optionColor" name="optionColor">
								</div>
							</div>
							<div class="form-group col-md-1"></div>
						</div>
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<div class="col-md-3">상품 사이즈</div>
								<div class="col-md-9">
									<input type="text" class="form-control" id="optionSize" name="optionSize">
								</div>
							</div>
							<div class="form-group col-md-1"></div>
						</div>
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<div class="col-md-3">상품 개수</div>
								<div class="col-md-9">
									<input type="text" class="form-control" id="optionAmount" name="optionAmount" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
								</div>
							</div>
							<div class="form-group col-md-1"></div>
						</div>
						<!-- END 상품 기본정보 -->
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group">
								<div class="col-md-12">
									<div class="col-md-6">
										<button type="button" id="modifyBtn" class="btn btn-primary btn-block" onclick="stockOptionInsertProc()">등록</button>
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