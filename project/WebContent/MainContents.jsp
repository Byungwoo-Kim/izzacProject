<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">


th, td {
	padding: 15px;
}

#top-left-div {
	padding-top: 50px;
	padding-left: 40px;
	background-image: url(mainImage/left_long.png);
	background-repeat: no-repeat;
	width: 340px;
	height: 750px;
	border-radius: 0px 15px 0px 15px;
	line-height: 50px;
}

#top-center-div {
	padding: 30px;
	width: 340px;
	height: 340px;
}

#top-right-div {
	width: 340px;
	height: 340px;
}

#bottom-left-div {
	width: 340px;
	height: 340px;
}

#bottom-right-div {
	width: 340px;
	height: 340px;
}

#middle-center-div {
	background-color: #61564B;
	width: 340px;
	height: 340px;
	border-radius: 0px 15px 0px 15px;
	border: 3px solid;
	border-bottom-color: #61564B;
	border-top-color: #61564B;
	border-left-color: #61564B;
	border-right-color: #61564B;
}

#middle-right-div {
	padding: 30px;
	width: 340px;
	height: 340px;
}

#yel {
	color: #FFC331;
	font-weight: bold;
}

.title {
	font-weight: bold;
	font-size: medium;
}
</style>
</head>
<body>


	<table class="mainTable" style="table-layout:fixed; word-break:break-all;" width="1200" height = "400" cellpadding="5" cellspacing="2" align="center" >
	
		<tr>
			<td rowspan="2">
				<div id="top-left-div">
					<h1>
						ParaSol의<br>분석 서비스는<br> 더 빠른 세상에서<Br> 보다 여유로운 삶을<br>
						생각합니다.
					</h1>
				</div>
			</td>
			<td id="top-center"><div id="top-center-div">
					<h4 class="title">프로그램 소개</h4>
					<h3>
						당신의 평생 재무 advisor<br>ParaSol
					</h3>
					<h4>ParaSol은 국내 최대 고객기반 및 지점망을 갖춘 아시아 금융을 선도하는 글로벌 종합금융그룹입니다.</h4>
				</div></td>
			<td id=top-right"><div id="top-right-div">
					<iframe width="400" height="400" src='crawlingMain.jsp' name="test"
						scrolling="no" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0></iframe>
				</div></td>
		</tr>
		<tr>
			<td><div id="middle-center-div">
					<h4 id="yel" class="title">게시판</h4>
				</div></td>
			<td><div id="middle-right-div">
					<h4 class="title">보도자료</h4>
					<h2 class="contents">스마트미디어인재개발원 2차 프로젝트에서 우수한 성적으로 입상</h2>
					<h3>Parasol(www.parasol.co.kr, 대표이사 사장 홍성은)은 4일, 광주 남구 CGI센터
						강의실에서 열린 '제 2차 프로젝트'...</h3>
					<h5>2017-12-04</h5>
				</div></td>
		</tr>
		<tr>
			<td><div id="bottom-left-div">
					<h4 class="title">팀원 소개</h4>
				</div></td>
			<td colspan="2"><div id="bottom-right-div">
					<h4 id="yel" class="title">사이트 광고영상</h4>
				</div></td>
		</tr>
	</table>
</body>
</html>