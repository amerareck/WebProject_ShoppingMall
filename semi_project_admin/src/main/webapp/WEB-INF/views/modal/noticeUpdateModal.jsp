<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<script type="text/javascript">
function noticeUpdate() {
	if(confirm("공지사항을 수정하시겠습니까?")){
		$("#noticeUpdateForm").submit();
		alert("수정이 완료되었습니다.");
	}
}
</script>
<div id="noticeUpdate" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="false">&times;</button>
				<h4 class="modal-title">공지사항 수정</h4>
			</div>
			<div class="modal-body">
				<form id="noticeUpdateForm" action="updatenotice.do" method="post" enctype="multipart/form-data">
					<input type="hidden" id="noticeNum" name="noticeNum" value="${notice.noticeNum}">
					<div class="form-group">
						<span>제목</span> 
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="noticeTitle" name="noticeTitle" value="${notice.noticeTitle}" >
					</div>
					<div class="form-group">
						<span>내용</span> 
					</div>
					<div class="form-group">
						<textarea class="form-control" id="noticeContent" name="noticeContent" style="height: 200px;">${notice.noticeContent}</textarea>
					</div>
					<div class="form-group">
						<span>현재 업로드파일 : <c:if test="${notice.noticePhoto == null}">없음</c:if><c:if test="${notice.noticePhoto != null}">${notice.noticePhoto}</c:if></span><br> 
						<span>신규 업로드 파일 : </span><input name="uploadFile" type="file">
					</div>
					<div class="form-group">
						<button type="button" id="modifyBtn" class="btn btn-primary btn-block" onclick="noticeUpdate()">수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>