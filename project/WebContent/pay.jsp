<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="assets/css/main.css" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String email = (String)session.getAttribute("email");
	
		String month = request.getParameter("month");
		String pay = request.getParameter("pay");
		
		System.out.println(month + "/" + pay);
	%>
	
	선택하신 상품 '<%= month %>' 을(를) '<%= pay %>'(으)로 결제하시겠습니까?<br>
	<button onclick="yesPay()">예</button> <button onclick="cancel()">아니오</button>
	
	<script type="text/javascript">
		function cancel() {
			alert("취소였습니다.");
			window.close();
		}
		
		function yesPay() {
			alert("감사합니다.");
			window.close();
		}
	</script>
</body>
</html>