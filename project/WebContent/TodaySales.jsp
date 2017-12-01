<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="assets/css/TodaySales/TodaySales.css?ver=1">
<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">
		<!-- text형식의 메뉴별 판매량 -->
		<div id="text">테이블 형태?</div>
		<!-- 오늘의 매출 그래프 R그래프 주소 넣으셈-->
		<section id="content1"> <img alt="" src=""> </section>
		<section id="checkbox"> <input type="checkbox"
			name="chk_info" value="풍속">풍속 <input type="checkbox"
			name="chk_info" value="유가">유가 <input type="checkbox"
			name="chk_info" value="물가"> </section>

		<div id="wrapper2">
			<section id="content2"> <img alt="" src=""> </section>
			<section id="content3"> <img alt="" src=""> </section>
		</div>
		<div id="wrap" style="position: absolute; top: -500px; left: -200px;">
		<iframe
			src="http://www.index.go.kr/potal/main/EachDtlPageDetail.do?idx_cd=1060"
			width="1200px" height="860px" scrolling="no" frameborder="0"></iframe>
	</div>
	</div>
	
</body>
</html>

<!-- <div id="wrap" style="position: absolute; top: -500px; left: -200px;">
			<iframe
				src="http://www.index.go.kr/potal/main/EachDtlPageDetail.do?idx_cd=1060"
				width="1200px" height="860px" scrolling="no" frameborder="0"></iframe>
		</div> -->