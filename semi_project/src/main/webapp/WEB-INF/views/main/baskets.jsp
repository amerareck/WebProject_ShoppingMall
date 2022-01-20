<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/header.jsp"%>

<style type="text/css">
img {
	max-width: 100px;
 	max-height: 100px;
}
</style>

<script src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#accUse").on("click",
			function() {
				var money = $("#money").val()+"원";
				$("#acc").text(money);
			}
		);
	});
</script>

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text product-more">
                        <a href="/"><i class="fa fa-home"></i> Home</a>
                        <span>장바구니</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="cart-table">
                        <table>
                            <thead>
                                <tr>
                                	<th>선택</th>
                                    <th>사진</th>
                                    <th class="p-name">상품명</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th><i class="ti-close"></i></th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${!empty stock}">
		                            <c:set var="num" value="${0}"/>
		                            	<c:forEach items="${stock}" var="stock">
		                            		<c:set var="number" value="${num+1}"/>
		                            		<c:set var="stockName" value="${stock.stockName}"/>
		                            		<c:set var="stockPhoto" value="${stock.stockPhoto}"/>
		                            		<c:set var="optionColor" value="${stock.optionColor}"/>
		                            		<c:set var="optionSize" value="${stock.optionSize}"/>
		                            		<c:set var="stockPrice" value="${stock.stockPrice}"/>
		                            		<c:set var="basketAmount" value="${stock.basketAmount}"/>
		                            		<c:set var="num" value="${number}"/>
		                                	<tr>
			                                	<td>
			                                		<input type="checkbox" />
			                                	</td>
			                                    <td class="cart-pic first-row">
			                                    	<img src="${stockPhoto}" alt="" style="size: 300px"></td>
			                                    <td class="cart-title first-row">
			                                        <h5>${stockName}</h5>
			                                        <small>${optionColor} / ${optionSize} </small>
			                                    </td>
			                                    <td id="${number}" class="p-price first-row">${stockPrice}</td>
			                                    <td class="qua-col first-row">
			                                        <div class="quantity">
			                                            <div class="pro-qty">
			                                                <input type="text" value="${basketAmount}">
			                                            </div>
			                                        </div>
			                                    </td>
			                                    <td class="close-td first-row"><i class="ti-close"></i></td>
		                                </tr>
		                               </c:forEach>
	                               </c:when>
	                               
	                               <c:otherwise>
	                               		<tr>
	                               			<td colspan="6" style="padding-top: 34">
	                               				<span style="align-content: center">* 장바구니 목록이 비어있습니다.</span>
	                               			</td>
	                               		</tr>
	                               </c:otherwise>
	                           </c:choose>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="discount-coupon">
                                <h6 style="margin-bottom: 8px">* 보유적립금</h6>
                                    <input type="text" value="4000" readonly>
                                <br>
                                	<div>
		                                <h6 style="margin-top:8px; margin-bottom: 8px;">* 사용할 적립금</h6>
                                    	<input type="number" id="money" name="accumulatedUse">
                                    	<button type="button" id="accUse" class="btn btn-warning btn-sm"> 사용</button>
                            		</div>
                            </div>
                        </div>
                        <div class="col-lg-4 offset-lg-4">
                            <div class="proceed-checkout">
                                <ul>
                                    <li class="subtotal">총가격 <span id="price">24000원</span></li>
                                    <li class="subtotal">배송비 <span id="delivery">4000원</span></li>
                                    <li class="subtotal">적립금사용 <span id="acc">0원</span></li>
                                    <li class="cart-total">Total <span id="totalPrice">26000원</span></li>
                                </ul>
                                <form action="checkOut.me">
                                	<input type="hidden" />
                                	<button type="submit" class="proceed-btn">결제하기</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->
<%@include file="/footer.jsp"%>