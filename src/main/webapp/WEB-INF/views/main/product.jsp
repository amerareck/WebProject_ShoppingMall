<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/header.jsp"%>

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
 
 .wsize {
 	font-size: 20px;
 }
 
 img {
 height: 100%;
 width: 100%;
 object-fit: contain;
}
</style>

<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text product-more">
					<a href=""><i class="fa fa-home"></i> Home</a>
					<a href="shop.do">Shop</a>
					<span>Detail</span>
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
			<div class="col-lg-12">
				<div class="row">
					<div class="col-lg-6">
						<div class="product-pic-zoom">
							<img class="product-big-img"							
								src="${stock.stockPhoto}" width="500" height="700" alt="">    <!-- 큰사진  -->
							<div class="zoom-icon">
								<i class="fa fa-search-plus"></i>							 <!-- 확대기능 -->
							</div>
						</div>
						<div class="product-thumbs">
							<div class="product-thumbs-track ps-slider owl-carousel">
								<div class="pt active"
									data-imgbigurl="img/product-single/product-1.jpg">
									<img src="img/product-single/product-1.jpg" alt="">  	 <!-- 작은 사진 -->
								</div>
								<div class="pt"
									data-imgbigurl="img/product-single/product-2.jpg">
									<img src="img/product-single/product-2.jpg" alt="">
								</div>
								<div class="pt"
									data-imgbigurl="img/product-single/product-3.jpg">
									<img src="img/product-single/product-3.jpg" alt="">
								</div>
								<div class="pt"
									data-imgbigurl="img/product-single/product-3.jpg">
									<img src="img/product-single/product-3.jpg" alt="">
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="product-details">
							<div class="wfont pd-title">				<!-- <span>oranges</span>    카테고리이름 x -->
								<h3 class="wfont"> ${stock.stockName}</h3>
								<a href="#" class="heart-icon"><i class="icon_heart_alt"></i></a>			<!-- 좋아요 -->
							</div>
							<div class="pd-rating">															<!-- 평점 -->
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star-o"></i>
								<span>(5)</span>
							</div>
							<div class="wfont pd-desc">
								<p class="wfont">${stock.stockInfo}</p>													<!-- 상품상세 정보 -->
								<h4 class="wfont">
									${stock.stockPrice} 원 	<span>${stock.accmulatedMoney} 원 적립</span>		<!-- 가격 <span>   </span> 할인 전가격 필요 X -->
								</h4>
								
							</div>
							<div class="pd-color">
								<h6>Color</h6>																<!-- 색상X -->								
								<div class="pd-color-choose">
									<div class="cc-item">
										<input type="radio" id="cc-black">
										<label for="cc-black"></label>
									</div>
									<div class="cc-item">
										<input type="radio" id="cc-yellow">
										<label for="cc-yellow" class="cc-yellow"></label>
									</div>
									<div class="cc-item">
										<input type="radio" id="cc-violet">
										<label for="cc-violet" class="cc-violet"></label>
									</div>
								</div>							
							</div>
							
							<div class="pd-size-choose"> 									 				<!-- 사이즈X -->
								<div class="sc-item">
									<input type="radio" id="sm-size" > <label for="sm-size">s</label>
								</div>
								
								<div class="sc-item">
									<input type="radio" id="md-size"> <label for="md-size">m</label>
								</div>
								<div class="sc-item">
									<input type="radio" id="lg-size"> <label for="lg-size">l</label>
								</div>
								<div class="sc-item">
									<input type="radio" id="xl-size"> <label for="xl-size">xs</label>
								</div>
							</div>
							
							<div class="quantity">
								<div class="pro-qty">
									<input type="text" value="1">										<!-- 수량X -->
								</div>
								<a href="#" class="wfont wsize primary-btn pd-cart">담기</a>						
							</div>							
							<div class="quantity">
								<a href="#" class="wfont wsize primary-btn pd-cart">장바구니</a>
									
								<a href="#" class="wfont wsize primary-btn pd-cart" style="margin-left: 2px;">결제하기</a>
							</div>
							<!-- <ul class="pd-tags">
								<li>
									<span>CATEGORIES 필요없음 </span>: More Accessories, Wallets & Cases
								</li>
							</ul> --> 							
						</div>						
					</div>
					
				</div>
				
				
				<div class="product-tab">
					<div class="tab-item">
						<ul class="nav" role="tablist">
							<li>
								<a class="active" data-toggle="tab" href="#tab-1" role="tab">제품설명</a>
							</li>
							<li>
								<a data-toggle="tab" href="#tab-2" role="tab">Reviews (02)</a>
							</li>
							<li>
								<a data-toggle="tab" href="#tab-3" role="tab">문의하기</a>
							</li>
						</ul>
					</div>
					<div class="tab-item-content">
						<div class="tab-content">
							<div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
								<div class="product-content">
									<div class="row">
										<div class="col-lg-7">
											<h5>상품상세 정보</h5>											<!-- 제품소개 -->
																	
										</div>
										<div align="center"> 		<!-- class="col-lg-5" 사진 작게나오게 설정된 class css라서 div 태그에서 지움-->
											<img src="${stock.photoLocation}" alt=""> 	<!-- 상품 상세 사진 -->
										</div>									
									</div>																						
								</div>								
							</div>
							
							<div class="tab-pane fade" id="tab-2" role="tabpanel">					<!-- 리뷰 텝  -->
								<div class="customer-review-option">
									<h4>Reviews</h4>
									<div class="comment-option">
										<div class="co-item">
											<div class="avatar-pic">
												<img src="img/product-single/avatar-1.png" alt="">
											</div>
											<div class="avatar-text">
												<div class="at-rating">
													<i class="fa fa-star"></i> 
													<i class="fa fa-star"></i> 
													<i class="fa fa-star"></i> 
													<i class="fa fa-star"></i> 
													<i class="fa fa-star-o"></i>
												</div>
												<h5>
													Brandon Kelley <span>27 Aug 2019</span>
												</h5>
												<div class="at-reply">Nice !</div>
											</div>
										</div>
										<div class="co-item">
											<div class="avatar-pic">
												<img src="img/product-single/avatar-2.png" alt="">
											</div>
											<div class="avatar-text">
												<div class="at-rating">
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star-o"></i>
												</div>
												<h5>
													Roy Banks <span>27 Aug 2019</span>
												</h5>
												<div class="at-reply">Nice !</div>
											</div>
										</div>
									</div>
									<div class="personal-rating">
										<h6>Your Ratind</h6>
										<div class="rating">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star-o"></i>
										</div>
									</div>
									<div class="leave-comment">
										<h4>Leave A Comment</h4>
										<form action="/" class="comment-form">		<!-- 액션 -->
											<div class="row">
												<div class="col-lg-6">
													<input type="text" placeholder="Name">
												</div>
												<div class="col-lg-6">
													<input type="text" placeholder="Email">
												</div>
												<div class="col-lg-12">
													<textarea placeholder="Messages"></textarea>
													<button type="submit" class="site-btn">Send
														message</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
							<div class="tab-pane fade" id="tab-3" role="tabpanel"> 			<!-- 문의 텝 -->
								<div class="customer-review-option">
									<h4>문의하기</h4>
									<div class="comment-option">
										<div class="co-item">
											<div class="avatar-pic">
												<img src="img/product-single/avatar-1.png" alt="">
											</div>
											<div class="avatar-text">
												<div class="at-rating">
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star-o"></i>
												</div>
												<h5>
													Brandon Kelley <span>27 Aug 2019</span>
												</h5>
												<div class="at-reply">Nice !</div>
											</div>
										</div>
										<div class="co-item">
											<div class="avatar-pic">
												<img src="img/product-single/avatar-2.png" alt="">
											</div>
											<div class="avatar-text">
												<div class="at-rating">
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star-o"></i>
												</div>
												<h5>
													Roy Banks <span>27 Aug 2019</span>
												</h5>
												<div class="at-reply">Nice !</div>
											</div>
										</div>
									</div>
									<div class="personal-rating">
										<h6>Your Ratind</h6>
										<div class="rating">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star-o"></i>
										</div>
									</div>
									<div class="leave-comment">
										<h4>Leave A Comment</h4>
										<form action="/" class="comment-form">				<!-- 액션 -->
											<div class="row">
												<div class="col-lg-6">
													<input type="text" placeholder="Name">
												</div>
												<div class="col-lg-6">
													<input type="text" placeholder="Email">
												</div>
												<div class="col-lg-12">
													<textarea placeholder="Messages"></textarea>
													<button type="submit" class="site-btn">Send
														message</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Product Shop Section End -->

