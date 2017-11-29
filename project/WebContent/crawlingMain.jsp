<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<style type="text/css">
/* Import Icon fonts and web font */
@import "https://fonts.googleapis.com/css?family=Open+Sans:400,300,700";

/*기본으로 들어가있던 태양 이미지  */
/* @import "http://weloveiconfonts.com/api/?family=entypo"; */

/*태양  */
@import url(http://weloveiconfonts.com/api/?family=fontawesome);
/* entypo */
[class*="entypo-"]:before {
	font-family: 'entypo', sans-serif;
}

/* iconicfill */
[class*="iconicfill-"]:before {
	font-family: 'IconicFill', sans-serif;
}

/* iconicfill */
[class*="iconicfill-"]:before {
	font-family: 'IconicFill', sans-serif;
}

/* fontawesome */
[class*="fontawesome-"]:before {
	font-family: 'FontAwesome', sans-serif;
}

/* Colors declarations */
/* General styles */
.wrapper {
	width: 330px;
	height: 800px;
	margin: 10% auto;
	background-color: #1F222A;
	border-radius: 7px;
}

body {
	color: #eee;
	font-family: 'Open Sans', sans-serif;
	background-color: #E0E1E3;
}

nav {
	width: 120px;
	height: 100%;
	float: left;
	background-color: #373B46;
	border-radius: 7px;
}

nav ul li {
	width: 120px;
	height: 90px;
	float: left;
	text-align: center;
	line-height: 90px;
	background-color: #373B46;
}

nav ul li.last {
	height: 100px;
	line-height: 140px;
}

nav ul li.active {
	background-color: #4b4e57;
	border-radius: 7px 0px 0px 0px;
}

nav ul li a {
	color: #eee;
	font-size: 2.2em;
	text-decoration: none;
	transition: font-size 0.2s;
}

nav ul li a:hover {
	font-size: 2.6em;
}

section {
	height: 100%;
	box-sizing: border-box;
	padding: 0px 20px;
	float: left;
	position: relative;
	background-color: #1F222A;
	border-radius: 7px;
}

section h1 {
	/* padding: 2px 0px 35px 0px; */
	position: relative;
	font-size: 1.5em;
	border-bottom: 2px solid #4b4e57;
}

section h1 a.add {
	width: 30px;
	height: 30px;
	position: absolute;
	/* 	top: 5px; */
	right: 0px;
	color: #4b4e57;
	font-size: 1.9em;
	text-align: center;
	line-height: 30px;
	text-decoration: none;
	background-color: black;
	border-radius: 3px;
	transition: color 0.5s;
}

section h1 a.add:hover {
	color: #eee;
}

section .temperature {
	padding: 0px 0px;
	color: #3D414C;
	font-size: 2em;
	transition: color 0.5s ease;
}

section .temperature:hover {
	color: yellow;
}

section .temperature h2 {
	display: inline;
	color: #eee;
	font-weight: 300;
}

section .temperature h2 span.degree-symbol {
	display: inline-block;
	margin: 0px 15px;
	font-size: 0.6em;
	vertical-align: top;
}

section .temperature h2 span.celcius {
	display: inline-block;
	margin: 10px 0px 0px 15px;
	color: #3D414C;
	font-size: 0.3em;
	vertical-align: top;
}

section ul {
	padding: 5px;
	margin-bottom: 70px;
}

section ul li {
	display: block;
	float: left;
	margin-right: 60px;
	color: #3D414C;
	font-size: 2em;
}

section ul li:last-child {
	margin-right: 0px;
}

section ul li span {
	padding-left: 10px;
	color: #eee;
	font-size: 0.6em;
	line-height: 30px;
	vertical-align: top;
}

section .bullets {
	height: 70px;
	color: #3D414C;
	text-align: center;
}

section .bullets span {
	margin-right: 10px;
	font-size: 0.6em;
}

section .bullets span.active {
	color: #eee;
	font-size: 0.8em;
}

section a {
	color: #60646e;
	font-size: 1.2em;
	text-decoration: none;
	transition: color 0.5s;
}

section a:hover {
	color: #eee;
}

section a .external-link {
	padding-left: 5px;
	font-size: 0.6em;
	vertical-align: middle;
}

section .share {
	width: 100px;
	height: 90px;
	position: absolute;
	bottom: 20px;
	right: -10px;
	color: #eee;
	font-size: 2em;
	text-align: center;
	line-height: 90px;
	background-color: rgba(210, 58, 81, 0.9);
	transition: right 0.2s;
}

section .share:hover {
	right: -20px;
}

.widget_content {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	/*  background: rgba(0, 0, 0, 0.8); */
	opacity: 0;
	/*-webkit-transition: opacity 400ms ease-in; */
	/*-moz-transition: opacity 400ms ease-in; */
	/* transition: opacity 400ms ease-in; */ /*천천히 나타나는 애니매이션  */
	pointer-events: none;
}

.widget_content:target {
	opacity: 1;
	pointer-events: auto;
}

.widget_content>div {
	position: absolute;
	top: 25%;
	left: 60%;
	width: 30%;
	height: 20%;
	padding: 16px;
	border: 3px solid #3d414c;
	background-color: #1F222A;
	overflow: auto;
}

#weatherImage {
	width: 50px;
	height: 50px;
}

