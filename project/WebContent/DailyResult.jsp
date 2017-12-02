<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.outLine {
	height: 600px;
	width: 610px;
	background-color: #eff1f2;
	border-radius: 3em;
}

table, tr, td {
	text-align: center;
	width: 600px;
	font-size: large;
}

td {
	height: 50px;
}

.void {
	height: 30px;
}

.rank {
	color: gray;
}

.title {
	font-size: xx-large;
	color: orange;
}

#result {
	color: red;
}

h1 {
	font-size: xx-large;
}
</style>
</head>
<body>
	<div class="outLine">
		<table>
			<tr>
				<td colspan="3" class="title">예측 판매량</td>
				<td colspan="3" class="title">실제 판매량</td>
			</tr>
			<tr>
				<td class="rank">1.</td>
				<td>Iced Americano</td>
				<td>87</td>
				<td class="rank">1.</td>
				<td>Iced Americano</td>
				<td>79</td>
			</tr>
			<tr>
				<td class="rank">2.</td>
				<td>Iced Vanilla Latte</td>
				<td>54</td>
				<td class="rank">2.</td>
				<td>Hot Chocolate</td>
				<td>43</td>
			</tr>
			<tr>
				<td class="rank">3.</td>
				<td>Espresso</td>
				<td>45</td>
				<td class="rank">3.</td>
				<td>Iced Vanilla Latte</td>
				<td>39</td>
			</tr>
			<tr>
				<td td colspan="6" class="void"></td>

			</tr>
			<tr>
				<td td colspan="3" class="title">예상 매출액</td>
				<td td colspan="3" class="title">실제 매출액</td>
			</tr>
			<tr>
				<td td colspan="3">2562500원</td>
				<td td colspan="3">2315800원</td>
			</tr>
			<tr>
				<td td colspan="6" class="void"></td>

			</tr>
			<tr>
				<td colspan="6" class="title"><h1 id="result">99%</h1></td>

			</tr>


		</table>
	</div>

	<!-- <img src = "img/BarChartExample.png"> -->
</body>
</html>