<!-- Related Products Section End -->	<!--관심상품  -->
<div class="related-products spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title">
					<h2>Related Products</h2>
				</div>
			</div>
		</div>
		<div class="row">
			
			<div class="col-lg-3 col-sm-6">
				<div class="product-item">
					<div class="pi-pic">
						<img src="img/products/women-1.jpg" alt="">
						<div class="sale">Sale</div>
						<div class="icon">
							<i class="icon_heart_alt"></i>
						</div>
						<ul>
							<li class="w-icon active"><a href="#"><i
									class="icon_bag_alt"></i></a></li>
							<li class="quick-view"><a href="#">+ Quick View</a></li>
							<!-- <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li> -->
						</ul>
					</div>
					<div class="pi-text">
						<div class="catagory-name">Coat</div>
						<a href="#">
							<h5>Pure Pineapple</h5>
						</a>
						<div class="product-price">
							$14.00 <span>$35.00</span>
						</div>
					</div>
				</div>
			</div>
			<!-- 반복  -->
			 <div class="col-lg-3 col-sm-6">
				<div class="product-item">
					<div class="pi-pic">
						<img src="img/products/women-2.jpg" alt="">
						<div class="icon">
							<i class="icon_heart_alt"></i>
						</div>
						<ul>
							<li class="w-icon active"><a href="#"><i
									class="icon_bag_alt"></i></a></li>
							<li class="quick-view"><a href="#">+ Quick View</a></li>
							<!-- <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li> 랜덤보기 지움-->
						</ul>
					</div>
					<div class="pi-text">
						<div class="catagory-name">Shoes</div>
						<a href="#">
							<h5>Guangzhou sweater</h5>
						</a>
						<div class="product-price">$13.00</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6">
				<div class="product-item">
					<div class="pi-pic">
						<img src="img/products/women-3.jpg" alt="">
						<div class="icon">
							<i class="icon_heart_alt"></i>
						</div>
						<ul>
							<li class="w-icon active"><a href="#"><i
									class="icon_bag_alt"></i></a></li>
							<li class="quick-view"><a href="#">+ Quick View</a></li>
							<!-- <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li> 랜덤보기 지움-->
						</ul>
					</div>
					<div class="pi-text">
						<div class="catagory-name">Towel</div>
						<a href="#">
							<h5>Pure Pineapple</h5>
						</a>
						<div class="product-price">$34.00</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6">
				<div class="product-item">
					<div class="pi-pic">
						<img src="img/products/women-4.jpg" alt="">
						<div class="icon">
							<i class="icon_heart_alt"></i>
						</div>
						<ul>
							<li class="w-icon active"><a href="#"><i
									class="icon_bag_alt"></i></a></li>
							<li class="quick-view"><a href="#">+ Quick View</a></li>
							<!-- <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li> 랜덤보기 지움-->
						</ul>
					</div>
					<div class="pi-text">
						<div class="catagory-name">Towel</div>
						<a href="#">
							<h5>Converse Shoes</h5>
						</a>
						<div class="product-price">$34.00</div>
					</div>
				</div>
			</div> 
						
		</div>
	</div>
</div>
<!-- Related Products Section End -->

<%@include file="/footer.jsp"%>