#simbol {
	font-size: 0.3em;
}

#conText {
	color: #eee
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	
	

</script>
<script language="javascript">
	var temp = "";
	var wind = "";
	var hum = "";
	var rain = "";

	//옵션 선택하면 값 넘기기
	function psnSelect() {
		//분류1
		var region = document.getElementById("wide_select");
		var regionName = region.options[region.selectedIndex].text;
		var city = "";

		if (regionName == '강원영동') {
			city = document.getElementById("city1");
		} else if (regionName == '강원영서') {
			city = document.getElementById("city2");
		} else if (regionName == '경상남도') {
			city = document.getElementById("city3");
		} else if (regionName == '경상북도') {
			city = document.getElementById("city4");
		} else if (regionName == '서울·경기') {
			city = document.getElementById("city5");
		} else if (regionName == '서해5도') {
			city = document.getElementById("city6");
		} else if (regionName == '울릉도·독도') {
			city = document.getElementById("city7");
		} else if (regionName == '전라남도') {
			city = document.getElementById("city8");
		} else if (regionName == '전라북도') {
			city = document.getElementById("city9");
		} else if (regionName == '제주도') {
			city = document.getElementById("city10");
		} else if (regionName == '충청남도') {
			city = document.getElementById("city11");
		} else if (regionName == '충청북도') {
			city = document.getElementById("city12");
		}

		//분류2

		var cityName = city.options[city.selectedIndex].text;
		var cityNum = city.options[city.selectedIndex].value;
		var h1Tag = document.getElementById("selectedCity");
		var tempVar = document.getElementById("tempShow");
		var windVar = document.getElementById("windShow");
		var humVar = document.getElementById("humShow");
		var rainVar = document.getElementById("rainShow");
		var imgVar = document.getElementById("weatherImage");

		function changeCity() {
			h1Tag.innerHTML = regionName + " " + cityName;
		}
		changeCity();

		//ajax 
		$.ajax({
			url : "CrawlingSub",
			data : "cityNum=" + cityNum,
			success : function(result) {
				var array = result.split(",");
				temp = array[0];
				hum = array[1];
				rain = array[2];
				wind = array[3];
				weatherImage = array[4];
				function show() {
					tempVar.innerHTML = temp + "℃";
					humVar.innerHTML = hum + "%";
					rainVar.innerHTML = rain + "mm";
					windVar.innerHTML = wind + "m/s";
					alert(weatherImage);
					if (weatherImage == '맑음') {
						imgVar.setAttribute("src", "img/sunny.png");
					} else if ((weatherImage == '구름조금')
							|| (weatherImage == '흐려져 비')) {
						imgVar.setAttribute("src", "img/sunCloud.png");
					} else if (weatherImage == '비또는 눈') {
						imgVar.setAttribute("src", "img/rainSnow.png");
					} else if (weatherImage == '비') {
						imgVar.setAttribute("src", "img/rain.png");
					} else if ((weatherImage == '구름많음')
							|| (weatherImage == '흐림')|| (weatherImage == '연무')) {
						imgVar.setAttribute("src", "img/cloud.png");
					} else if (weatherImage == '눈') {
						imgVar.setAttribute("src", "img/snow.png");
					}

				}
				show();
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}

		});
 		imgVar.addEventListener("mouseover", function() {
			if (weatherImage == '맑음') {
				imgVar.setAttribute("src", "img/sunny2.png");
			} else if ((weatherImage == '구름조금')
					|| (weatherImage == '흐려져 비')) {
				imgVar.setAttribute("src", "img/sunCloud2.png");
			} else if (weatherImage == '비또는 눈') {
				imgVar.setAttribute("src", "img/rainSnow2.png");
			} else if (weatherImage == '비') {
				imgVar.setAttribute("src", "img/rain2.png");
			} else if ((weatherImage == '구름많음')
					|| (weatherImage == '흐림')|| (weatherImage == '연무')) {
				imgVar.setAttribute("src", "img/cloud2.png");
			} else if (weatherImage == '눈') {
				imgVar.setAttribute("src", "img/snow2.png");
			}

		})
 		imgVar.addEventListener("mouseout", function() {
			if (weatherImage == '맑음') {
				imgVar.setAttribute("src", "img/sunny.png");
			} else if ((weatherImage == '구름조금')
					|| (weatherImage == '흐려져 비')) {
				imgVar.setAttribute("src", "img/sunCloud.png");
			} else if (weatherImage == '비또는 눈') {
				imgVar.setAttribute("src", "img/rainSnow.png");
			} else if (weatherImage == '비') {
				imgVar.setAttribute("src", "img/rain.png");
			} else if ((weatherImage == '구름많음')
					|| (weatherImage == '흐림')|| (weatherImage == '연무')) {
				imgVar.setAttribute("src", "img/cloud.png");
			} else if (weatherImage == '눈') {
				imgVar.setAttribute("src", "img/snow.png");
			}

		}) 
	}

	//상위 셀렉트로 하위 셀렉트 제어하기
	function showSub(obj) {

		f = document.forms.select_machine;

		if (obj == 1) {

			f.SUB1.style.display = "";
			f.SUB2.style.display = "none";
			f.SUB3.style.display = "none";
			f.SUB4.style.display = "none";
			f.SUB5.style.display = "none";
			f.SUB6.style.display = "none";
			f.SUB7.style.display = "none";
			f.SUB8.style.display = "none";
			f.SUB9.style.display = "none";
			f.SUB10.style.display = "none";
			f.SUB11.style.display = "none";
			f.SUB12.style.display = "none";
		} else if (obj == 2) {

			f.SUB1.style.display = "none";
			f.SUB2.style.display = "";
			f.SUB3.style.display = "none";
			f.SUB4.style.display = "none";
			f.SUB5.style.display = "none";
			f.SUB6.style.display = "none";
			f.SUB7.style.display = "none";
			f.SUB8.style.display = "none";
			f.SUB9.style.display = "none";
			f.SUB10.style.display = "none";
			f.SUB11.style.display = "none";
			f.SUB12.style.display = "none";

		} else if (obj == 3) {

			f.SUB1.style.display = "none";
			f.SUB2.style.display = "none";
			f.SUB3.style.display = "";
			f.SUB4.style.display = "none";
			f.SUB5.style.display = "none";
			f.SUB6.style.display = "none";
			f.SUB7.style.display = "none";
			f.SUB8.style.display = "none";
			f.SUB9.style.display = "none";
			f.SUB10.style.display = "none";
			f.SUB11.style.display = "none";
			f.SUB12.style.display = "none";

		} else if (obj == 4) {

			f.SUB1.style.display = "none";
			f.SUB2.style.display = "none";
			f.SUB3.style.display = "none";
			f.SUB4.style.display = "";
			f.SUB5.style.display = "none";
			f.SUB6.style.display = "none";
			f.SUB7.style.display = "none";
			f.SUB8.style.display = "none";
			f.SUB9.style.display = "none";
			f.SUB10.style.display = "none";
			f.SUB11.style.display = "none";
			f.SUB12.style.display = "none";

		} else if (obj == 5) {

			f.SUB1.style.display = "none";
			f.SUB2.style.display = "none";
			f.SUB3.style.display = "none";
			f.SUB4.style.display = "none";
			f.SUB5.style.display = "";
			f.SUB6.style.display = "none";
			f.SUB7.style.display = "none";
			f.SUB8.style.display = "none";
			f.SUB9.style.display = "none";
			f.SUB10.style.display = "none";
			f.SUB11.style.display = "none";
			f.SUB12.style.display = "none";

		} else if (obj == 6) {

			f.SUB1.style.display = "none";
			f.SUB2.style.display = "none";
			f.SUB3.style.display = "none";
			f.SUB4.style.display = "none";
			f.SUB5.style.display = "none";
			f.SUB6.style.display = "";
			f.SUB7.style.display = "none";
			f.SUB8.style.display = "none";
			f.SUB9.style.display = "none";
			f.SUB10.style.display = "none";
			f.SUB11.style.display = "none";
			f.SUB12.style.display = "none";

		} else if (obj == 7) {

			f.SUB1.style.display = "none";
			f.SUB2.style.display = "none";
			f.SUB3.style.display = "none";
			f.SUB4.style.display = "none";
			f.SUB5.style.display = "none";
			f.SUB6.style.display = "none";
			f.SUB7.style.display = "";
			f.SUB8.style.display = "none";
			f.SUB9.style.display = "none";
			f.SUB10.style.display = "none";
			f.SUB11.style.display = "none";
			f.SUB12.style.display = "none";

		} else if (obj == 8) {

			f.SUB1.style.display = "none";
			f.SUB2.style.display = "none";
			f.SUB3.style.display = "none";
			f.SUB4.style.display = "none";
			f.SUB5.style.display = "none";
			f.SUB6.style.display = "none";
			f.SUB7.style.display = "none";
			f.SUB8.style.display = "";
			f.SUB9.style.display = "none";
			f.SUB10.style.display = "none";
			f.SUB11.style.display = "none";
			f.SUB12.style.display = "none";

		} else if (obj == 9) {

			f.SUB1.style.display = "none";
			f.SUB2.style.display = "none";
			f.SUB3.style.display = "none";
			f.SUB4.style.display = "none";
			f.SUB5.style.display = "none";
			f.SUB6.style.display = "none";
			f.SUB7.style.display = "none";
			f.SUB8.style.display = "none";
			f.SUB9.style.display = "";
			f.SUB10.style.display = "none";
			f.SUB11.style.display = "none";
			f.SUB12.style.display = "none";

		} else if (obj == 10) {

			f.SUB1.style.display = "none";
			f.SUB2.style.display = "none";
			f.SUB3.style.display = "none";
			f.SUB4.style.display = "none";
			f.SUB5.style.display = "none";
			f.SUB6.style.display = "none";
			f.SUB7.style.display = "none";
			f.SUB8.style.display = "none";
			f.SUB9.style.display = "none";
			f.SUB10.style.display = "";
			f.SUB11.style.display = "none";
			f.SUB12.style.display = "none";

		} else if (obj == 11) {

			f.SUB1.style.display = "none";
			f.SUB2.style.display = "none";
			f.SUB3.style.display = "none";
			f.SUB4.style.display = "none";
			f.SUB5.style.display = "none";
			f.SUB6.style.display = "none";
			f.SUB7.style.display = "none";
			f.SUB8.style.display = "none";
			f.SUB9.style.display = "none";
			f.SUB10.style.display = "none";
			f.SUB11.style.display = "";
			f.SUB12.style.display = "none";

		} else if (obj == 12) {

			f.SUB1.style.display = "none";
			f.SUB2.style.display = "none";
			f.SUB3.style.display = "none";
			f.SUB4.style.display = "none";
			f.SUB5.style.display = "none";
			f.SUB6.style.display = "none";
			f.SUB7.style.display = "none";
			f.SUB8.style.display = "none";
			f.SUB9.style.display = "none";
			f.SUB10.style.display = "none";
			f.SUB11.style.display = "none";
			f.SUB12.style.display = "";

		}

	}
