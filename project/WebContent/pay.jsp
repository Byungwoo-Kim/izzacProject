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
	
	�����Ͻ� ��ǰ '<%= month %>' ��(��) '<%= pay %>'(��)�� �����Ͻðڽ��ϱ�?<br>
	<button onclick="yesPay()">��</button> <button onclick="cancel()">�ƴϿ�</button>
	
	<script type="text/javascript">
		function cancel() {
			alert("��ҿ����ϴ�.");
			window.close();
		}
		
		function yesPay() {
			alert("�����մϴ�.");
			window.close();
		}
	</script>
</body>
</html>