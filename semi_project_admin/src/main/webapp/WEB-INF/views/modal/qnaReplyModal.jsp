<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<script type="text/javascript">
function qnaReplyProc() {
	
	if($("#replyContent").val()=="") {
		alert("답변 내용을 입력하세요.");
		return;
	}
	
	if(confirm("답변 작성을 완료하시겠습니까?")){
		$("#qnaReplyForm").submit();
		alert("작성을 완료하였습니다.");
	}
}
</script>
<div id="qnaReply" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="false">&times;</button>
				<h4 class="modal-title">문의내용 답변하기</h4>
			</div>
			<div class="modal-body">
				<form id="qnaReplyForm" action="qnaReplyProc.do" method="post">
					<input type="hidden" id="inquireNum" name="inquireNum" value="${qna.inquireNum}">
					<div class="form-group">
						<span>문의 제목</span> 
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="inquireTitle" name="inquireTitle" value="${qna.inquireTitle}" readonly="readonly" >
					</div>
					<div class="form-group">
						<span>문의 내용</span> 
					</div>
					<div class="form-group">
						<textarea class="form-control" id="inquireContent" name="inquireContent" style="height: 200px;" readonly>${qna.inquireContent}</textarea>
					</div>
					<div class="form-group">
						<span>답변 내용</span> 
					</div>
					<div class="form-group">
						<textarea class="form-control" id="replyContent" name="replyContent" style="height: 200px;"></textarea>
					</div>
					<div class="form-group">
						<button type="button" id="modifyBtn" class="btn btn-primary btn-block" onclick="qnaReplyProc()">완료</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>