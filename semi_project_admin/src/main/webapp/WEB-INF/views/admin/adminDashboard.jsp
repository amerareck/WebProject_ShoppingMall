<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/header.jsp"%>
<script>
	function printTime() {
		// 출력할 장소 선택
		var clock = document.getElementById("clock");

		// 현재시간
		var now = new Date();
		var nowTime = now.getFullYear() + "년" + (now.getMonth() + 1) + "월"
				+ now.getDate() + "일" + now.getHours() + "시" + now.getMinutes()
				+ "분" + now.getSeconds() + "초";

		// 현재시간을 출력
		clock.innerHTML = nowTime;

		// setTimeout(“실행할함수”,시간) 시간은1초의 경우 1000
		setTimeout("printTime()", 1000);
	}

	window.onload = function() {
		// 페이지가 로딩되면 실행
		printTime();
	}
</script>
</head>
<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<%@include file="/navbar.jsp"%>
		<!-- MAIN -->
		<div class="main">
			<div class="main-content">
				<div class="container-fluid">
					<!-- OVERVIEW -->
					<div class="panel panel-headline">
						<div class="panel-heading">
							<h3 class="panel-title">사이트 통계</h3>
							<p>
								<span>현재시간 : </span><span class="panel-subtitle" id="clock"></span>
							</p>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-3">
									<div class="metric">
										<span class="icon"><i class="fa fa-download"></i></span>
										<p>
											<span class="number">${siteStatics.totalMemberCount}</span>
											<span class="title">전체 회원 수</span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<span class="icon"><i class="fa fa-shopping-bag"></i></span>
										<p>
											<span class="number">${siteStatics.yesterdaySell}개/${siteStatics.totalSell}개</span>
											<span class="title">어제 판매 수량 / 총 판매수량</span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<span class="icon"><i class="fa fa-eye"></i></span>
										<p>
											<span class="number">${siteStatics.yesterdaySellPrice}원 / ${siteStatics.totalSellPrice}원 </span>
											<span class="title">어제 하루 매출/ 총 매출</span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<span class="icon"><i class="fa fa-bar-chart"></i></span>
										<p>
											<span class="number">${siteStatics.comparedToPreviousMonth}</span>
											<span class="title">전월 대비 매출추이</span>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- END OVERVIEW -->
					<!-- MULTI CHARTS -->
					<div class="row">
						<div class="col-md-6">
							<div class="panel panel-headline">
								<div class="panel-heading">
									<h3 class="panel-title">연령대별 회원수</h3>
								</div>								
								<div class="panel-body">
									<div id=headline-chart class="ct-chart"></div>
								</div>
							</div>
						</div>
						<!-- END MULTI CHARTS -->
						<!-- RECENT PURCHASES -->
						<div class="col-md-6">
							<div class="panel panel-headline">
								<div class="panel-heading">
									<h3 class="panel-title">매출 추이</h3>
								</div>
								<div class="row">
									<div class="col-md-9">
										<div id="visits-trends-chart" class="ct-chart"></div>
									</div>
									<div class="col-md-2">
										<div class="weekly-summary text-right">
											<span class="number"></span><br>
											<span class="percentage"><i class="fa fa-caret-up text-success"></i> ${sellStatics.thisMonth}</span>
											<span class="info-label">금월 총 거래금액</span>
										</div>
									</div>
									<div class="col-md-2">
										<div class="weekly-summary text-right">
											<span class="number"></span><br>
											<span class="percentage"><i class="fa fa-caret-up text-success"></i> ${sellStatics.month1}</span>
											<span class="info-label">전월 총 거래금액</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- END RECENT PURCHASES -->
						<!-- REALTIME CHART -->
					</div>
					<!-- END REALTIME CHART -->
				</div>
			</div>
		</div>
	</div>
	<!-- END MAIN -->
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="assets/scripts/klorofil-common.js"></script>
<script>
$(function() {
	
	var data, options;

	// headline charts
	data = {
		labels: ['10대','20대', '30대', '40대', '50대', '60대~', ],
		series: [
			[${ageStatics.teen}, ${ageStatics.twenty}, ${ageStatics.thirty}, ${ageStatics.fourty}, ${ageStatics.fifty}, ${ageStatics.another} ]
		]
	};

	options = {
		height: 270,
		showArea: true,
		showLine: false,
		showPoint: false,
		fullWidth: true,
		axisX: {
			showGrid: false
		},
		lineSmooth: false,
	};

	new Chartist.Line('#headline-chart', data, options);

	// visits trend charts
	data = {
		labels: [ month(${sellStatics.thisMonthName-11}) 
				, month(${sellStatics.thisMonthName-10})
				, month(${sellStatics.thisMonthName-9})
				, month(${sellStatics.thisMonthName-8})
				, month(${sellStatics.thisMonthName-7})
				, month(${sellStatics.thisMonthName-6})
				, month(${sellStatics.thisMonthName-5})
				, month(${sellStatics.thisMonthName-4})
				, month(${sellStatics.thisMonthName-3})
				, month(${sellStatics.thisMonthName-2})
				, month(${sellStatics.thisMonthName-1})
				, '${sellStatics.thisMonthName}월'],
		series: [{name: 'series-real',
				  data: [${sellStatics.month11}, ${sellStatics.month10}, ${sellStatics.month9}, ${sellStatics.month8}, ${sellStatics.month7}, ${sellStatics.month6}, ${sellStatics.month5}, ${sellStatics.month4}, ${sellStatics.month3}, ${sellStatics.month2}, ${sellStatics.month1}, ${sellStatics.thisMonth}],
				 }, 
				 {name: 'series-projection',
				  data: [${sellStatics.month11}, ${sellStatics.month10}, ${sellStatics.month9}, ${sellStatics.month8}, ${sellStatics.month7}, ${sellStatics.month6}, ${sellStatics.month5}, ${sellStatics.month4}, ${sellStatics.month3}, ${sellStatics.month2}, ${sellStatics.month1}, ${sellStatics.thisMonth}],
				}]
	};

	options = {
		fullWidth: true,
		lineSmooth: false,
		height: "310px",
		low: 0,
		high: 'auto',
		series: {
			'series-projection': {
				showArea: true,
				showPoint: false,
				showLine: false
			},
		},
		axisX: {
			showGrid: false,

		},
		axisY: {
			showGrid: false,
			onlyInteger: true,
			offset: 0,
		},
		chartPadding: {
			left: 40,
			right: 20
		}
	};

	new Chartist.Line('#visits-trends-chart', data, options);


	// visits chart
	data = {
		labels: ['1월', '2월', '3월', '4월', '5월', '6월'],
		series: [
			[6384, 6342, 5437, 2764, 3958, 5068]
		]
	};

	options = {
		height: 300,
		axisX: {
			showGrid: false
		},
	};

});

//매출 추이에서 아래 월 목록을 뿌려주는 함수
function month(data)
{
	for (var i=0; i>=-10; i--)
	{
		if (data==i)
		{
			return (12+i)+'월';
		}
	}
	return data+'월';
}
</script>
</body>

</html>
