<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User</title>
</head>

<body>
<H2>회원가입</H2>
<HR>
<form method="post" action="user_control.jsp?action=new">
<table>
	<tr><td>이메일</td><td><input type="email" name="email" size="10" required></td></tr>
	<tr><td>비밀번호</td><td><input type="password" name="pw" size="10" required> </td></tr>
	<tr><td>핸드폰 번호</td><td><input type="tel" name="phone" size="15" required></td></tr>
	<tr><td>업종</td><td><input type="text" name="category" size="10" required></td></tr>
	<tr><td colspan="2"><input type="submit" value="회원등록"></td></tr>
</table> 
</form>
</body>
</html> 