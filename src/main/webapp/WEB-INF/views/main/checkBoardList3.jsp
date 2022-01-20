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
					<span>내가 쓴 리뷰</span>
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
				<h3>MY_리뷰확인</h3>
				<hr>
				<div class="cart-table">
					<table>
						<thead>
							<tr>
								<th>상품명</th>
								<th>리뷰평점</th>
								<th>리뷰내용</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<%-- 상품명에 앵커달아서 상품이나 리뷰게시판으로 이동하게끔 해도 될 듯. --%>
							<c:forEach items="${main}" var="main">
							<tr style="border-bottom: 1px solid #ebebeb;">
								<td style="padding-bottom: 20px; padding-top: 20px;">${main.stockName}</td>
								<td style="padding-bottom: 20px; padding-top: 20px;">${main.reviewGrade}</td>
								<td style="padding-bottom: 20px; padding-top: 20px;">${main.reviewContent}</td>
								<td style="padding-bottom: 20px; padding-top: 20px;">${main.reviewDate}</td>
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