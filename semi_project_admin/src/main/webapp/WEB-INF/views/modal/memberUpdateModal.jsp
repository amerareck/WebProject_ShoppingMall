<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
function memberUpdate(memberNum) {
	if(confirm("회원정보를 수정하시겠습니까?")){
		$("#memberUpdateForm").submit();
		alert("수정이 완료되었습니다.");
	}
}
</script>
<!-- 회원정보 수정 모달 -->
<div id="memberInfoUpdate" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modalAdd" aria-hidden="true">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="false">&times;</button>
				<h4 class="modal-title">회원정보 수정</h4>
			</div>
			<div class="modal-body">
				<form id="memberUpdateForm" action="updatemember.do" method="post">
					<div class="row">
						<!-- 회원번호 -->
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<div class="col-md-3">회원번호</div>
								<div class="col-md-9">
									<input type="text" class="form-control" id="memberNum" name="memberNum" value="${member.memberNum }" readonly="readonly">
								</div>
							</div>
							<div class="form-group col-md-1"></div>
						</div>
						<!-- END 회원번호 -->
						<!-- 회원 가입일 -->
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<div class="col-md-3">회원 가입일</div>
								<div class="col-md-9">
									<input type="text" class="form-control" id="memberDate" name="memberDate" value="${member.memberDate }" readonly="readonly">
								</div>
							</div>
							<div class="form-group col-md-1"></div>
						</div>
						<!-- 회원 가입일 -->
						<!-- 아이디 -->
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<div class="col-md-3">아이디</div>
								<div class="col-md-9">
									<input type="text" class="form-control" id="memberId" name="memberId" value="${member.memberId }" readonly="readonly">
								</div>
							</div>
							<div class="form-group col-md-1"></div>
						</div>
						<!-- END 아이디 -->
						<!-- 이름 -->
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<div class="col-md-3">이 름</div>
								<div class="col-md-9">
									<input type="text" class="form-control" id="memberName" name="memberName" value="${member.memberName }" readonly="readonly">
								</div>
							</div>
							<div class="form-group col-md-1"></div>
						</div>
						<!-- END 이름 -->
						<!-- 핸드폰번호 -->
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<div class="col-md-3">전화번호</div>
								<div class="col-md-9">
									<input type="text" class="form-control" id="memberTel" name="memberTel" value="${member.memberTel }">
								</div>
							</div>
							<div class="form-group col-md-1"></div>
						</div>
						<!-- END 핸드폰번호 -->
						<!-- 이메일 -->
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<div class="col-md-3">이 메 일</div>
								<div class="col-md-9">
									<input type="text" class="form-control" id="memberEmail" name="memberEmail" value="${member.memberEmail }">
								</div>
							</div>
							<div class="form-group col-md-1"></div>
						</div>
						<!-- END 이메일 -->
						<!-- 이메일 -->
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group col-md-1"></div>
							<div class="form-group col-md-10">
								<div class="col-md-3">주소</div>
								<div class="col-md-9">
									<input type="text" class="form-control" id="memberAddress" name="memberAddress" value="${member.memberAddress }">
								</div>
							</div>
							<div class="form-group col-md-1"></div>
						</div>
						<!-- END 이메일 -->
						<div class="form-group col-md-12" style="margin-bottom: 0px;">
							<div class="form-group">
								<div class="col-md-12">
									<div class="col-md-6">
										<button type="button" id="modifyBtn" class="btn btn-primary btn-block" onclick="memberUpdate(${member.memberNum })">수정</button>
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