<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 헤더 연결 -->
<%@include file ="/header.jsp" %>
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
 
.pfont {
	font-family: 'OTWelcomeRA', sans-serif;
	font-size: 18px;
	color: black;
}
</style>

<script src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$.ajax({
			type : "GET",
			url : "",
			data : {
				kor : "${kor}",
				us : "${us}"
			},
			error : function(error) {
				console.log("error");
			},
			success : function(data) {
				console.log("success");

			}
		});
		
		$(".once").click(
			function(){
				$(".once, .active").removeClass("active");
				$(this).addClass("active");
			}
		);
		
		$(".two").click(
				function(){
					$(".two, .active").removeClass("active");
					$(this).addClass("active");
				}
			);
	});
</script>
	<!-- Hero Section Begin -->
	<section class="hero-section">
		<div class="hero-items owl-carousel"> <!-- hero-items : main.js 참고. -->
			<div class="wfont single-hero-items set-bg" data-setbg="img/hero-1.jpg">
				<div class="container">
					<div class="row">
						<div class="col-lg-5">
							<span style="font-size: 14px">반지, 귀걸이, 목걸이</span>
							<h1 style="font-family: Muli">Get item, Right Now!</h1>
							<p class="wfont">당신의 아름다움을 더욱 뽐내게 해줄 상품 할인!</p>
							<a href="shop.do?lcategoriesNum=5&scategoriesNum=0" class="primary-btn" style="font-family:'Muli'; font-size: 20px">Go Shop</a>
						</div>
					</div>
					<div class="off-card"> <!-- 동그라미 단추 인듯. -->
						<h2>
							오픈행사 <span>~50%</span>
						</h2>
					</div>
				</div>
			</div>
			<div class="wfont single-hero-items set-bg" data-setbg="img/hero-2.jpg">
				<div class="container">
					<div class="row">
						<div class="col-lg-5">
							<span style="font-size: 14px">운동화, 슬리퍼</span>
							<h1 style="font-family: Muli">Big Sale!</h1>
							<br>
							<p class="wfont">튼튼한 소재!  뛰어도 끄떡없다!  신발류 할인 판매!</p>
							<a href="shop.do?lcategoriesNum=4&scategoriesNum=0" class="primary-btn" style="font-family:'Muli'; font-size: 20px">Go Shop</a>
						</div>
					</div>
					<div class="off-card">
						<h2>
							창고할인 <span>~50%</span>
						</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- Women Banner Section Begin -->
	<section class="women-banner spad">
		<div class="container-fluid">
			<div class="row">
					<!-- data-setbg : 이미지 경로 -->
				<div class="col-lg-3"> <!-- row1 컨테이너 -->
					<div class="product-large set-bg"
						data-setbg="img/products/women-large.jpg">
						<h2>상의</h2>
						<a href="shop.do?lcategoriesNum=2&scategoriesNum=0">더보기</a>
					</div>
				</div>
				<div class="col-lg-8 offset-lg-1"> <!-- row2 컨테이너 -->
					<div class="filter-control">
						<!-- filter-control.active 속성. js로 hover(or onclick)시 active 이동시키면 될 듯. 
							 혹은 li태그에 a태그를 넣어서 해당 상품 리스트 페이지를 호출하던가...?-->
						<ul>
							<li class="once active">티셔츠</li>
							<li class="once">와이셔츠</li>
							<li class="once">니트</li>
							<li class="once">가디건</li>
						</ul>
					</div>
					<div class="product-slider owl-carousel"> <!-- product-slider : 슬라이더 라이브러리. -->
						<div class="product-item"> <!-- product-item : 슬라이더 내 상품 객체 -->
							<div class="pi-pic"> <!-- pi-pic : 상품이미지 관련 div -->
								<img src="/images/uniqT.jpg" width="270" height="391" alt="" />
								<div class="sale">Sale Off!
								<!-- 세일 마크 : div에 sale 넣어주면 알아서 붙음. -->
								</div>
								<div class="icon"> <!-- icon : 아이콘 담는 컨테이너. elegant-icons 참조하면 됨. -->
									<i class="icon_heart" style="color: red"></i>
									<!-- 클릭하면 관심상품 추가 + 하트아이콘 변경할 수 있는 js 필요. -->
									<!-- 관심전 : icon_heart_alt, 담은 후 : icon_heart -->
								</div>
								<ul>
									<li class="w-icon active"><a href="#"><i
											class="icon_bag_alt"></i></a></li>
									<li class="quick-view"><a href="product.do?stockNum=5">+ Quick View</a></li>
									<li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
								</ul>
							</div>
							<div class="pi-text"> <!-- pi-text : 상품 텍스트 관련 div -->
								<div class="catagory-name">Shorts</div>
								<a href="#">
									<h5>유니클로반팔<!-- 상품제목단(catagory-name) --></h5>
								</a>
								<div class="product-price">
									\4000 <span>\8000</span>
									<!-- 할인하니까 밑줄쫙(35달러) -->
								</div>
							</div>
						</div>
						<div class="product-item"> <!-- product-item : 슬라이더 내 상품 객체 -->
							<div class="pi-pic"> <!-- pi-pic : 상품이미지 관련 div -->
								<img src="/images/ShortT.jpg" width="270" height="391" alt="" />
								<div class="sale">Sale Off!
								<!-- 세일 마크 : div에 sale 넣어주면 알아서 붙음. -->
								</div>
								<div class="icon"> <!-- icon : 아이콘 담는 컨테이너. elegant-icons 참조하면 됨. -->
									<i class="icon_heart" style="color: red"></i>
									<!-- 클릭하면 관심상품 추가 + 하트아이콘 변경할 수 있는 js 필요. -->
									<!-- 관심전 : icon_heart_alt, 담은 후 : icon_heart -->
								</div>
								<ul>
									<li class="w-icon active"><a href="#"><i
											class="icon_bag_alt"></i></a></li>
									<li class="quick-view"><a href="product.do?stockNum=6">+ Quick View</a></li>
									<li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
								</ul>
							</div>
							<div class="pi-text"> <!-- pi-text : 상품 텍스트 관련 div -->
								<div class="catagory-name">Shorts</div>
								<a href="#">
									<h5>커버낫반팔<!-- 상품제목단(catagory-name) --></h5>
								</a>
								<div class="product-price">
									\5000 <span>\9000</span>
								</div>
							</div>
						</div>
						<div class="product-item">
							<div class="pi-pic">
								<img src="/images/knit.jpg" width="270" height="391" alt="" />
								<div class="icon">
									<i class="icon_heart_alt"></i>
								</div>
								<ul>
									<li class="w-icon active"><a href="#"><i
											class="icon_bag_alt"></i></a></li>
									<li class="quick-view"><a href="product.do?stockNum=7">+ Quick View</a></li>
									<li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
								</ul>
							</div>
							<div class="pi-text">
								<div class="catagory-name">Shorts</div>
								<a href="#">
									<h5>사랑스러운니트</h5>
								</a>
								<div class="product-price">
									\18000 <span>\20000</span>
								</div>
							</div>
						</div>
						<div class="product-item">
							<div class="pi-pic">
								<img src="/images/ivoryhood.jpg" width="270" height="391" alt="" />
								<div class="icon">
									<i class="icon_heart-alt" ></i>
								</div>
								<ul>
									<li class="w-icon active"><a href="#"><i
											class="icon_bag_alt"></i></a></li>
									<li class="quick-view"><a href="product.do?stockNum=8">+ Quick View</a></li>
									<li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
								</ul>
							</div>
							<div class="pi-text">
								<div class="catagory-name">Shorts</div>
								<a href="#">
									<h5>박스후드티</h5>
								</a>
								<div class="product-price">
									\20000 <span>\28000</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Women Banner Section End -->

	<!-- Man Banner Section Begin -->
	<section class="man-banner spad">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-8">
					<div class="filter-control">
						<ul>
							<li class="two active">반바지</li>
							<li class="two">청바지</li>
							<li class="two">면바지</li>
							<li class="two">7부바지</li>
						</ul>
					</div>
					<div class="product-slider owl-carousel">
						<div class="product-item">
							<div class="pi-pic">
								<img src="/images/cottonShorts.jpg" width="270" height="391" alt="">
								<div class="sale">Sale</div>
								<div class="icon">
									<i class="icon_heart_alt"></i>
								</div>
								<ul>
									<li class="w-icon active"><a href="#"><i
											class="icon_bag_alt"></i></a></li>
									<li class="quick-view"><a href="product.do?stockNum=1">+ Quick View</a></li>
									<li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
								</ul>
							</div>
							<div class="pi-text">
								<div class="catagory-name">Pants</div>
								<a href="#">
									<h5>에잇세컨드반바지</h5>
								</a>
								<div class="product-price">
									\40000 <span>\60000</span>
								</div>
							</div>
						</div>
						<div class="product-item">
							<div class="pi-pic">
								<img src="/images/knitShorts.jpg" width="270" height="391" alt="">
								<div class="icon">
									<i class="icon_heart_alt"></i>
								</div>
								<ul>
									<li class="w-icon active"><a href="#"><i
											class="icon_bag_alt"></i></a></li>
									<li class="quick-view"><a href="product.do?stockNum=2">+ Quick View</a></li>
									<li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
								</ul>
							</div>
							<div class="pi-text">
								<div class="catagory-name">Pants</div>
								<a href="#">
									<h5>니트반바지</h5>
								</a>
								<div class="product-price">\30000</div>
							</div>
						</div>
						<div class="product-item">
							<div class="pi-pic">
								<img src="/images/nikepants.jpg" width="270" height="391" alt="">
								<div class="icon">
									<i class="icon_heart_alt"></i>
								</div>
								<ul>
									<li class="w-icon active"><a href="#"><i
											class="icon_bag_alt"></i></a></li>
									<li class="quick-view"><a href="product.do?stockNum=3">+ Quick View</a></li>
									<li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
								</ul>
							</div>
							<div class="pi-text">
								<div class="catagory-name">Pants</div>
								<a href="#">
									<h5>나이키긴바지</h5>
								</a>
								<div class="product-price">\14000</div>
							</div>
						</div>
						<div class="product-item">
							<div class="pi-pic">
								<img src="/images/pants.jpg" width="270" height="391" alt="">
								<div class="icon">
									<i class="icon_heart_alt"></i>
								</div>
								<ul>
									<li class="w-icon active"><a href="#"><i
											class="icon_bag_alt"></i></a></li>
									<li class="quick-view"><a href="product.do?stockNum=4">+ Quick View</a></li>
									<li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
								</ul>
							</div>
							<div class="pi-text">
								<div class="catagory-name">Pants</div>
								<a href="#">
									<h5>통긴바지</h5>
								</a>
								<div class="product-price">\15000</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 offset-lg-1">
					<div class="product-large set-bg m-large"
						data-setbg="img/products/man-large.jpg">
						<h2>하의</h2>
						<a href="#">더보기</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Man Banner Section End -->
<%@include file ="/footer.jsp" %>




