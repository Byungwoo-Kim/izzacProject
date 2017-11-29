<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Parasol 고객센터입니다.</title>
<style type="text/css">

#supTD, #aa{
height: 500px;
width: 100%;
}
</style>

</head>
<body>

<table border="1px solid black" cellspacing="0" align="center" width="1200em">

	<tr align="center">
		<td><a onclick="supportClick('FAQ')" target="aa" href="faq.html"><img src="../images/faq.png"></a><br>FAQ</td>
		<td><a onclick="supportClick('전화상담')" target="aa" href="call.html"><img src="../images/call.png"></a><br>전화상담</td>
		<td><a onclick="supportClick('카톡상담')" target="aa" href="kakao.html"><img src="../images/kakao.png"></a><br>카톡상담</td>
		<td><a onclick="supportClick('문의메일')" target="aa" href="sendmail.html"><img src="../images/mail.png"></a><br>문의메일</td>
	</tr>
<tr align="center" bordercolor="white">
		<td colspan="4" id="supTD"><iframe name="aa" id="aa" frameborder="0"  scrolling="no"></iframe></td>	
	</tr>
	
</table>
<br><br><br>
<!-- <div id="docListDiv" align="center">
	<iframe name="aa" src="about:blank" id="docList" scrolling="no" border="0" frameborder="0" style="height:600px;" width=100%></iframe>
	</div>  -->

</body>
</html>