</script>

</head>
<body>
	<div class="wrapper">

		<section>

		<h1 id="selectedCity">
			Los Angeles, CA <a href="#widgetOpen" class="add">+</a>
			<div class="widget_content" id="widgetOpen">
				<div>
					<form name="select_machine" action="Widget.jsp">

						<select name="test" title="시,도" id="wide_select"
							onChange="showSub(this.options[this.selectedIndex].value);">
							<option>선택</option>
							<option value="1">강원영동</option>
							<option value="2">강원영서</option>
							<option value="3">경상남도</option>
							<option value="4">경상북도</option>
							<option value="5">서울·경기</option>
							<option value="6">서해5도</option>
							<option value="7">울릉도·독도</option>
							<option value="8">전라남도</option>
							<option value="9">전라북도</option>
							<option value="10">제주도</option>
							<option value="11">충청남도</option>
							<option value="12">충청북도</option>
						</select> <select name="SUB1" style="display:;" id="city1"><option
								value="">지역선택</option>
							<option value="11D20501">강릉</option>
							<option value="11D20502">강원</option>
							<option value="11D20402">고성</option>
							<option value="11D20201">대관령</option>
							<option value="11D20601">동해</option>
							<option value="11D20202">산간(중부)</option>
							<option value="11D20602">삼척</option>
							<option value="11D20401">속초</option>
							<option value="11D20403">양양</option>
							<option value="11D20301">태백</option></select> <select name="SUB2"
							style="display: none;" id="city2"><option value="">지역선택</option>
							<option value="11D10202">양구</option>
							<option value="11D10501">영월</option>
							<option value="11D10401">원주</option>
							<option value="11D10201">인제</option>
							<option value="11D10502">정선</option>
							<option value="11D10101">철원</option>
							<option value="11D10301">춘천</option>
							<option value="11D10503">평창</option>
							<option value="11D10302">홍천</option>
							<option value="11D10102">화천</option>
							<option value="11D10402">횡성</option></select> <select name="SUB3"
							style="display: none;" id="city3"><option value="">지역선택</option>
							<option value="11H20403">거제</option>
							<option value="11H20502">거창</option>
							<option value="11H20404">고성</option>
							<option value="11H20304">김해</option>
							<option value="11H20405">남해</option>
							<option value="11H20302">마산</option>
							<option value="11H20601">밀양</option>
							<option value="11H20201">부산</option>
							<option value="11H20402">사천</option>
							<option value="11H20703">산청</option>
							<option value="11H20102">양산</option>
							<option value="11H20101">울산</option>
							<option value="11H20602">의령</option>
							<option value="11H20701">진주</option>
							<option value="11H20303">진해</option>
							<option value="11H20604">창녕</option>
							<option value="11H20301">창원</option>
							<option value="11H20401">통영</option>
							<option value="11H20702">하동(내륙)</option>
							<option value="11H20406">하동(해안)</option>
							<option value="11H20603">함안</option>
							<option value="11H20501">함양</option>
							<option value="11H20503">합천</option></select> <select name="SUB4"
							style="display: none;" id="city4"><option value="">지역선택</option>
							<option value="11H10703">경산</option>
							<option value="11H10202">경주</option>
							<option value="11H10604">고령</option>
							<option value="11H10602">구미</option>
							<option value="11H10603">군위</option>
							<option value="11H10601">김천</option>
							<option value="11H10701">대구</option>
							<option value="11H10301">문경</option>
							<option value="11H10402">봉화</option>
							<option value="11H10302">상주</option>
							<option value="11H10605">성주</option>
							<option value="11H10501">안동</option>
							<option value="11H10102">영덕</option>
							<option value="11H10403">영양</option>
							<option value="11H10401">영주</option>
							<option value="11H10702">영천</option>
							<option value="11H10303">예천</option>
							<option value="11H10101">울진</option>
							<option value="11H10502">의성</option>
							<option value="11H10704">청도</option>
							<option value="11H10503">청송</option>
							<option value="11H10705">칠곡</option>
							<option value="11H10201">포항</option></select> <select name="SUB5"
							style="display: none;" id="city5"><option value="">지역선택</option>
							<option value="11B20404">가평</option>
							<option value="11B20101">강화</option>
							<option value="11B20302">고양</option>
							<option value="11B20608">과천</option>
							<option value="11B20607">광명</option>
							<option value="11B20702">광주</option>
							<option value="11B20501">구리</option>
							<option value="11B20610">군포</option>
							<option value="11B20102">김포</option>
							<option value="11B20502">남양주</option>
							<option value="11B20401">동두천</option>
							<option value="11B20305">문산</option>
							<option value="11B20204">부천</option>
							<option value="11B10101" selected="selected">서울</option>
							<option value="11B20605">성남</option>
							<option value="11B20601">수원</option>
							<option value="11B20202">시흥</option>
							<option value="11B20203">안산</option>
							<option value="11B20611">안성</option>
							<option value="11B20602">안양</option>
							<option value="11B20304">양주</option>
							<option value="11B20503">양평</option>
							<option value="11B20703">여주</option>
							<option value="11B20402">연천</option>
							<option value="11B20603">오산</option>
							<option value="11B20612">용인</option>
							<option value="11B20609">의왕</option>
							<option value="11B20301">의정부</option>
							<option value="11B20701">이천</option>
							<option value="11B20201">인천</option>
							<option value="11B20303">파주</option>
							<option value="11B20606">평택</option>
							<option value="11B20403">포천</option>
							<option value="11B20504">하남</option>
							<option value="11B20604">화성</option></select> <select name="SUB6"
							style="display: none;" id="city6"><option value="">지역선택</option>
							<option value="11A00101">백령도</option>
							<option value="11A00103">소청도</option>
							<option value="11A00102">연평도</option></select> <select name="SUB7"
							style="display: none;" id="city7"><option value="">지역선택</option>
							<option value="11E00102">독도</option>
							<option value="11E00101">울릉도</option></select> <select name="SUB8"
							style="display: none;" id="city8"><option value="">지역선택</option>
							<option value="11F20303">강진</option>
							<option value="11F20403">고흥</option>
							<option value="11F20602">곡성</option>
							<option value="11F20402">광양</option>
							<option value="11F20501">광주</option>
							<option value="11F20601">구례</option>
							<option value="11F20503">나주</option>
							<option value="11F20504">담양</option>
							<option value="21F20801">목포</option>
							<option value="21F20804">무안</option>
							<option value="11F20404">보성</option>
							<option value="11F20405">순천</option>
							<option value="11F20603">순천(주암)</option>
							<option value="21F20803">신안</option>
							<option value="11F20401">여수</option>
							<option value="21F20102">영광</option>
							<option value="21F20802">영암</option>
							<option value="11F20301">완도</option>
							<option value="11F20502">장성</option>
							<option value="11F20304">장흥</option>
							<option value="21F20201">진도</option>
							<option value="21F20101">함평</option>
							<option value="11F20302">해남</option>
							<option value="21F20202">해남(화원)</option>
							<option value="11F20505">화순</option>
							<option value="11F20701">흑산도</option></select> <select name="SUB9"
							style="display: none;" id="city9"><option value="">지역선택</option>
							<option value="21F10601">고창</option>
							<option value="21F10501">군산</option>
							<option value="21F10502">김제</option>
							<option value="11F10401">남원</option>
							<option value="11F10302">무주</option>
							<option value="21F10602">부안</option>
							<option value="11F10403">순창</option>
							<option value="11F10205">완주</option>
							<option value="11F10202">익산</option>
							<option value="11F10402">임실</option>
							<option value="11F10301">장수</option>
							<option value="11F10201">전주</option>
							<option value="11F10203">정읍</option>
							<option value="11F10303">진안</option></select> <select name="SUB10"
							style="display: none;" id="city10"><option value="">지역선택</option>
							<option value="11G00501">고산</option>
							<option value="11G00401">서귀포</option>
							<option value="11G00101">성산</option>
							<option value="11G00302">성판악</option>
							<option value="11G00301">윗세오름</option>
							<option value="11G00201">제주</option></select> <select name="SUB11"
							style="display: none;" id="city11"><option value="">지역선택</option>
							<option value="11C20403">계룡</option>
							<option value="11C20402">공주</option>
							<option value="11C20601">금산</option>
							<option value="11C20602">논산</option>
							<option value="11C20103">당진</option>
							<option value="11C20401">대전</option>
							<option value="11C20201">보령</option>
							<option value="11C20501">부여</option>
							<option value="11C20101">서산</option>
							<option value="11C20202">서천</option>
							<option value="11C20404">세종</option>
							<option value="11C20302">아산</option>
							<option value="11C20303">예산</option>
							<option value="11C20301">천안</option>
							<option value="11C20502">청양</option>
							<option value="11C20102">태안</option>
							<option value="11C20104">홍성</option></select> <select name="SUB12"
							style="display: none;" id="city12"><option value="">지역선택</option>
							<option value="11C10303">괴산</option>
							<option value="11C10202">단양</option>
							<option value="11C10302">보은</option>
							<option value="11C10402">영동</option>
							<option value="11C10403">옥천</option>
							<option value="11C10103">음성</option>
							<option value="11C10201">제천</option>
							<option value="11C10304">증평</option>
							<option value="11C10102">진천</option>
							<option value="11C10305">청원</option>
							<option value="11C10301">청주</option>
							<option value="11C10401">추풍령</option>
							<option value="11C10101">충주</option></select>

						<button onclick='psnSelect()'>onclick(자바스크립트)</button>

					</form>



					<p>
						주소 입력 <a href="#close">닫기</a>
					</p>
				</div>
			</div>
		</h1>
		<div class="temperature entypo-light-up">
			<h2>
				<img id="weatherImage" src="img/sunny.png"> <span
					class="degree-symbol" id="tempShow">32℃</span>
				<ul id="simbol">
					<li class="fontawesome-leaf left" id="humShow"><span
						id="conText">4 mph</span></li>
					<li class="fontawesome-tint center" id="rainShow"><span
						id="conText">65%</span></li>
					<li class="fontawesome-umbrella right" id="windShow"><span
						id="conText">10%</span></li>
				</ul>
			</h2>
		</div>

		<ul>
			<li class="fontawesome-leaf left"><span> 유가?</span></li>
			<li class="fontawesome-tint center"><span> 물가?</span></li>
			<li class="fontawesome-umbrella right"><span>뭘 넣어야하지 ? </span></li>
		</ul>
		<ul>

		</ul>
		<ul>

		</ul>
		<ul>

		</ul>
		</section>

	</div>

	<div class="result"></div>

</body>
</html>