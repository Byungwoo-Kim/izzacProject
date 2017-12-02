<%@page import="com.DAO.DataDAO"%>
<%@page import="com.DTO.MemberDTO"%>
<%@page import="com.DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="../assets/css/TodaySales/TodaySales.css?ver=1">
<title>Insert title here</title>

<c:if test="${empty sessionScope.email}">
<script type="text/javascript">
alert('로그인이 필요한 서비스입니다.');
location.href="MainContents.jsp";
</script>
</c:if>

</head>
<body>
	<div id="wrapper">
		<!-- text형식의 메뉴별 판매량 -->
		<div id="text">
		
		<%		
			String sessionEmail = (String)session.getAttribute("email");
		
			MemberDAO dao = new MemberDAO();
			MemberDTO dto = dao.ForMemberUpdate(sessionEmail);
			
			String userEnviron= dto.getEnviron();
 			
			DataDAO dataDAO = new DataDAO();
			String todayPre = dataDAO.SelectTodayPre(sessionEmail, userEnviron);
 			String[] result = todayPre.split("/");
 			
 			request.setAttribute("itemName", result[0]);
 			request.setAttribute("itemCount", result[1]);
 			
 		%>
		<table>
		<tr>
		<!-- 아이템 -->
		<c:forEach items="${itemName }" var="i">
		<td>${i }</td>
		</c:forEach>
		</tr>
		<!-- 예상개수 -->
		<tr>
		<c:forEach items="${itemCount }" var="j">
		<td>${j }</td>
		</c:forEach>
		
		</tr>
		
		
		</table>
		
		</div>
		<!-- R그래프-->
		<section id="content1"> <img alt="그래프가 없습니다." src="barchart.jpg"> </section>
		<section id="content2"><img alt="그래프가 없습니다." src="piechart.jpg"></section>

		<div id="wrapper2">
			<iframe src="ConsumerGraph.jsp" width="990px" height="460px"
				frameborder=0 framespacing=0 marginheight=0 marginwidth=0
				scrolling=no vspace=0></iframe>
			<iframe src="OilInfo.jsp" width="897px" height="310px"
				frameborder=0 framespacing=0 marginheight=0 marginwidth=0
				scrolling=no vspace=0></iframe>
			<!-- <section id="content3"> <img alt="" src=""> </section> -->
		</div>
		<div id="wrap" style="position: absolute; top: -500px; left: -200px;">
<!-- 		<iframe
			src="http://www.index.go.kr/potal/main/EachDtlPageDetail.do?idx_cd=1060"
			width="1200px" height="860px" scrolling="no" frameborder="0"></iframe> -->
	</div>
	</div>
	
</body>
</html>

<!-- <div id="wrap" style="position: absolute; top: -500px; left: -200px;">
			<iframe
				src="http://www.index.go.kr/potal/main/EachDtlPageDetail.do?idx_cd=1060"
				width="1200px" height="860px" scrolling="no" frameborder="0"></iframe>
		</div> -->