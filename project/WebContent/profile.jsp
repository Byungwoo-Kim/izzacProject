<%@page import="com.DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style type="text/css">
* {
	/* border: 1px solid black; */
	
}

#profilewrap {
	width: 24.5em;
	height: 9em;
	/* border: 1px solid #ed9357; */
	box-sizing: border-box;
	/* border-radius: 0px 15px 0px 15px; */
}

#profiletop {
	height: 50%;
	width: 100%;
	/* line-height: 150px; */
}

#profiletop {
	height: 50%;
	width: 100%;
	/* 	line-height: 65px; */
}

#profilebottom {
	height: 50%;
	width: 100%;
	text-align: center;
}

#profileid {
	font-family: "Bebas Neue", serif;
	font-size: 59px;
	color: #008bac;
	margin-right: 100px;
}

#profileid2 {
	font-family: "Bebas Neue", serif;
	font-size: 59px;
	color: #008bac;
	margin-right: 120px;
}

#profilehi {
	font-family: "Caviar Dreams", serif;
	font-size: 30px;
	color: #58585a;
	font-weight: bold;
}

#profilehi2 {
	font-family: 나눔바른펜, serif;
	font-size: 25px;
	color: 58585a;
	font-weight: bold;
	line-height: 40px;
}

img {
	padding-left: 23.5%;
	float: left;
	height: 70px;
	width: 80px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<%
		String sessionEmail = (String) session.getAttribute("email");
		MemberDAO dao = new MemberDAO();
		String payDate = dao.SelectPayDate(sessionEmail);

		request.setAttribute("payDate", payDate);
	%>

	<div id="profilewrap">
		<!-- <div id="profileleft">
			<img src="images/logo.jpg" alt="이미지오류" width="180px" height="150px">
		</div> -->
		<!-- 노로그인 -->
		<c:choose>
			<c:when test="${empty email }">
				<div id="profiletop">
					<img src="images/profilenew.jpg" alt="띠용"> <span
						id="profileid">GUEST</span>
				</div>
				<div id="profilebottom">
					<span id="profilehi">Nice To Meet You,<br> I Hope Your
						Life Is Happy
					</span>
				</div>
			</c:when>
			<c:otherwise>
				<%
					String[] emailSplit = sessionEmail.split("@");

							request.setAttribute("emailSplit", emailSplit[0]);
				%>
				<div id="profiletop">
				<img src="images/profileboo.jpg" alt="띠용"> 
					<span id="profileid2">${emailSplit }</span>
				</div>
				<div id="profilebottom">
					<span id="profilehi2">서비스 만료일자<br>${payDate}</span>
				</div>

			</c:otherwise>
		</c:choose>
		<!-- 로그인 했을때 -->
	</div>
</body>
</html>