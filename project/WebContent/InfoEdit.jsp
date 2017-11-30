<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="assets/css/infoedit/infoedit.css?ver=1">
<title>Insert title here</title>
</head>
<body>
<div id="container">
		<div id="editinfo">
			<img alt="이미지 오류류류류뿌잉" src="img/editinfoimage.jpg" width="899px">
			<table title="필수 정보 입력">
				<tr>
					<td>이메일</td>
					<td><input type="text" name="NewEmail" placeholder="원래 이메일 출력" readonly="readonly"></td>
				</tr>
				<tr>
					<td>현재 비밀번호</td>
					<td><input type="password" name="Password">&nbsp비밀번호를
						입력해주세요</td>
				</tr>
				<tr>
					<td>신규 비밀번호</td>
					<td><input type="password" name="NewPassword">&nbsp비밀번호
						변경을 원하시면 신규 비밀번호를 입력해주세요</td>
				</tr>
				<tr>
					<td>신규 비밀번호 확인</td>
					<td><input type="password" name="NewPassword">&nbsp비밀번호를
						한 번 더 입력해주세요</td>
				</tr>
				<tr>
					<td>Phone_Number</td>
					<td><input type="text" name="NewPhone"
						placeholder="원래 핸드폰 번호 출력">&nbsp-없이 숫자만 입력해주세요</td>
				</tr>
				<tr>
					<td>Sectors</td>
					<td><select name="category">
							<option value=" ">원래 지정한 업종 출력</option>
							<option value="요식업">요식업</option>
							<option value="화훼업">화훼업</option>
							<option value="편의점">편의점</option>
							<option value="마트">마트</option>
							<option value="pc방">pc방</option>
							<option value="주류업">주류업</option>
					</select></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>