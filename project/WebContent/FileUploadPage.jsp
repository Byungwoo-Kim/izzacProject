<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body {
	font-family: '������������� Regular';
	padding-left: 25%;
}

#uploadArea {
	height: 300px;
}

#contents {
	    margin-top: 5%;
    margin-left: 5%;
	background-image: url(img/caution.png);
	background-repeat: no-repeat;
	position: absolute;
	top: 0;
	left: 0;
	width: 1200px;
	padding: 20px;
}

.cautionTable {
	width: 910px;
	height: 600px;
}

#emptySpace {
	height: 430px;
	width: 100%;
}

#top {
	color: red;
}

table, tr, td {
	font-size: xx-large;
	font-weight: bold;
}

tr {
	height: 85px;
}

.file_input_textbox {
	float: left;
	height: 80px;
	width: 460px;
}

.file_input_div {
	position: relative;
	width: 500px;
	height: 100px;
	overflow: hidden;
}

.file_input_img_btn {
	padding: 0 0 0 5px;
	height: 80px;
}

.file_input_hidden {
	font-size: 29px;
	position: absolute;
	right: 0px;
	top: 0px;
	opacity: 0;
	filter: alpha(opacity = 0);
	-ms-filter: alpha(opacity = 0);
	cursor: pointer;
}

.upload {
	background: url('image/ok.png');
	background-position: 0px 0px;
	background-repeat: no-repeat;
	width: 300px;
	height: 80px;
	border: 0px;
	cursor: pointer;
	outline: 0;
	background-repeat: no-repeat;
}

</style>
<script type="text/javascript">
	var uploadFile = $('.fileBox .uploadBtn');
	uploadFile.on('change', function() {
		if (window.FileReader) {
			var filename = $(this)[0].files[0].name;
		} else {
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}
		$(this).siblings('.fileName').val(filename);
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ParaSol�� ���� ���� ȯ���մϴ�.</title>
</head>
<body>

<c:if test="${empty sessionScope.email}">
<script type="text/javascript">
alert('�α����� �ʿ��� �����Դϴ�.');
location.href="MainContents.jsp";
</script>
</c:if>

	<div id="contents">
		<div id="emptySpace"></div>
		<table class="cautionTable">
			<tr>
				<td><h4 id="top">*�Ʒ� ���ǻ����� Ȯ���Ͻ� �� ��Ŀ� ���߾� ���ε� �Ͻñ� �ٶ��ϴ�.</h4></td>
			</tr>
			<tr>
				<td>1) ���� Ȯ���ڴ� .csv �����Դϴ�.</td>
			</tr>
			<tr>
				<td>2) �� ���� �̸��� ��¥-�޴��̸�1-�޴��̸�2-(�Ѹ���:����).. �����Դϴ�.</td>
			</tr>
			<tr>
				<td>3) ù��° ���� ������ ���� ������ ���� �������� �Է����ּ���.(2017-12-01)</td>
			</tr>
			<tr>
				<td>4) �޴� �̸� �Ʒ� ���� �Ǹŷ��� �Է��Ͻø� �˴ϴ�.</td>
			</tr>
			<tr>
				<td>5) ù ���ε�� ��Ȯ�� ������ �м��� ���� �ּ� �Ѵ� �̻��� �����͸� ����帳�ϴ�.</td>
			</tr>
			<tr>
				<td>6) ���ε尡 ������ �е��� �����Ϳ��� �����Ͻø� ����� ���͵帳�ϴ�.</td>
			</tr>
			<tr>
				<td>���������� �ٿ�޾� �����Ͻ� �� �ֽ��ϴ�.</td>
			</tr>
			<tr>
				<td><a href="Files/exam.csv">���� ���� �ٿ�ε��ϱ� </a></td>
			</tr>
			<tr>
				<td>
					<form action="UpLoadService" method="post"
						enctype="multipart/form-data">
						<input type="file" name="file" id="file"> 
						<input type="submit" id="ok" value="���� ���ε�" class="upload">
					</form>
					
				</td>
			</tr>

		</table>
	</div>





</body>
</html>