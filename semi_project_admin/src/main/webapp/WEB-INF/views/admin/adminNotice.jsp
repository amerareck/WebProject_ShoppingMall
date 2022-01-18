<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@include file="/header.jsp"%>
<script type="text/javascript">
	
	function goNoticeDetailModal(noticeNum) {
		var param = {
			noticeNum: noticeNum,
		};
		$.ajax({
	        type: 'POST',
	        url: 'popup/noticeDetail.do',
	        data: param,
	        success: function(data) {
	             if(data != null) {
	            	 $("#pop_layer_0").html(data);
	                 $("#noticeDetail").modal();
	             }
	        }
		});
	}

	$(function() {	
		// 공지 등록 버튼 클릭시
		$(".insertbtn").click(function() {
			if($(".insertbtn").html()=="등록") {
				if($("[name=noticeTitle]").val()=="") {
					alert("제목을 입력해주세요.");
				}else if($("[name=noticeContent]").val()=="") {
					alert("내용을 입력해주세요.");
				}else {
					// 개행처리 하기 위해서 replace 처리
					$("[name=noticeContent]").attr("value", $("[name=noticeContent]").val().replace(/\n/g, '<br>'));
					$("#insertForm").attr("action", "insertnotice.do");
					$("#insertForm").submit();
				}
			}else if($(".insertbtn").html()=="수정") {
				if($("[name=noticeTitle]").val()=="") {
					alert("제목을 입력해주세요.");
				}else if($("[name=ntContent]").val()=="") {
					alert("내용을 입력해주세요.");
				}else {
					// $("[name=ntContent]").attr("value", $("[name=ntContent]").val().replace(/\n/g, '<br>'));
					$("#insertForm").attr("action", "noticeupdate.do");
					// $("#insertForm").submit();
					
					$(location).attr("href", "noticeupdate.do?ntCode="+$(this).val() + "&ntTitle="+$("[name=ntTitle]").val() + "&ntContent="+$("[name=ntContent]").val().replace(/\n/g, '<br>') );
				}
			}
		});
		
		// 공지 수정 버튼 클릭시
		$(".modifybtn").click(function()
		{
			var btnVal = $(this).val();
			
			// 에이쟉스로 해당 공지 정보 가져오기
			$.post("updatenotice.do", {ntCode:$(this).val()}, function(data)
			{
				// 제이슨 이용^^
				var obj = JSON.parse(data);
				
				// 모달에 처리자와 사유 입력
				$("#attachMent").html("※ 공지 수정시에는 첨부파일 등록/삭제가 불가능하오니 새로운 첨부파일 등록을 위해선 공지사항을 재등록해주시기 바랍니다.<br>※ 한번 등록된 첨부파일은 수정 후에도 사라지지 않습니다.");
				$(".insertbtn").html("수정");
				$("[name=ntTitle]").val(obj.ntTitle);
				$("[name=ntContent]").val(obj.ntContent);
				$("[name=ntAttach]").css("display", "none");
				$(".ntInsertForm").html("공지 수정");
				$(".insertbtn").attr("value", btnVal);
			});
		});
			
	});
	
</script>
</head>
<body>
	<div id="pop_layer_0"></div>
	<!-- WRAPPER -->
	<div id="wrapper">
		<%@include file="/navbar.jsp"%>
		<!-- MAIN -->
		<div class="main">
			<div class="main-content">
				<div class="container-fluid">
					<!-- 공지목록 -->
					<div class="panel panel-headline">
						<div class="panel-heading">
							<div class="row">
								<div class="col-md-12">
									<h3 class="panel-title">공지 목록</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse">
											<i class="lnr lnr-chevron-down"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div class="row">    
						        <div class="col-md-8">
								    <form action="notice.do" method="post">
										<div class="input-group">
											<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="Search..." value="${searchKeyword }">
											<span class="input-group-btn">
												<button id="search" class="btn btn-default" type="submit">
													<span class="glyphicon glyphicon-search"></span>
												</button>
											</span>
										</div>
									</form>
						        </div>
							</div>
							<table class="table">
								<thead>
									<tr>
										<th>번호</th>
										<th>공지제목</th>
										<th>등록일</th>
										<th>첨부파일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${noticeList}" var="notice">
										<tr>
											<td><a href="javascript:goNoticeDetailModal(${notice.noticeNum })">${notice.noticeNum }</a></td>
											<td><a href="javascript:goNoticeDetailModal(${notice.noticeNum })">${notice.noticeTitle }</a></td>
											<td><a href="javascript:goNoticeDetailModal(${notice.noticeNum })">${notice.noticeDate }</a></td>
											<td><a href="noticeFileDownload.do?noticePhoto=${notice.noticePhoto }">${notice.noticePhoto }</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- END 공지목록 -->
					<!-- 공지등록 -->
					<div class="panel panel-headline">
						<div class="panel-heading">
							<div class="row">
								<div class="col-md-12">
									<h3 class="panel-title ntInsertForm">공지등록</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse">
											<i class="lnr lnr-chevron-down"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div class="row">
							<form id="insertForm" action="noticeinsert.do" method="post" enctype="multipart/form-data">
								<div class="col-md-12">
									<div class="form-group col-md-12">
										공지제목
										<input name="noticeTitle" type="text" class="form-control"><br>
										공지내용
										<textarea name="noticeContent" class="form-control" rows="10" style="resize:none;"></textarea><br>
										<span id="attachMent">첨부파일</span>
										<input name="uploadFile" type="file"><br>
									</div>
									<button type="button" class="btn btn-default insertbtn" style="width:100%; height: 30px;">등록</button>
								</div>
							</form>
							</div>
						</div>
					</div>
					<!-- END 공지등록 -->
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
</html>>