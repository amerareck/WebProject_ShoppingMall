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
					<h4 class="fw-title" style="font-family:'Nanum Gothic', sans-serif; font-weight:700">
						마이페이지</h4>
					<ul class="filter-catagories" style="font-family:'Nanum Gothic', sans-serif; font-weight:700">
						<li><a href="editInfo.me"> 정보수정 </a></li>
						<li><a href="myaccumulated.me"> 적립금 </a></li>
						<li><a href="myinterests.do">관심상품</a></li>
						<li><a href="myqna.me"> QnA </a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-9">
				<div class="row">
				<div class="col-md-6" align="left">
				<h3>QnA</h3>
				</div>
				<div class="col-md-6" align="right">
				<button class="btn btn-info btn-sm" onclick="location.href='insertQna.me'">문의글 작성</button>
				</div>
				</div>
				<hr>
				<div class="cart-table">
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성일</th>
								<th>답변상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${notice}" var="notice">
							<tr style="border-bottom: 1px solid #ebebeb;">
								<td style="padding-bottom: 20px; padding-top: 20px;">[Notice]</td>
								<td style="padding-bottom: 20px; padding-top: 20px;">
									<a href="noticeView.me?notice=${notice.noticeNum}">${notice.noticeTitle}</a></td>
								<td style="padding-bottom: 20px; padding-top: 20px;">${notice.noticeDate}</td>
								<td style="padding-bottom: 20px; padding-top: 20px;">-</td>
							</tr>
							</c:forEach>
							<c:forEach items="${main}" var="main" varStatus="seq">
							<tr>
								<td style="padding-bottom: 20px; padding-top: 20px;">${seq.count}</td>
								<td style="padding-bottom: 20px; padding-top: 20px;">
									<a href="qnaView.me?inquire=${main.inquireNum}">${main.inquireTitle}</a></td>
								<td style="padding-bottom: 20px; padding-top: 20px;">${main.inquireDate}</td>
								<td style="padding-bottom: 20px; padding-top: 20px;">${main.replyStatus}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
			</div>
		</div>
	</div>
</section>
<!-- Product Shop Section End -->
<%@include file="/footer.jsp"%>