<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@include file="/header.jsp"%>

<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text product-more">
					<a href="/"><i class="fa fa-home"></i> Home</a>
					<a href="myPage.me">마이페이지</a>
					<span>QnA</span>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Breadcrumb Section Begin -->

<!-- Product Shop Section Begin -->
<section class="product-shop spad page-details">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="filter-widget">
					<h4 class="fw-title">마이페이지</h4>
					<ul class="filter-catagories">
						<li><a href="editInfo.me">정보수정</a></li>
						<li><a href="myaccumulated.me">적립금</a></li>
						<li><a href="myinterests.do">관심상품</a></li>
						<li><a href="myqna.me">QnA</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-9">
				<div class="row">
				<div class="col-md-6" align="left">
				<h3>${boardTitle}</h3>
				</div>
				<div class="col-md-6" align="right">
				<button class="btn btn-info btn-sm" onclick="location.href='myqna.me'">돌아가기</button>
				</div>
				</div>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>
									<c:choose>
									 	<c:when test="${not empty main.noticeTitle}">
									 		- <c:out value="${main.noticeTitle}"/>
									 	</c:when>
										<c:when test="${not empty main.inquireTitle}">
									 		<c:out value="${main.inquireTitle}"/>
									 	</c:when>
									</c:choose>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr style="border-bottom: 1px solid #ebebeb;">
								<td style="padding-bottom: 20px; padding-top: 20px;">
									<c:choose>
									 	<c:when test="${not empty main.noticeContent}">
									 		<c:out value="${main.noticeContent}"/>
									 		<br><br><br><br><br><br><br><br>
									 	</c:when>
										<c:when test="${not empty main.inquireContent}">
									 		<c:out value="${main.inquireContent}"/>
									 		<br><br><br><br><br><br><br><br>
									 	</c:when>
									</c:choose>
								</td>
							</tr>
								<c:if test="${not empty main.replyContent}">
								<tr style="border-bottom: 1px solid #ebebeb;">
										<td>
											- 운영진 답변 -
										</td>
									</tr>
									<tr style="border-bottom: 1px solid #ebebeb;">
										<td>
											<c:out value="${main.replyContent}"/>
										</td>
									</tr>
								</c:if>
						</tbody>
					</table>
				</div>
				
			</div>
		</div>
	</div>
</section>
<!-- Product Shop Section End -->
<%@include file="/footer.jsp"%>