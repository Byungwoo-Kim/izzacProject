<%@page import="com.DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

#profileleft{
	height: 100%;
	width: 50%;
	line-height: 150px;
	float: left;
}

#profileright{
	height: 100%;
	width: 50%;
	float: right;
	padding-top: 1.5em;
}

#profileid {
	font-family: "Bebas Neue", serif;
	font-size: 48px;
	color: #008bac
}

#profileid2 {
	font-family: "Bebas Neue", serif;
	font-size: 45px;
	color: #008bac
}

#profilehi {
	font-family: "Caviar Dreams", serif;
	font-size: 22px;
	color: #607D8B;
	font-weight: bold;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<%
		String sessionEmail = (String)session.getAttribute("email");
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
					<div id="profileleft">
						<span id="profileid">GUEST</span>
					</div>
					<div id="profileright">
						&nbsp<span id="profilehi">Nice To Meet You,<br> I Hope Your
							Life Is Happy
						</span>
					</div>
			</c:when>
			<c:otherwise>
				<div id="profileright">
					<div id="profileright_top"><span id="profileid2">${sessionScope.email }</span></div>
					<div id="profileright_bottom"><span id="profilehi">서비스 만료일자 : ${payDate }</span></div>
				</div>
			</c:otherwise>
		</c:choose>
		<!-- 로그인 했을때 -->
	</div>
</body>
</html>