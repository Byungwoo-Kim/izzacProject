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
<link rel="stylesheet"
	href="../assets/css/TodaySales/TodaySales.css?ver=2">
<title>Insert title here</title>

<c:if test="${empty email}">
	<script type="text/javascript">
		alert('�α����� �ʿ��� �����Դϴ�.');
		location.href = "../MainContents.jsp";
	</script>
</c:if>

</head>
<body>
	<%
		String sessionEmail = (String) session.getAttribute("email");

		if (sessionEmail != null) {

			MemberDAO dao = new MemberDAO();
			MemberDTO dto = dao.ForMemberUpdate(sessionEmail);

			String userEnviron = dto.getEnviron();

			DataDAO dataDAO = new DataDAO();
			String todayPre = dataDAO.SelectTodayPre(sessionEmail, userEnviron);

			if (todayPre.equals("")) {
	%>
	<img alt="XXXX" src="../img/nodata.jpg"
		style="width: 100%;">
	<%
		} else {
				String[] result = todayPre.split("/");

				request.setAttribute("itemName", result[0]);
				request.setAttribute("itemCount", result[1]);
				request.setAttribute("money", result[2]);
	%>

	<div id="wrapper">
		<!-- text������ �޴��� �Ǹŷ� -->
		<div id="text">

			<table cellspacing="0">

				<tr>
					<td>��ǰ��</td>
					<!-- ������ -->
					<c:forEach items="${itemName }" var="i">
						<td>${i }</td>

					</c:forEach>

					<td>��������</td>
				</tr>

				<!-- ���󰳼� -->
				<tr>
					<td>�����ǸŰ���</td>
					<c:forEach items="${itemCount }" var="j">
						<td>${j }</td>
					</c:forEach>

					<c:forEach items="${money }" var="k">
						<td>${k }��</td>
					</c:forEach>
				</tr>




			</table>

		</div>
		<!-- R�׷���-->
		<section id="content1"> <section id="content1left">
		<img alt="�׷����� �����ϴ�." src="barchart.jpg"></section> <section
			id="content1right"> <img alt="�׷����� �����ϴ�."
			src="piechart.jpg"></section> </section>
		<!-- <section id="content2"><img alt="�׷����� �����ϴ�." src="piechart.jpg"></section> -->

		<div id="wrapper2">
			<iframe src="ConsumerGraph.jsp" frameborder=0 framespacing=0
				marginheight=0 marginwidth=0 scrolling=no vspace=0></iframe>
		</div>
		<div id="wrapper3">
			<iframe src="OilInfo.jsp" frameborder=0 framespacing=0 marginheight=0
				marginwidth=0 scrolling=no vspace=0></iframe>
		</div>
	</div>
	<%
		}
		}
	%>
</body>
</html>

<!-- <div id="wrap" style="position: absolute; top: -500px; left: -200px;">
			<iframe
				src="http://www.index.go.kr/potal/main/EachDtlPageDetail.do?idx_cd=1060"
				width="1200px" height="860px" scrolling="no" frameborder="0"></iframe>
		</div> -->