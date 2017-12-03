<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="sns"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
*{
border: 1px solid black
}
</style>
<title>My SNS</title>
<!-- <link rel="stylesheet" href="css/styles.css" type="text/css" media="screen" /> -->
<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" /> -->
<link rel="stylesheet" href="../assets/css/main.css?ver=1" />
<script src="http://code.jquery.com/jquery-1.9.1.js" ></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script>
	$(function() {
		$("#accordion").accordion({
			heightStyle : "content",
			active : parseInt("${curmsg == null ? 0:curmsg}")
		});
	});
</script>

<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
</head>

<body>

	<%-- <nav>
		<div class="menu">
			<ul>
				<li><a href="sns_control.jsp?action=getall">전체글보기</a>
				<li><sns:login /></li>
			</ul>
		</div>
	</nav> --%>

	<div id="wrapper">
		<section id="main">
			<section id="content">
				<b>내소식 업데이트</b>
				<form class="m_form" method="post" action="sns_control.jsp?action=newmsg">
					<input type="hidden" name="email" value="${email}">
					<sns:write type="msg"/>
					<button class="submit" type="submit">등록</button>
				</form>
				<br>
				<br>
				<h3>친구들의 최신 소식</h3>
				<div id="accordion">
					<c:forEach varStatus="mcnt" var="msgs" items="${datas}">
					<c:set var="m" value="${msgs.message}"/>
					<h3>[${m.email}]${m.msg} :: [좋아요 ${m.favcount} | 댓글 ${m.replycount}]</h3>
					<div>
						<p></p>
						<p><sns:smenu mid="${m.mid}" auid="${m.email}" curmsg="${mcnt.index}" rcnt="${m.replycount}"/>/ ${m.date}에 작성된 글입니다.</p>
						
						<ul class="reply">
						<c:forEach  var="r" items="${msgs.rlist}">
							<li>${r.email } :: ${r.rmsg} - ${r.date} <sns:rmenu curmsg="${mcnt.index}" rid="${r.rid}" ruid="${r.email}"/></li>
						</c:forEach>
						</ul>
						
						<form action="sns_control.jsp?action=newreply&cnt=${cnt}" method="post">
							<input type="hidden" name="mid" value="${m.mid}">
							<input type="hidden" name="email" value="${email}">
							<input type="hidden" name="suid" value="${suid}">
							<input type="hidden" name="curmsg" value="${mcnt.index}">				
							<sns:write type="rmsg"/>
						</form>
					</div>
					</c:forEach>
				</div>
			
				<div align="center"><a href="sns_control.jsp?action=getall&cnt=${cnt+5}&suid=${suid}">더보기&gt;&gt;</a></div>

			</section>
		</section>
	</div>

	
</body>
</html>