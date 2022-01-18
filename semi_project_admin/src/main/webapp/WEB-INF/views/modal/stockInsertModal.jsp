<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<script type="text/javascript"> 
function checkFileName(str){
 
    //1. 확장자 체크
    var ext =  str.split('.').pop().toLowerCase();
    if($.inArray(ext, ['jpg', 'png', 'jpeg', 'gif']) == -1) {
 
        alert(ext+'파일은 업로드 하실 수 없습니다.');
        return;
    }
 
    //2. 파일명에 특수문자 체크
    var pattern =   /[\{\}\/?,;:|*~`!^\+<>@\#$%&\\\=\'\"]/gi;
    if(pattern.test(str) ){
        alert("파일명에 허용된 특수문자는 '-', '_', '(', ')', '[', ']', '.' 입니다. 이 외의 특수문자는 제거해주세요.");
    }
}

function memberUpdate(memberNum) {
	if(confirm("회원정보를 수정하시겠습니까?")){
		$("#memberUpdateForm").submit();
		alert("수정이 완료되었습니다.");
	}
}

function checkStockCode(obj) {

    let param = {
        stockCode: $(obj).val()
    };
    
    $.ajax({
        type: 'POST',
        url: 'checkStockCode.do',
        data: param,
        success: function(result) {
        	var data = JSON.parse(result);
        	if(data.result == "success"){
				$("#errMsg").html("사용가능한 상품코드입니다.");
				$("#errMsg").css("display", "inline");
				$("#errMsg").css("color", "blue");
			} else {
				$("#errMsg").html("존재하는 상품코드입니다.");
				$("#errMsg").css("display", "inline");
				$("#errMsg").css("color", "red");
			}
        }
	});
}

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

function stockInsertProc() {
	
	if($("#stockCode").val()=="") {
		alert("상품코드를 입력하세요.");
		return;
	} else if($("#errMsg").html()=="존재하는 상품코드입니다.") {
		alert("올바른 상품코드를 입력하세요.");
		return;
	} else if($("#stockName").val()=="") {
		alert("상품명을 입력하세요.");
		return;
	} else if($("#stockPrice").val()=="") {
		alert("상품가격을 입력하세요.");
		return;
	} else if($("#scategoriesNum").val()=="") {
		alert("상품소분류를 선택하세요.");
		return;
	} else if($("#stockInfo").val()=="") {
		alert("상세설명을 입력하세요.");
		return;
	} else if($("#stockPhoto").val()=="") {
		alert("상품 메인사진을 등록하세요.");
		return;
	} else if($("#stockPhoto").val()!=""){
        var str =$("#stockPhoto").val();
        var fileName = str.split('\\').pop().toLowerCase();
 
        checkFileName(fileName);
	} 
	
	$("#stockInsert").modal("hide");
	$(".modal-backdrop").remove();
	
	var form = $('#stockInsertForm')[0];
	var formData = new FormData(form);
	
	$.ajax({
        type: 'POST',
        url: 'stockInsertProc.do',
        data: formData,
        enctype:'multipart/form-data',
        processData:false,
        contentType:false,
        cache:false,
        success: function(data) {
             if(data != null) {
            	 $("#pop_layer_0").html(data);
                 $("#stockOptionInsert").modal();
             }
        }
	});
}
</script>
<!-- 회원정보 수정 모달 -->
<div id="stockInsert" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modalAdd" aria-hidden="true">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="false">&times;</button>
				<h4 class="modal-title">상품 등록</h4>
			</div>
			<div class="modal-body">
				<form id="stockInsertForm" action="" method="post">
					<div class="row">
						<!-- 상품 기본정보 -->
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<div class="col-md-3">상품코드</div>
								<div class="col-md-9">
									<input type="text" class="form-control" id="stockCode" name="stockCode" onkeyup="checkStockCode(this)">
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
									<input type="text" class="form-control" id="stockName" name="stockName">
								</div>
							</div>
							<div class="form-group col-md-1"></div>
						</div>
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<div class="col-md-3">상품가격</div>
								<div class="col-md-9">
									<input type="text" class="form-control" id="stockPrice" name="stockPrice" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
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
									    <option value="">대분류를 선택해주세요</option>
									    <c:forEach items="${lcategories}" var="lcategorie">
									    	<option value="${lcategorie.lcategoriesNum }">${lcategorie.lcategoriesName }</option>
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
									    <option value="">소분류를 선택해주세요</option>
									</select>
								</div>
							</div>
							<div class="form-group col-md-1"></div>
						</div>
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<div class="col-md-3">메인 사진</div>
								<div class="col-md-9">
									<input name="uploadFile" id="stockPhoto" type="file">
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
									<textarea class="form-control" id="stockInfo" name="stockInfo" style="height: 200px;"></textarea>
								</div>
							</div>
						</div>
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group">
								<div class="col-md-12">
									<div class="col-md-6">
										<button type="button" id="modifyBtn" class="btn btn-primary btn-block" onclick="stockInsertProc()">등록</button>
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