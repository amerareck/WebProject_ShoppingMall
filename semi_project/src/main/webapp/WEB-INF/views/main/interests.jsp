<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.springcompany.biz.user.dao.UserVO" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@include file="/header.jsp"%>
<style type="text/css">
img {
	max-width: 100px;
 	max-height: 100px;
}
</style>
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text product-more">
					<a href="/"><i class="fa fa-home"></i> Home</a> 
					<a href="myPage.me">마이페이지</a> <span>관심상품</span>
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
				<h3 style="font-family:'Nanum Gothic', sans-serif; font-weight: 700">관심상품</h3>
				<hr>
				<div class="cart-table">
					<table>
						<thead>
							<tr>
								<th>사진</th>
								<th>상품명</th>
								<th>가격</th>
								<th>수량</th>
								<th>담기</th>
							</tr>
						</thead>
						<tbody> 
							
							<c:forEach items="${stocklist}" var="stock">
							<c:set value="${stock.optionNum}" var="optionNum"/>
							<c:set value="${stock.stockPhoto}" var="stockPhoto"/>
							<c:set value="${stock.stockName}" var="stockName"/>
							<c:set value="${stock.optionColor}" var="optionColor"/>
							<c:set value="${stock.optionSize}" var="optionSize"/>
							<c:set value="${stock.optionAmount}" var="optionAmount"/>
							<c:set value="${stock.accumulatedMoney}" var="accumulatedMoney"/>
							<c:set value="${stock.stockPrice}" var="stockPrice"/>
							
							<tr>
								<td class="cart-pic first-row">
									<img src="<c:out value="${stockPhoto}"/>" alt="">
								</td>
								<td class="cart-title first-row">
									<h5 align="center"><c:out value="${stockName}"/></h5>
								</td>
								<td class="p-price first-row"><c:out value="${stockPrice}"/> 원</td>
								<td class="qua-col first-row">
									<div class="quantity">
										<div class="pro-qty">
											<input type="text" id="basketAmount" value="1">
										</div>
									</div>
								</td>
								<td class="close-td first-row">
										<form action="interestToBaskets.do">
									<%-- ajax로 해야하는데 배울시간도 없고 적용하기 빠른건 리다이렉트... 이해점 --%>
										<input type="hidden" name="basketAmount" value="1"/>
										<input type="hidden" name="memberNum" value="<%=member.getMemberNum()%>"/>
										<input type="hidden" name="optionNum" value="${optionNum}"/> 
										<input type="hidden" name="stockPhoto" value="${stockPhoto}"/> 
										<input type="hidden" name="stockName" value="${stockName}"/> 
										<input type="hidden" name="optionColor" value="${optionColor}"/> 
										<input type="hidden" name="optionSize" value="${optionSize}"/> 
										<input type="hidden" name="optionAmount" value="${optionAmount}"/> 
										<input type="hidden" name="accumulatedMoney" value="${accumulatedMoney}"/> 
										<input type="hidden" name="stockPrice" value="${stockPrice}"/> 
										<button class="btn btn-info btn-sm" 
												style="background-color: buttonshadow; border-color: activeborder;" 
												type="submit" 
												onclick="alert('해당 관심상품이 장바구니로 이동하였습니다.');">
											<i class="ti-shopping-cart-full"></i>
											<%-- <c:out value="<script type='text/javascript'>alert('해당 관심상품이 장바구니로 이동하였습니다.');</script>" escapeXml="false"/> --%>
										</button>
										</form>
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