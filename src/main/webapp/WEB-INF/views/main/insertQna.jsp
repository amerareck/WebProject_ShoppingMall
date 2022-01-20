<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@include file="/header.jsp"%>
<%-- 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/i18n/default-*.min.js"></script>
<script type="text/javascript">
	function get_option(option, selectOption) {
		$.ajax({
			type:'GET'
			url:'stockList.do'+option,
			contentType: "application/json; charset=UTF-8",
			dataType:'json',
			success:function(result){ 
				console.log(result)
				for(i=0; i<result.length; i++) {
					selectOption.options[i] = new Option(result[i], i);
				}
			}
		}).fail(function(error){
			alert(JSON.stringify(error));
		})
	}
</script>
--%>
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text product-more">
					<a href="/"><i class="fa fa-home"></i> Home</a>
					<a href="myPage.me">마이페이지</a>
					<a href="myqna.me">My QnA</a>
					<span>문의 작성</span>
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
				<div class="row">
					<div class="col-md-6" align="left">
					<h3>QnA - 문의 작성</h3>
					</div>
					<div class="col-md-6" align="right">
					<%-- 
					<button class="btn btn-info btn-sm" onclick="location.href='insertQna.me'">문의글 작성</button>
					--%>
					</div>
				</div>
				<hr>
				<div class="cart-table">
					<form action="insertQna.me" method="post">
						<div>
							<select name="stockNum" class="select">
								<option value="">문의할 상품명 선택</option>
								<c:forEach items="${main}" var="main">
									<option value="${main.stockNum}">
									<c:out value="${main.stockName}"/>
									</option>
								</c:forEach>
							</select>
						</div>
						<div>
							<input type="text" name="inquireTitle" class="form-control mt-4 mt-2"
							 	placeholder="제목을 입력해주세요." required/>
						</div>
						<div class="form-group">
							<textarea class="form-control" rows="10" name="inquireContent"
							placeholder="내용을 입력해주세요." required></textarea>
						</div>
						<button type="submit" class="btn btn-info mb-3">제출하기</button>
					</form>
				</div>
				
			</div>
		</div>
	</div>
</section>
<!-- Product Shop Section End -->
<%@include file="/footer.jsp"%>