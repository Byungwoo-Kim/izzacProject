<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Parasol �������Դϴ�.</title>
<style type="text/css">
*{
text-align: center;
box-sizing: border-box;

}
#wrap {
	width: 75em; height : 51.5em;
	margin:10px auto;
}

#supTD, #aa {
	height: 500px;
	width: 100%;
}
td{
font-family: �������������, serif;
font-size:25px 
}
</style>

</head>
<body>
	<div id="wrap">
		<div id="top">
			<table border="1px solid #e9ebec" cellspacing="0" width="1200em">
				<tr>
					<td><a onclick="supportClick('FAQ')" target="aa"
						href="faq.html"><img src="../images/faq.png"></a><br>FAQ</td>
					<td><a onclick="supportClick('��ȭ���')" target="aa"
						href="call.html"><img src="../images/call.png"></a><br>��ȭ���</td>
					<td><a onclick="supportClick('ī����')" target="aa"
						href="kakao.html"><img src="../images/kakao.png"></a><br>ī����</td>
					<td><a onclick="supportClick('���Ǹ���')" target="aa"
						href="sendmail.html"><img src="../images/mail.png"></a><br>���Ǹ���</td>
				</tr>
			</table>
		</div>
		<div id="bottom" id="supTD">
			<iframe name="aa" id="aa" frameborder="0" scrolling="no"></iframe>

		</div>



	</div>

</body>
</html>