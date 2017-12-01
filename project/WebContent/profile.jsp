<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style type="text/css">
#profilewrap {
	width: 24.5em;
    height: 8.5em;
	/* border: 1px solid #ed9357; */
	box-sizing: border-box;
	text-align: center;
	/* border-radius: 0px 15px 0px 15px; */
	z-index: 2;
}

#profileleft {
	height: 100%;
	width: 50%;
	float: left;
	z-index: 1;
}

#profileright {
	height: 100%;
	width: 50%;
	float: right;
}

#profileright_top {
	height: 50%;
	width: 100%;
	line-height: 96px;
}

#profileright_bottom {
	height: 50%;
	width: 100%;
	line-height: 13px;
}

#profileid {
	font-family: "Bebas Neue", serif;
	font-size: 45px;
	color: #008bac
}

#profilehi {
	font-family: "Caviar Dreams", serif;
	font-size: 18px;
	color: #607D8B;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="profilewrap">
		<div id="profileleft">
			<img src="images/logocolor.jpg" alt="�̹�������" width="159px" height="130px">
		</div>
		<!-- ��α��� -->
		<div id="profileright">
			<div id="profileright_top">
				<span id="profileid">GUEST</span>
			</div>
			<div id="profileright_bottom">
				&nbsp<span id="profilehi">Nice To Meet You,<br> I Hope Your
					Life Is Happy
				</span>
			</div>
		</div>
		<!-- �α��� ������ -->
		<!-- <div id="profileright">
			<div id="profileright_top"><span>E-mail</span></div>
			<div id="profileright_bottom">&nbspD-35</span></div>
		</div> -->
	</div>
</body>
</html>