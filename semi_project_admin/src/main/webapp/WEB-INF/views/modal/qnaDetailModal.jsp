<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<script type="text/javascript">
function goQnaReplyForm(inquireNum) {
	var param = {
			inquireNum: inquireNum,
	};
	
	$("#qnaDetail").modal("hide");
	$(".modal-backdrop").remove();
     
	$.ajax({
        type: 'POST',
        url: 'popup/qnaReplyForm.do',
        data: param,
        success: function(data) {
             if(data != null) {
            	 $("#pop_layer_0").html(data);
                 $("#qnaReply").modal();
             }
        }
	});
}

function goQnaReplyModifyForm(inquireNum) {
	var param = {
			inquireNum: inquireNum,
	};
	
	$("#qnaDetail").modal("hide");
	$(".modal-backdrop").remove();
     
	$.ajax({
        type: 'POST',
        url: 'popup/qnaReplyModifyForm.do',
        data: param,
        success: function(data) {
             if(data != null) {
            	 $("#pop_layer_0").html(data);
                 $("#qnaReplyModify").modal();
             }
        }
	});
}
</script>
<div id="qnaDetail" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="false">&times;</button>
				<h4 class="modal-title">문의내용 상세보기</h4>
			</div>
			<div class="modal-body">
				<form id="modalForm" action="" method="post">
					
					<div class="form-group">
						<span>상품명</span> 
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="stockName" name="stockName" value="${qna.stockName}" readonly="readonly" >
					</div>
					
					<div class="form-group">
						<span>문의자</span> 
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="memberId" name="memberId" value="${qna.memberId}" readonly="readonly" >
					</div>
					
					<div class="form-group">
						<span>작성일/수정일</span> 
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="inquireDate" name="inquireDate" value="${qna.inquireDate}/${qna.inquireModifyDate}" readonly="readonly" >
					</div>
					
					<div class="form-group">
						<span>제목</span> 
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="inquireTitle" name="inquireTitle" value="${qna.inquireTitle}" readonly="readonly" >
					</div>
					
					<div class="form-group">
						<span>내용</span> 
					</div>
					<div class="form-group">
						<textarea class="form-control" id="inquireContent" name="inquireContent" readonly="readonly" style="height: 200px;">${qna.inquireContent}</textarea>
					</div>
					<c:if test="${qna.replyStatus == 'N' }">
						<div class="form-group">
							<button type="button" id="modifyBtn" class="btn btn-primary btn-block" onclick="goQnaReplyForm(${qna.inquireNum})">답변하기</button>
						</div>
					</c:if>
					<c:if test="${qna.replyStatus == 'Y' }">
						<div class="form-group">
							<span>답변일/수정일</span> 
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="replyDate" name="replyDate" value="${qna.replyDate}/${qna.replyModifyDate}" readonly="readonly" >
						</div>
						<div class="form-group">
							<span>답변내용</span> 
						</div>
						<div class="form-group">
							<textarea class="form-control" id="replyContent" name="replyContent" readonly="readonly" style="height: 200px;">${qna.replyContent}</textarea>
						</div>
						<div class="form-group">
							<button type="button" id="modifyBtn" class="btn btn-primary btn-block" onclick="goQnaReplyModifyForm(${qna.inquireNum})">답변 수정 하기</button>
						</div>
					</c:if>
				</form>
			</div>
		</div>
	</div>
</div>