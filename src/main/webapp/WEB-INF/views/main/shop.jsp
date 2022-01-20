<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/header.jsp"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<style type="text/css">
 @font-face {
    font-family: 'OTWelcomeRA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
 }
 
 .wfont {
 	font-family: 'OTWelcomeRA', sans-serif;
 }
</style>

<script src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function interestClick() {
		$(this).attr("icon_heart_alt", "icon_heart");
	}
</script>

<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<a href="/"><i class="fa fa-home"></i> Home</a>
					<span>Shop</span>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Breadcrumb Section Begin -->

<!-- Product Shop Section Begin -->
<section class="product-shop spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
				<div class="filter-widget">
					<h4 class="fw-title">Categories</h4>                   		 <!-- 좌측카테고리 -->
					<ul class="wfont filter-catagories">
						<li><a href="shop.do?lcategoriesNum=2&scategoriesNum=0">상의</a></li>
						<li><a href="shop.do?lcategoriesNum=1&scategoriesNum=0">하의</a></li>
						<li><a href="shop.do?lcategoriesNum=3&scategoriesNum=0">아우터</a></li>
						<li><a href="shop.do?lcategoriesNum=4&scategoriesNum=0">신발</a></li>
						<li><a href="shop.do?lcategoriesNum=5&scategoriesNum=0">악세사리</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-9 order-1 order-lg-2">
			<!-- <div class="product-show-option">
					<div class="row">
						<div class="col-lg-7 col-md-7">
							<div class="select-option">
								<select class="sorting">			
									<option value="">낮은 가격순</option>
									<option value="">높은 가격순</option>
								</select>
							</div>
						</div>
						<div class="col-lg-5 col-md-5 text-right">
							<p>36 Product</p>
						</div>
					</div>
				</div>  	낮은금액, 높은금액보기 기능 // 몇개씩 보여주기 기능-->
				
					
				<div class="product-list">
				
					<div class="row">
						<c:forEach items="${ stocklist }" var="stocklist">		<!-- forEach문 -->
							<div class="col-lg-4 col-sm-6">
								<div class="product-item">
									<div class="wfont pi-pic">
										<img src="${stocklist.stockPhoto}" width="300" height="350" alt=""/>  <!-- img/products/product-1.jpg  ${stocklist.stockPhoto } -->
																				<!-- <div class="sale pp-sale">Sale</div> 세일 -->
										<div class="icon">
											<i class="icon_heart_alt" onclick="interestClick();"></i>								<!-- 좋아요  -->
										</div>
										<ul>
											<li class="w-icon active">
												<a href="#"><i class="icon_bag_alt"></i></a> 			<!-- 장바구니 -->
											</li>
											<li class="quick-view">
												<a href="product.do?stockNum=${stocklist.stockNum}">+ Quick View</a>				 			<!-- 상세보기 -->
											</li>
											<!-- <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li> 랜덤보기 필요 XX -->											
										</ul>
									</div>																							
									<div class="pi-text">										
										<div class="catagory-name"> ${stocklist.lcategoriesName}</div>  <!-- 대카테고리 이름 -->
											<a href="product.do?stockNum=${stocklist.stockNum}">
											<h5 class="wfont">${stocklist.stockName}</h5>								<!-- 상품 이름 -->
										</a>
										<div class="wfont product-price">
											 가격 : \ ${stocklist.stockPrice}  							<!--가격 -->  <!-- <span>$35.00</span> 할인 전 가격 표시 뺌  -->
										</div>
									<!--	<div>색상 :  구현못함  </div>	-->						<!-- ${stocklist.optionColorList}색상 종류 div추가한것 -->
										<div class="wfont">리뷰 개수 : ${stocklist.reviewNum}</div>					<!-- 리뷰 개수 div추가한것 -->						
									</div>						
								</div>
							</div>
						</c:forEach> 
					   
					</div>				 
				</div>		                     	
				<!-- <div class="loading-more">   더보기 기능 x
					<i class="icon_loading"></i> <a href="#"> Loading More </a>
				</div> -->
			</div>
		</div>
	</div>
</section>
<!-- Product Shop Section End -->

<%@include file ="/footer.jsp" %>