<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <link rel="stylesheet" href="assets/css/main.css" /> -->
<style type="text/css">
	#paySec{
		width: 100%;
		height: 100%;
		padding: 3%;
	}

	.payImg{
		width: 35%;
		/* height: 180px; */
		position: relative; 
		display: inline;
	}
	
	.payImg img{
		width: 35%;
		/* height: 180px; */
		position: relative;
	}
	
	#ulTag {
		width: 200px;
	}
	
	.tdImg {
		width: 250px;
		display: inline;
	}
	
	.tdImg img {
		width: 200px;
		display: inline;
		padding-bottom: 1%;
	}
	
 	table tbody td{
		background-color: transparent;
	}  
	
 	table tbody tr {
		border: 0px;	
	} 
	
	table tbody tr:nth-child(2n + 1) {
		background-color: transparent;
	}
	
	#subPayBtn {
		left: 538px;
		position: relative;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function pay(pay) {
		var payment = document.getElementsByName("payment");
		
		var month = "";
		for(var i = 0; i < payment.length; i++) {
			if(payment[i].checked) {
				month = payment[i].value;
			}
		}
		
		if(month == "") {
			alert("기간을 선택해주세요!!");
		}else {
			window.open("pay.jsp?month=" + month + "&pay=" + pay,"결제창","width=500, height=300, left=500, top=400, location=no, menubar=no");
		}
	}
</script>
</head>
<body>
	<form action="">
		<section id="paySec">
			<table>
				<tr>
					<td id="ulTag" rowspan="2">
						<input type="radio" name="payment" value="3m">3개월<br>
						<input type="radio" name="payment" value="6m">6개월<br>
						<input type="radio" name="payment" value="1y">1년<br>
						<input type="radio" name="payment" value="2y">2년<br>
					</td>
					<td class="tdImg">
						<div class="payImg">
							<img src="img/cardpay.png" onmouseover="this.src='img/cardpayHover.png'" onmouseout="this.src='img/cardpay.png'" onclick="javascript:pay('card')" border="0">
						</div>
					</td>
					<td class="tdImg">
						<div class="payImg">
							<img src="img/cellphone.png" onmouseover="this.src='img/cellphoneHover.png'" onmouseout="this.src='img/cellphone.png'" onclick="javascript:pay('phone')" border="0">
						</div>
					</td>
				</tr>
				<tr>
					<td class="tdImg">
						<div class="payImg">
							<img src="img/bankbook.png" onmouseover="this.src='img/bankbookHover.png'" onmouseout="this.src='img/bankbook.png'" onclick="javascript:pay('bank')" border="0">
						</div>
					</td>
					<td class="tdImg">
						<div class="payImg">
							<img src="img/transfer.png" onmouseover="this.src='img/transferHover.png'" onmouseout="this.src='img/transfer.png'" onclick="javascript:pay('transfer')" border="0">
						</div>
					</td>
				</tr>
			</table>
		</section>
	</form>
</body>
</html>