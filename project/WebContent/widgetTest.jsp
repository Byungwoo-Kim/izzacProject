<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<style type="text/css">
/* Import Icon fonts and web font */
@import "https://fonts.googleapis.com/css?family=Open+Sans:400,300,700";

@import "http://weloveiconfonts.com/api/?family=entypo";

@import url(http://weloveiconfonts.com/api/?family=fontawesome);
/* entypo */
[class*="entypo-"]:before {
	font-family: 'entypo', sans-serif;
}

/* fontawesome */
[class*="fontawesome-"]:before {
	font-family: 'FontAwesome', sans-serif;
}

/* Colors declarations */
/* General styles */
.wrapper {
	width: 600px;
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
	padding: 10px 40px;
	float: left;
	position: relative;
	background-color: #1F222A;
	border-radius: 7px;
}

section h1 {
	padding: 20px 0px 35px 0px;
	position: relative;
	font-size: 1.5em;
	border-bottom: 2px solid #4b4e57;
}

section h1 a.add {
	width: 50px;
	height: 50px;
	position: absolute;
	top: 10px;
	right: 0px;
	color: #4b4e57;
	font-size: 2.4em;
	text-align: center;
	line-height: 45px;
	text-decoration: none;
	background-color: black;
	border-radius: 3px;
	transition: color 0.5s;
}

section h1 a.add:hover {
	color: #eee;
}

section .temperature {
	padding: 40px 0px;
	color: #3D414C;
	font-size: 6em;
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
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">

		<section>

		<h1>
			Los Angeles, CA <a href="#" class="add">+</a>
		</h1>

		<div class="temperature entypo-light-up">
			<h2>
				64<span class="degree-symbol">°</span>F<span class="celcius">|
					C</span>
			</h2>
		</div>

		<ul>
			<li class="fontawesome-leaf left"><span>4 mph</span></li>
			<li class="fontawesome-tint center"><span>65%</span></li>
			<li class="fontawesome-umbrella right"><span>10%</span></li>
		</ul>
		<ul>
			<li class="fontawesome-leaf left"><span> 기름 모양 이미지 바꾸고 유가</span></li>
		</ul>
		<ul>
			<li class="fontawesome-tint center"><span>  돈모양 넣고 물가???</span></li>
		</ul>
				<ul>
			<li class="fontawesome-umbrella right"><span>뭘 넣어야하지 ? </span></li>
		</ul>
		</section>

	</div>

	<div class="result"></div>
</body>
</html>