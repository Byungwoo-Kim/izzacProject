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
			<img alt="�̹��� ��������������" src="img/editinfoimage.jpg" width="899px">
			<table title="�ʼ� ���� �Է�">
				<tr>
					<td>�̸���</td>
					<td><input type="text" name="NewEmail" placeholder="���� �̸��� ���" readonly="readonly"></td>
				</tr>
				<tr>
					<td>���� ��й�ȣ</td>
					<td><input type="password" name="Password">&nbsp��й�ȣ��
						�Է����ּ���</td>
				</tr>
				<tr>
					<td>�ű� ��й�ȣ</td>
					<td><input type="password" name="NewPassword">&nbsp��й�ȣ
						������ ���Ͻø� �ű� ��й�ȣ�� �Է����ּ���</td>
				</tr>
				<tr>
					<td>�ű� ��й�ȣ Ȯ��</td>
					<td><input type="password" name="NewPassword">&nbsp��й�ȣ��
						�� �� �� �Է����ּ���</td>
				</tr>
				<tr>
					<td>Phone_Number</td>
					<td><input type="text" name="NewPhone"
						placeholder="���� �ڵ��� ��ȣ ���">&nbsp-���� ���ڸ� �Է����ּ���</td>
				</tr>
				<tr>
					<td>Sectors</td>
					<td><select name="category">
							<option value=" ">���� ������ ���� ���</option>
							<option value="��ľ�">��ľ�</option>
							<option value="ȭ�Ѿ�">ȭ�Ѿ�</option>
							<option value="������">������</option>
							<option value="��Ʈ">��Ʈ</option>
							<option value="pc��">pc��</option>
							<option value="�ַ���">�ַ���</option>
					</select></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>