<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
 
.pfont {
	font-family: 'OTWelcomeRA', sans-serif;
	font-size: 18px;
	color: black;
}
</style>

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text product-more">
                        <a href="/"><i class="fa fa-home"></i> Home</a>
                        <a href="baskets.do">장바구니</a>
                        <span>결제 정보</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Shopping Cart Section Begin -->
    <section class="checkout-section spad">
        <div class="container">
            <form action="#" class="checkout-form">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="checkout-content">
                            <a href="#" class="content-btn">Click Here To Login</a>
                        </div>
                        <h4>구매 정보 입력</h4>
                        <div class="row">
                            <div class="col-lg-6">
                                <label for="fir">주문자 성함<span>*</span></label>
                                <input type="text" id="fir">
                            </div>
                            <div class="col-lg-6">
                                <label for="last">받는자 성함<span>*</span></label>
                                <input type="text" id="last">
                            </div>
                            <div class="col-lg-12">
                                <label for="cun-name">배송지 우편번호</label>
                                <input type="text" id="cun-name">
                            </div>
                            <div class="col-lg-12">
                                <label for="street">배송지 주소<span>*</span></label>
                                <input type="text" id="street" class="street-first">
                                <input type="text">
                            </div>
                            <div class="col-lg-6">
                                <label for="phone">배송 연락처<span>*</span></label>
                                <input type="text" id="phone">
                            </div>
                            <div class="col-lg-6">
                                <label for="email">이메일 주소<span>*</span></label>
                                <input type="text" id="email">
                            </div>
                            <div class="col-lg-12">
                                <label for="cun">배송 메세지<span>*</span></label>
                                <input type="text" id="cun">
                            </div>
                            <div class="col-lg-12">
                                <div class="create-item">
                                    <label for="acc-create">
                                        Create an account?
                                        <input type="checkbox" id="acc-create">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="checkout-content">
                            <input type="text" placeholder="Enter Your Coupon Code">
                        </div>
                        <div class="place-order">
                            <h4>Your Order</h4>
                            <div class="order-total">
                                <ul class="order-table">
                                    <li>Product <span>Total</span></li>
                                    <li class="fw-normal">Combination x 1 <span>$60.00</span></li>
                                    <li class="fw-normal">Combination x 1 <span>$60.00</span></li>
                                    <li class="fw-normal">Combination x 1 <span>$120.00</span></li>
                                    <li class="fw-normal">Subtotal <span>$240.00</span></li>
                                    <li class="total-price">Total <span>$240.00</span></li>
                                </ul>
                                <div class="payment-check">
                                    <div class="pc-item">
                                        <label for="pc-check">
                                            무통장 결제
                                            <input type="checkbox" id="pc-check" checked="checked">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                                <div class="order-btn">
                                    <button type="submit" class="site-btn place-btn">Place Order</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <!-- Shopping Cart Section End -->
<%@include file ="/footer.jsp" %>