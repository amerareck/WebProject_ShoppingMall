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
 	font-weight: 700;
 	font-size: 48px;
 }
 
#welcome {
    min-height: 350px;
    background: #fff;
    padding: 80px 0;
    font-family: 'Nanum Gothic', serif;
}
.wel_header {
    text-align: center;
    color: #222222;
    padding-top: 0;

}
.fw-heading.fw-heading-center {
    padding-bottom: 40px;

}
.wel_header h2 {
    font-size: 36px;
    font-family: 'Nanum Gothic', sans-serif;
    text-transform: uppercase;
    font-weight: 700;
    padding-bottom: 25px;
    color: #222222;
}
.wel_header p {
    font-size: 16px;
    font-family: 'Nanum Gothic', sans-serif;
}
#welcome .single_item {
    padding-top: 30px;
    text-align: center;
}
#welcome .welcome_icon {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    color: black;
    text-align: center;
    margin: 0 auto;
    border: 1px solid #fff	;
    transition: .7s;
}
#welcome .welcome_icon i {
	color: #282828;
    margin-top: 25%;
    font-size: 50px;
    transition: .7s;
}
#welcome .item_list h4 {
    padding: 20px;
    text-transform: uppercase;
    font-weight: 700;
    font-size: 18px;
    color: #393939;
    transition: 0.7s;
    font-family: 'Nanum Gothic', sans-serif;
}
#welcome .item_list p {
    font-size: 14px;
    color: #646464;
    font-family: 'Nanum Gothic', sans-serif;
}
#welcome .item_list:hover .welcome_icon {
    background: #282828;
    cursor: pointer;
}
#welcome .item_list:hover .welcome_icon i {
    color: #fff;
}
#welcome .item_list:hover h4 {
    color: #282828;
    cursor: pointer;
}
</style>
<section id="welcome">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="wfont wel_header">
                            마이 페이지
                        </div>
                    </div>
                </div>
                <!--End of row-->
                <div class="row">
                    <div class="col-md-3">
                        <div class="item">
                            <div class="single_item">
                                <div class="item_list">
                                    <div class="welcome_icon">
                                    <a href="editInfo.me">
                                        <i class="fa fa-cog"></i>
                                    </a>
                                    </div>
                                    <h4>내 정보 수정</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--End of col-md-3-->
                    <div class="col-md-3">
                        <div class="item">
                            <div class="single_item">
                                <div class="item_list">
                                    <div class="welcome_icon">
                                        <a href="myaccumulated.me">
                                        <i class="fa fa-money"></i>
                                        </a>
                                    </div>
                                    <h4>적립금 확인</h4>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--End of col-md-3-->
                    <div class="col-md-3">
                        <div class="item">
                            <div class="single_item">
                                <div class="item_list">
                                    <div class="welcome_icon">
                                    	<a href="myboard.me">
                                        <i class="fa fa-comments"></i>
                                        </a>
                                    </div>
                                    <h4>내가 쓴 리뷰</h4>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--End of col-md-3-->
                    <div class="col-md-3">
                        <div class="item">
                            <div class="single_item">
                                <div class="item_list">
                                    <div class="welcome_icon">
                                    	<a href="myqna.me">
                                        <i class="fa fa-info-circle"></i>
                                        </a>
                                    </div>
                                    <h4>Q & A</h4>
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--End of col-md-3-->
                </div>
                <!--End of row-->
            </div>
            <!--End of container-->
        </section>
        <!--end of welcome section-->
<%@include file ="/footer.jsp" %>