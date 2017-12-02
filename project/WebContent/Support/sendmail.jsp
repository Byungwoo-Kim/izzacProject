<%@page import="com.DTO.MemberDTO"%>
<%@page import="com.DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../assets/css/Support.css?ver=2"/>
<style type="text/css">
* {
	box-sizing: border-box;
	font-family: 나눔스퀘어라운드, serif;
	font-size: 25px;
}
#wrap{
	margin: 10px auto;
	width: 46em;
	height: 23em;
}
</style>
</head>
<body><div id="wrap">
	<form method="post" action="../Support.do">
	<%
		if(session.getAttribute("email") != null) {
			String email = (String)session.getAttribute("email");
			MemberDAO dao = new MemberDAO();
			MemberDTO dto = dao.ForMemberUpdate(email);
			
			request.setAttribute("dto", dto);
		}
	%>
	<br><br>
	<table id="SupportTable">
		<tr>
			<td>답변받으실 연락처</td>
			<td>답변받으실 이메일</td>
		</tr>
		<tr>
			<td><input type="text" name="phoneNum" id="supportName" value="${dto.getPhone() }"/></td>
			<td><input type="text" name="sendEmail" id="supportEmail" value="${email }"/></td>
		</tr>
		<tr>
			<td colsapn="2">제목</td>
		</tr>
		<tr>
			<td colspan="2"><input type="text" name="supportTitle" id="supportTitle"/></td>
		</tr>
		<tr>
			<td colspan="2">질문</td>
		</tr>
		
		<tr>
			<td colspan="2"><textarea name="supportMessage" id="supportMessage" rows="4"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="right" id="supportSubmit"><input type="submit" value="문의하기" class="QNA_Button"/></td>
		</tr>
	</table>
	</form>
	</div>
</body>
</html>