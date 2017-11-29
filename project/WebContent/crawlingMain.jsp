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

/*�⺻���� ���ִ� �¾� �̹���  */
/* @import "http://weloveiconfonts.com/api/?family=entypo"; */

/*�¾�  */
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
	/* transition: opacity 400ms ease-in; */ /*õõ�� ��Ÿ���� �ִϸ��̼�  */
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

	//�ɼ� �����ϸ� �� �ѱ��
	function psnSelect() {
		//�з�1
		var region = document.getElementById("wide_select");
		var regionName = region.options[region.selectedIndex].text;
		var city = "";

		if (regionName == '��������') {
			city = document.getElementById("city1");
		} else if (regionName == '��������') {
			city = document.getElementById("city2");
		} else if (regionName == '��󳲵�') {
			city = document.getElementById("city3");
		} else if (regionName == '���ϵ�') {
			city = document.getElementById("city4");
		} else if (regionName == '������') {
			city = document.getElementById("city5");
		} else if (regionName == '����5��') {
			city = document.getElementById("city6");
		} else if (regionName == '�︪��������') {
			city = document.getElementById("city7");
		} else if (regionName == '���󳲵�') {
			city = document.getElementById("city8");
		} else if (regionName == '����ϵ�') {
			city = document.getElementById("city9");
		} else if (regionName == '���ֵ�') {
			city = document.getElementById("city10");
		} else if (regionName == '��û����') {
			city = document.getElementById("city11");
		} else if (regionName == '��û�ϵ�') {
			city = document.getElementById("city12");
		}

		//�з�2

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
					tempVar.innerHTML = temp + "��";
					humVar.innerHTML = hum + "%";
					rainVar.innerHTML = rain + "mm";
					windVar.innerHTML = wind + "m/s";
					alert(weatherImage);
					if (weatherImage == '����') {
						imgVar.setAttribute("src", "img/sunny.png");
					} else if ((weatherImage == '��������')
							|| (weatherImage == '����� ��')) {
						imgVar.setAttribute("src", "img/sunCloud.png");
					} else if (weatherImage == '��Ǵ� ��') {
						imgVar.setAttribute("src", "img/rainSnow.png");
					} else if (weatherImage == '��') {
						imgVar.setAttribute("src", "img/rain.png");
					} else if ((weatherImage == '��������')
							|| (weatherImage == '�帲')|| (weatherImage == '����')) {
						imgVar.setAttribute("src", "img/cloud.png");
					} else if (weatherImage == '��') {
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
			if (weatherImage == '����') {
				imgVar.setAttribute("src", "img/sunny2.png");
			} else if ((weatherImage == '��������')
					|| (weatherImage == '����� ��')) {
				imgVar.setAttribute("src", "img/sunCloud2.png");
			} else if (weatherImage == '��Ǵ� ��') {
				imgVar.setAttribute("src", "img/rainSnow2.png");
			} else if (weatherImage == '��') {
				imgVar.setAttribute("src", "img/rain2.png");
			} else if ((weatherImage == '��������')
					|| (weatherImage == '�帲')|| (weatherImage == '����')) {
				imgVar.setAttribute("src", "img/cloud2.png");
			} else if (weatherImage == '��') {
				imgVar.setAttribute("src", "img/snow2.png");
			}

		})
 		imgVar.addEventListener("mouseout", function() {
			if (weatherImage == '����') {
				imgVar.setAttribute("src", "img/sunny.png");
			} else if ((weatherImage == '��������')
					|| (weatherImage == '����� ��')) {
				imgVar.setAttribute("src", "img/sunCloud.png");
			} else if (weatherImage == '��Ǵ� ��') {
				imgVar.setAttribute("src", "img/rainSnow.png");
			} else if (weatherImage == '��') {
				imgVar.setAttribute("src", "img/rain.png");
			} else if ((weatherImage == '��������')
					|| (weatherImage == '�帲')|| (weatherImage == '����')) {
				imgVar.setAttribute("src", "img/cloud.png");
			} else if (weatherImage == '��') {
				imgVar.setAttribute("src", "img/snow.png");
			}

		}) 
	}

	//���� ����Ʈ�� ���� ����Ʈ �����ϱ�
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

						<select name="test" title="��,��" id="wide_select"
							onChange="showSub(this.options[this.selectedIndex].value);">
							<option>����</option>
							<option value="1">��������</option>
							<option value="2">��������</option>
							<option value="3">��󳲵�</option>
							<option value="4">���ϵ�</option>
							<option value="5">������</option>
							<option value="6">����5��</option>
							<option value="7">�︪��������</option>
							<option value="8">���󳲵�</option>
							<option value="9">����ϵ�</option>
							<option value="10">���ֵ�</option>
							<option value="11">��û����</option>
							<option value="12">��û�ϵ�</option>
						</select> <select name="SUB1" style="display:;" id="city1"><option
								value="">��������</option>
							<option value="11D20501">����</option>
							<option value="11D20502">����</option>
							<option value="11D20402">��</option>
							<option value="11D20201">�����</option>
							<option value="11D20601">����</option>
							<option value="11D20202">�갣(�ߺ�)</option>
							<option value="11D20602">��ô</option>
							<option value="11D20401">����</option>
							<option value="11D20403">���</option>
							<option value="11D20301">�¹�</option></select> <select name="SUB2"
							style="display: none;" id="city2"><option value="">��������</option>
							<option value="11D10202">�籸</option>
							<option value="11D10501">����</option>
							<option value="11D10401">����</option>
							<option value="11D10201">����</option>
							<option value="11D10502">����</option>
							<option value="11D10101">ö��</option>
							<option value="11D10301">��õ</option>
							<option value="11D10503">��â</option>
							<option value="11D10302">ȫõ</option>
							<option value="11D10102">ȭõ</option>
							<option value="11D10402">Ⱦ��</option></select> <select name="SUB3"
							style="display: none;" id="city3"><option value="">��������</option>
							<option value="11H20403">����</option>
							<option value="11H20502">��â</option>
							<option value="11H20404">��</option>
							<option value="11H20304">����</option>
							<option value="11H20405">����</option>
							<option value="11H20302">����</option>
							<option value="11H20601">�о�</option>
							<option value="11H20201">�λ�</option>
							<option value="11H20402">��õ</option>
							<option value="11H20703">��û</option>
							<option value="11H20102">���</option>
							<option value="11H20101">���</option>
							<option value="11H20602">�Ƿ�</option>
							<option value="11H20701">����</option>
							<option value="11H20303">����</option>
							<option value="11H20604">â��</option>
							<option value="11H20301">â��</option>
							<option value="11H20401">�뿵</option>
							<option value="11H20702">�ϵ�(����)</option>
							<option value="11H20406">�ϵ�(�ؾ�)</option>
							<option value="11H20603">�Ծ�</option>
							<option value="11H20501">�Ծ�</option>
							<option value="11H20503">��õ</option></select> <select name="SUB4"
							style="display: none;" id="city4"><option value="">��������</option>
							<option value="11H10703">���</option>
							<option value="11H10202">����</option>
							<option value="11H10604">���</option>
							<option value="11H10602">����</option>
							<option value="11H10603">����</option>
							<option value="11H10601">��õ</option>
							<option value="11H10701">�뱸</option>
							<option value="11H10301">����</option>
							<option value="11H10402">��ȭ</option>
							<option value="11H10302">����</option>
							<option value="11H10605">����</option>
							<option value="11H10501">�ȵ�</option>
							<option value="11H10102">����</option>
							<option value="11H10403">����</option>
							<option value="11H10401">����</option>
							<option value="11H10702">��õ</option>
							<option value="11H10303">��õ</option>
							<option value="11H10101">����</option>
							<option value="11H10502">�Ǽ�</option>
							<option value="11H10704">û��</option>
							<option value="11H10503">û��</option>
							<option value="11H10705">ĥ��</option>
							<option value="11H10201">����</option></select> <select name="SUB5"
							style="display: none;" id="city5"><option value="">��������</option>
							<option value="11B20404">����</option>
							<option value="11B20101">��ȭ</option>
							<option value="11B20302">���</option>
							<option value="11B20608">��õ</option>
							<option value="11B20607">����</option>
							<option value="11B20702">����</option>
							<option value="11B20501">����</option>
							<option value="11B20610">����</option>
							<option value="11B20102">����</option>
							<option value="11B20502">������</option>
							<option value="11B20401">����õ</option>
							<option value="11B20305">����</option>
							<option value="11B20204">��õ</option>
							<option value="11B10101" selected="selected">����</option>
							<option value="11B20605">����</option>
							<option value="11B20601">����</option>
							<option value="11B20202">����</option>
							<option value="11B20203">�Ȼ�</option>
							<option value="11B20611">�ȼ�</option>
							<option value="11B20602">�Ⱦ�</option>
							<option value="11B20304">����</option>
							<option value="11B20503">����</option>
							<option value="11B20703">����</option>
							<option value="11B20402">��õ</option>
							<option value="11B20603">����</option>
							<option value="11B20612">����</option>
							<option value="11B20609">�ǿ�</option>
							<option value="11B20301">������</option>
							<option value="11B20701">��õ</option>
							<option value="11B20201">��õ</option>
							<option value="11B20303">����</option>
							<option value="11B20606">����</option>
							<option value="11B20403">��õ</option>
							<option value="11B20504">�ϳ�</option>
							<option value="11B20604">ȭ��</option></select> <select name="SUB6"
							style="display: none;" id="city6"><option value="">��������</option>
							<option value="11A00101">��ɵ�</option>
							<option value="11A00103">��û��</option>
							<option value="11A00102">����</option></select> <select name="SUB7"
							style="display: none;" id="city7"><option value="">��������</option>
							<option value="11E00102">����</option>
							<option value="11E00101">�︪��</option></select> <select name="SUB8"
							style="display: none;" id="city8"><option value="">��������</option>
							<option value="11F20303">����</option>
							<option value="11F20403">����</option>
							<option value="11F20602">�</option>
							<option value="11F20402">����</option>
							<option value="11F20501">����</option>
							<option value="11F20601">����</option>
							<option value="11F20503">����</option>
							<option value="11F20504">���</option>
							<option value="21F20801">����</option>
							<option value="21F20804">����</option>
							<option value="11F20404">����</option>
							<option value="11F20405">��õ</option>
							<option value="11F20603">��õ(�־�)</option>
							<option value="21F20803">�ž�</option>
							<option value="11F20401">����</option>
							<option value="21F20102">����</option>
							<option value="21F20802">����</option>
							<option value="11F20301">�ϵ�</option>
							<option value="11F20502">�强</option>
							<option value="11F20304">����</option>
							<option value="21F20201">����</option>
							<option value="21F20101">����</option>
							<option value="11F20302">�س�</option>
							<option value="21F20202">�س�(ȭ��)</option>
							<option value="11F20505">ȭ��</option>
							<option value="11F20701">��굵</option></select> <select name="SUB9"
							style="display: none;" id="city9"><option value="">��������</option>
							<option value="21F10601">��â</option>
							<option value="21F10501">����</option>
							<option value="21F10502">����</option>
							<option value="11F10401">����</option>
							<option value="11F10302">����</option>
							<option value="21F10602">�ξ�</option>
							<option value="11F10403">��â</option>
							<option value="11F10205">����</option>
							<option value="11F10202">�ͻ�</option>
							<option value="11F10402">�ӽ�</option>
							<option value="11F10301">���</option>
							<option value="11F10201">����</option>
							<option value="11F10203">����</option>
							<option value="11F10303">����</option></select> <select name="SUB10"
							style="display: none;" id="city10"><option value="">��������</option>
							<option value="11G00501">���</option>
							<option value="11G00401">������</option>
							<option value="11G00101">����</option>
							<option value="11G00302">���Ǿ�</option>
							<option value="11G00301">��������</option>
							<option value="11G00201">����</option></select> <select name="SUB11"
							style="display: none;" id="city11"><option value="">��������</option>
							<option value="11C20403">���</option>
							<option value="11C20402">����</option>
							<option value="11C20601">�ݻ�</option>
							<option value="11C20602">���</option>
							<option value="11C20103">����</option>
							<option value="11C20401">����</option>
							<option value="11C20201">����</option>
							<option value="11C20501">�ο�</option>
							<option value="11C20101">����</option>
							<option value="11C20202">��õ</option>
							<option value="11C20404">����</option>
							<option value="11C20302">�ƻ�</option>
							<option value="11C20303">����</option>
							<option value="11C20301">õ��</option>
							<option value="11C20502">û��</option>
							<option value="11C20102">�¾�</option>
							<option value="11C20104">ȫ��</option></select> <select name="SUB12"
							style="display: none;" id="city12"><option value="">��������</option>
							<option value="11C10303">����</option>
							<option value="11C10202">�ܾ�</option>
							<option value="11C10302">����</option>
							<option value="11C10402">����</option>
							<option value="11C10403">��õ</option>
							<option value="11C10103">����</option>
							<option value="11C10201">��õ</option>
							<option value="11C10304">����</option>
							<option value="11C10102">��õ</option>
							<option value="11C10305">û��</option>
							<option value="11C10301">û��</option>
							<option value="11C10401">��ǳ��</option>
							<option value="11C10101">����</option></select>

						<button onclick='psnSelect()'>onclick(�ڹٽ�ũ��Ʈ)</button>

					</form>



					<p>
						�ּ� �Է� <a href="#close">�ݱ�</a>
					</p>
				</div>
			</div>
		</h1>
		<div class="temperature entypo-light-up">
			<h2>
				<img id="weatherImage" src="img/sunny.png"> <span
					class="degree-symbol" id="tempShow">32��</span>
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
			<li class="fontawesome-leaf left"><span> ����?</span></li>
			<li class="fontawesome-tint center"><span> ����?</span></li>
			<li class="fontawesome-umbrella right"><span>�� �־������ ? </span></li>
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