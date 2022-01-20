<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/header.jsp"%>

<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text product-more">
					<a href="/"><i class="fa fa-home"></i> Home</a>
					<a href="myPage.me">마이페이지</a>
					<span>MY_주문조회</span>
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
				<h3>MY_주문조회</h3>
				<hr>
				<div class="cart-table">
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>상품명</th>
								<th>주문일자</th>
								<th>결제금액</th>
							</tr>
						</thead>
						<tbody>
							<tr style="border-bottom: 1px solid #ebebeb;">
								<td style="padding-bottom: 20px; padding-top: 20px;">1</td>
								<td style="padding-bottom: 20px; padding-top: 20px;">이쁜 바지</td>
								<td style="padding-bottom: 20px; padding-top: 20px;">21-11-04</td>
								<td style="padding-bottom: 20px; padding-top: 20px;">70,000원</td>
							</tr>
							<tr>
								<td style="padding-bottom: 20px; padding-top: 20px;">2</td>
								<td style="padding-bottom: 20px; padding-top: 20px;">좋은 바지</td>
								<td style="padding-bottom: 20px; padding-top: 20px;">21-11-04</td>
								<td style="padding-bottom: 20px; padding-top: 20px;">80,000원</td>
							</tr>
							<tr>
								<td style="padding-bottom: 20px; padding-top: 20px;">3</td>
								<td style="padding-bottom: 20px; padding-top: 20px;">아름다운 바지</td>
								<td style="padding-bottom: 20px; padding-top: 20px;">21-11-04</td>
								<td style="padding-bottom: 20px; padding-top: 20px;">30,000원</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Product Shop Section End -->
<%@include file="/footer.jsp"%>