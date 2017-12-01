<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body {
	font-family: '나눔스퀘어라운드 Regular';
	padding-left: 25%;
}

#uploadArea{
height : 300px;

}


#contents {
	margin-top : 10%;	
	margin-left: 25%;
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

.fileBox .fileName {
	display: inline-block;
	width: 190px;
	height: 30px;
	padding-left: 10px;
	margin-right: 5px;
	line-height: 30px;
	border: 1px solid #aaa;
	background-color: #fff;
	vertical-align: middle
}

.fileBox .btn_file {
	display: inline-block;
	border: 1px solid #000;
	width: 100px;
	height: 30px;
	font-size: 0.8em;
	line-height: 30px;
	text-align: center;
	vertical-align: middle
}

.fileBox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0
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
<title>Insert title here</title>
</head>
<body>




	<div id = "uploadArea">
		<form action="UpLoadService" method="post"
			enctype="multipart/form-data">
			<input type="file" name="file" id="file"> <input
				type="submit" id="ok" value="파일 업로드" class="upload">
		</form>
	</div>
	
	
	
	
	<div id="contents">
		<div id="emptySpace"></div>
		<table class="cautionTable">
			<tr>
				<td><h4 id="top">*아래 유의사항을 확인하신 후 양식에 맞추어 업로드 하시기 바랍니다.</h4></td>
			</tr>
			<tr>
				<td>1) 파일 확장자는 .csv 파일입니다.</td>
			</tr>
			<tr>
				<td>2)</td>
			</tr>
			<tr>
				<td>3)</td>
			</tr>
			<tr>
				<td>4)</td>
			</tr>
			<tr>
				<td>5)</td>
			</tr>
			<tr>
				<td>6)</td>
			</tr>
			<tr>
				<td>하단의 예시파일을 참고하여 수정해주시기 바랍니다.</td>
			</tr>
			<tr>
				<td><a href="">예시 파일 다운로드하기 </a></td>
			</tr>
		</table>
	</div>



</body>
</html>