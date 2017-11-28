<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		function test() {
			alert("1");

			var a = 2;
			
			alert(a);

		}
	</script>

	<select id='test'>
		<option value="벨류">값</option>
		<option value="456">456</option>
	</select>
	<input type="submit" onclick="test()">
</body>
</html>