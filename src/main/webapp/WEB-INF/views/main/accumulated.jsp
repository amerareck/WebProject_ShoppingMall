<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<span>적립금 내역</span>
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
				<h3>적립금 내역</h3>
				<hr>
				<div style="padding: 3px 5px; background: #eee; text-align: right;">
				총 보유 적립금액 : ${totalAccumulatedMoney} 원
				</div>
				<div class="cart-table">
					<table>
						<thead>
							<tr>
								<th>날짜</th>
								<th>적립내역</th>
								<th>적립금</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${main}" var="main">
							<tr>
								<td style="padding-bottom: 20px; padding-top: 20px;">${main.accumulatedDate}</td>
								<td style="padding-bottom: 20px; padding-top: 20px;">${main.accumulatedHistory}</td>
								<td style="padding-bottom: 20px; padding-top: 20px;">
								<c:set var="accumulatedUse" value="${main.accumulatedUse}"/>
								<c:if test="${main.accumulatedUse eq 'ADD'}">
									<c:out value="+ "/>
								</c:if>
								<c:if test="${main.accumulatedUse eq 'USE'}">
									<c:out value="- "/>
								</c:if>
								${main.accumulatedMoney}
								</td>
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