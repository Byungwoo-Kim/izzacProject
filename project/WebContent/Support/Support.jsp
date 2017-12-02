<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Parasol 고객센터입니다.</title>
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
font-family: 나눔스퀘어라운드, serif;
font-size:25px 
}
table{
border: 4px solid #eeeeee
}
.bo{
background-color: #eeeeee
}
.boo{
background-color: #e9e1e1
}
</style>

</head>
<body>
	<div id="wrap">
		<div id="top">
			<table width="1200em">
				<tr>
					<td class="bo"><a onclick="supportClick('FAQ')" target="aa"
						href="faq.html"><img src="../images/faq.png"></a><br>FAQ</td>
					<td class="boo"><a onclick="supportClick('전화상담')" target="aa"
						href="call.html"><img src="../images/call.png"></a><br>전화상담</td>
					<td class="bo"><a onclick="supportClick('카톡상담')" target="aa"
						href="kakao.html"><img src="../images/kakao.png"></a><br>카톡상담</td>
					<td class="boo"><a onclick="supportClick('문의메일')" target="aa"
						href="sendmail.html"><img src="../images/mail.png"></a><br>문의메일</td>
				</tr>
			</table>
		</div>
		<div id="bottom" id="supTD">
			<iframe name="aa" id="aa" frameborder="0" scrolling="no"></iframe>

		</div>



	</div>

</body>
</html>