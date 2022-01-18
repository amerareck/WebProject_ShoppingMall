<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<script type="text/javascript">
function goNoticeUpdateForm(noticeNum) {
	var param = {
		noticeNum: noticeNum,
	};
	
	$("#noticeDetail").modal("hide");
	$(".modal-backdrop").remove();
     
	$.ajax({
        type: 'POST',
        url: 'popup/noticeUpdateForm.do',
        data: param,
        success: function(data) {
             if(data != null) {
            	 $("#pop_layer_0").html(data);
                 $("#noticeUpdate").modal();
             }
        }
	});
}
</script>
<div id="noticeDetail" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="false">&times;</button>
				<h4 class="modal-title">공지사항 상세보기</h4>
			</div>
			<div class="modal-body">
				<form id="modalForm" action="" method="post">
					<div class="form-group">
						<span>제목</span> 
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="noticeTitle" name="noticeTitle" value="${notice.noticeTitle}" readonly="readonly" >
					</div>
					<div class="form-group">
						<span>내용</span> 
					</div>
					<div class="form-group">
						<textarea class="form-control" id="noticeContent" name="noticeContent" readonly="readonly" style="height: 200px;">${notice.noticeContent}</textarea>
					</div>
					<div class="form-group">
						<span>파일명 : <c:if test="${notice.noticePhoto == null}">없음</c:if><c:if test="${notice.noticePhoto != null}"><a href="noticeFileDownload.do?noticePhoto=${notice.noticePhoto }">${notice.noticePhoto}</a></c:if></span> 
					</div>
					<div class="form-group">
						<button type="button" id="modifyBtn" class="btn btn-primary btn-block" onclick="goNoticeUpdateForm(${notice.noticeNum})">수정하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>