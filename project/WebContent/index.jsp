<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<!--
   Editorial by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Editorial by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="assets/css/main.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<style type="text/css">
@charset "EUC-KR";

.white_content {
	/*     position: fixed; */
	/*     top: 0;
    right: 0;
    bottom: 0;
    left: 0; */
	/* background: rgba(0, 0, 0, 0.8); */
	/*    opacity:0;
    -webkit-transition: opacity 400ms ease-in;
    -moz-transition: opacity 400ms ease-in; */
	/* transition: opacity 400ms ease-in; */
	/* pointer-events: none; */
	
}

.white_content:target {
	opacity: 1;
	pointer-events: auto;
	z-index: 100000;
}

.white_content>div {
	position: absolute;
	top: 25%;
	left: 25%;
	width: 50%;
	/*  height: 50%; */
	padding: 16px;
	/*  overflow: auto */;
}
</style>
</head>
<body>

	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="index.html" class="logo"><strong>Project</strong> by
						BBcompany</a>
					<ul class="icons">
						<li><a href="#open" class="button special fit">LOGIN</a></li>
					</ul>
				</header>
				<!-- Banner -->
				<section id="banner">


					<div class="white_content" id="open">

						<div>
							<div style="position: relative;">
								<a href='#'
									style="position: absolute; right: 10px; color: white; font-size: 25px; font-weight: bold;"
									onclick="close()">X</a>
							</div>
							<iframe width="100%" height="1000px" src='Login_Signup.html'></iframe>
						</div>
					</div>

					<script type="text/javascript">
						function close() {
							document.querySelector("div.white_content").style.opacity = "0";
						}
					</script>

					<div class="content">
						<header>
							<span class="image object"> <img src="images/logo.jpg"
								alt="" />
							</span>
							<h1>Parameter Solution</h1>
							<p>A free and fully responsive site template</p>
						</header>
						<p>Aenean ornare velit lacus, ac varius enim ullamcorper eu.
							Proin aliquam facilisis ante interdum congue. Integer mollis,
							nisl amet convallis, porttitor magna ullamcorper, amet egestas
							mauris. Ut magna finibus nisi nec lacinia. Nam maximus erat id
							euismod egesta""s. Pellentesque sapien ac quam. Lorem ipsum dolor
							sit nullam.</p>
					</div>
					<span class="image object"> <img src="images/MainImage.jpg"
						alt="" />
					</span>
				</section>

			</div>
		</div>
		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">
				<!-- Search -->
				<section id="search" class="alt">������ �ð� ���� ���� ���� ���ױⰣ</section>
				<!-- Menu -->

				<nav id="menu">
				<iframe width="300" height="600" src='Widget.jsp' name="test" scrolling="no"></iframe>

				
				
				
					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul>
						<li><a href="index.html">���� �Ұ�(��Ʈ ���߿� ����)</a></li>
						<li><span class="opener">�� ����</span>
							<ul>
								<li><a href="#">ĳ�� ����</a></li>
								<li><a href="#">�� ���� ����</a></li>
							</ul></li>
						<li><span class="opener">���� �м�</span>
							<ul>
								<li><a href="#">������ ����</a></li>
								<li><a href="HistoryPage.jsp">������ ����</a></li>
							</ul></li>
						<li><a href="Board.html">�Խ���</a></li>
						<li><a href="Support/Support.jsp">�� ����</a></li>

					</ul>
				</nav>
				<!-- Section -->

				<!-- Section -->
				<section>
					<a href="#"><img src="images/Banner.jpg" alt="" id="ban"></a>
					<!-- ȸ���������� ��� -->
					<ul class="contact">
						<li class="fa-envelope-o"><a href="#">smhrd@smhrd.co.kr</a></li>
						<li class="fa-phone">(123) 456-7890</li>
						<li class="fa-home">���� ���� �۾Ϸ� 60 ����CGI����<br> ������� 2��
							����Ʈ�̵����ȸ
						</li>
					</ul>
				</section>
				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">&copy; i¦ ������Ʈ ȫ���� �躴�� ������ ���ټ�</p>
				</footer>
			</div>
		</div>
	</div>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>
</body>
</html>
