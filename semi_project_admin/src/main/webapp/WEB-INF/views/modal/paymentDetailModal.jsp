<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div id="paymentDetail" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="false">&times;</button>
				<h4 class="modal-title">거래내용 상세보기</h4>
			</div>
			<div class="modal-body">
				<div>
					<table class="table">
						<tr>
							<th>결제번호</th>
							<td>${payment.transactionNum }</td>
							<th></th>
							<td></td>
						</tr>
						<tr>
							<th>주문자</th>
							<td>${payment.memberId }</td>
							<th>주문일</th>
							<td>${payment.transactionDate }</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>${payment.deliveryAddress }</td>
							<th>메세지</th>
							<td>${payment.deliveryMessage }</td>
						</tr>
						<tr>
							<th>상품코드</th>
							<td>${payment.stockCode }</td>
							<th>상품명</th>
							<td>${payment.stockName }</td>
						</tr>
						<tr>
							<th>색상</th>
							<td>${payment.optionColor }</td>
							<th>사이즈</th>
							<td>${payment.optionSize }</td>
						</tr>
						<tr>
							<th>수량</th>
							<td>${payment.amount }개</td>
							<th>결제금액</th>
							<td>${payment.payment }원</td>
						</tr>
						<tr>
							<th>거래상태</th>
							<td>
								<c:if test="${payment.transactionStatus == 'Y'}">결제완료</c:if>
								<c:if test="${payment.transactionStatus == 'N'}">결제대기중</c:if>
							</td>
							<th>결재일</th>
							<td>
								<c:if test="${payment.depositDate == '' || payment.depositDate == null}">-</c:if>
								<c:if test="${payment.depositDate != '' && payment.depositDate != null}">${payment.depositDate }</c:if>
							</td>
						</tr>
						<tr>
							<th>배송상태</th>
							<td>
								<c:if test="${payment.deliveryStatus == 'Y'}">배송완료</c:if>
								<c:if test="${payment.deliveryStatus == 'N'}">배송대기중</c:if>
							</td>
							<th>배송일</th>
							<td>
								<c:if test="${payment.deliveryDate == '' || payment.deliveryDate == null}">-</c:if>
								<c:if test="${payment.deliveryDate != '' && payment.deliveryDate != null}">${payment.deliveryDate }</c:if>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>