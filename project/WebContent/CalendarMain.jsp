<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="assets/css/CalendarStyle.css?ver=8">
<script src="./Chart.min.js"></script>

<style type="text/css">
.container {
	margin-left: 17em;
	margin-top: 20em;
	position: absolute;
	transform: translate(-50%, -50%);
}

.mySlides {
	display: none;
}

.btn-group {
	width: 10%;
	height: 70px;
	background-color: #eff1f2;
	border: none;
	display: inline;
	color: #e66b6b;
	font-weight: bold;
	height: 70px;
	background-color: #eff1f2;
	border: none;
	display: inline;
	color: #e66b6b;
}

.doughnut-legend {
			list-style: none;
			position: absolute;
			right: 8px;
			top: 0;
		}
		.doughnut-legend li {
			display: inline;
			padding-left: 30px;
			position: relative;
			margin-bottom: 4px;
			border-radius: 5px;
			padding: 2px 8px 2px 28px;
			font-size: 14px;
			cursor: default;
			-webkit-transition: background-color 200ms ease-in-out;
			-moz-transition: background-color 200ms ease-in-out;
			-o-transition: background-color 200ms ease-in-out;
			transition: background-color 200ms ease-in-out;
		}
		.doughnut-legend li:hover {
			background-color: #fafafa;
		}
		.doughnut-legend li span {
			display: inline;
			position: absolute;
			left: 0;
			top: 0;
			width: 20px;
			height: 100%;
			border-radius: 5px;
		}
		.polararea-legend {
			list-style: none;
			right: 300px;
			top: 300px;
		}
		.polararea-legend li {
			display: inline;
			padding-left: 30px;
			position: relative;
			margin-bottom: 4px;
			border-radius: 5px;
			padding: 2px 8px 2px 28px;
			font-size: 14px;
			cursor: default;
			-webkit-transition: background-color 200ms ease-in-out;
			-moz-transition: background-color 200ms ease-in-out;
			-o-transition: background-color 200ms ease-in-out;
			transition: background-color 200ms ease-in-out;
		}
		.polararea-legend li:hover {
			background-color: #fafafa;
		}
		.polararea-legend li span {
			display: inline;
			position: absolute;
			left: 0;
			top: 0;
			width: 20px;
			height: 100%;
			border-radius: 5px;
		}
		
</style>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


</head>
<body>
	<script type="text/javascript">
	//날짜 , 최신 데이터 등 바로 실행될 함수
	var lastDate = "";
	var year = "";
	var month = "";
	var date = "";
	
	opening();
 	function opening(){
		$.ajax({
			//최신 데이터 받아오기
				url : "LastDataSearching",
				success : function(result) {
					
					lastDate = result;
					var temp = lastDate.split("-");
					year = temp[0];
					month = temp[1];
					date = temp[2];
					clickTrEvent(year, month, date);
				}

			});
		
		
	} 
	
	
	
 	function setToday(){
		var todayTag = document.getElementById("dateShow");
		todayTag.innerHTML = '1';
		
	}
	 
	
	//버튼 위에 올리면 글자나오기
	function setPreviewBox(e) { 
		var e = e || window.event; 
		    document.getElementById('preview').style.left = e.clientX+ document.body.scrollLeft + 20 + 'px';  // 마우스 
		    document.getElementById('preview').style.top = e.clientY  + document.body.scrollTop + 'px';  // 포인트에 위치 
		} 
		  
		function showPreview( content) { 
		    var text; 
		        text = '<table cellpadding="5" bgcolor="#ffffff" style="font-size:9pt;color:#005F8B;filter:alpha(opacity=90); border-width:1; border-color:#3291BD; border-style:solid;">'; 
		        text += '<tr><td>' + content + '</td></tr></table>'; 
		        document.getElementById('preview').innerHTML = text; 
		        document.getElementById('preview').style.visibility = 'visible';  
		} 
		  
		function hidePreview() { 
		    document.getElementById('preview').innerHTML = ''; 
		    document.getElementById('preview').style.visibility = 'hidden'; 
		} 

	
	 var choice1menu = "";
	 var choice2menu = "";
	 var choice3menu = "";
	 var choice4menu = "";
	 var choice5menu = "";
	 var choice6menu = "";
	 var choice7menu = "";
	 var choice8menu = "";
	
	 var choice1qty = "";
	 var choice2qty = "";
	 var choice3qty = "";
	 var choice4qty = "";
	 var choice5qty = "";
	 var choice6qty = "";
	 var choice7qty = "";
	 var choice8qty = "";
	 
	 var accu1="";
	 var accu2="";
	 var accu3="";
	 var accu4="";
	 var accu5="";
	 var accu6="";
	 var accu7="";
	 var accu8="";
	 
	 var preMoney1 = "";
	 var preMoney2 = "";
	 var preMoney3 = "";
	 var preMoney4 = "";
	 var preMoney5 = "";
	 var preMoney6 = "";
	 var preMoney7 = "";
	 var preMoney8 = "";
	 
	 var analMoney = "";
	 
	 var Qtag1 = "";
		var Qtag2 = "";
		var Qtag3 = "";
		
		var Mtag1 = "";
		var Mtag2 = "";
		var Mtag3 = "";

		

	 
	//날짜 클릭이벤트
	function clickTrEvent(year, month, date) {
		var todayC =  year + "년 " + month + "월" + date + "일";
		var dateTag = document.getElementById("dateShow");
		dateTag.innerHTML = todayC;
		
		
		
	$.ajax({
			//실제 매출 가져오기
				url : "DailyRealSaleService",
				data : "year=" + year +"&month=" + month+"&date="+date,
				success : function(result) {
					
					var dailySaleMoney = result;
					var analMoneyTag = document.getElementById("analMoney");
					analMoneyTag.innerHTML = dailySaleMoney;
					test2(1);
				}

			});
	$.ajax({
		//당일 실제 판매량 검색
			url : "DailyAnalService",
			data : "year=" + year +"&month=" + month+"&date="+date,
			success : function(result) {
				if(result=="nothing"){
					alert("해당하는 날짜에 데이터가 없습니다.");}

				var menuAndQty = result.split("/");
				var itemlist = menuAndQty[0].split(",");
				var qtyList = menuAndQty[1].split(",");
				
				var item1 = itemlist[0];
				var item2 = itemlist[1];
				var item3 = itemlist[2];
				
				var qty1 = qtyList[0];
				var qty2 = qtyList[1];
				var qty3 = qtyList[2];

				
				Qtag1 = document.getElementById("realQty1");
				Qtag2 = document.getElementById("realQty2");
				Qtag3 = document.getElementById("realQty3");
				
				Mtag1 = document.getElementById("realMenu1");
				Mtag2 = document.getElementById("realMenu2");
				Mtag3 = document.getElementById("realMenu3");
				
				Qtag1.innerHTML = qty1;
				Qtag2.innerHTML = qty2;
				Qtag3.innerHTML = qty3;
				
				Mtag1.innerHTML = item1;
				Mtag2.innerHTML = item2;
				Mtag3.innerHTML = item3;
				test2(1);
			}

		});
	$.ajax({
		//당일 예상 판매량 검색
			url : "DailyResultService",
			data : "year=" + year +"&month=" + month+"&date="+date,
			success : function(result) {
			var devideChoice = result.split("^");	
			var choice1 = devideChoice[0];
			var choice2 = devideChoice[1];
			var choice3 = devideChoice[2];
			var choice4 = devideChoice[3];
			var choice5 = devideChoice[4];
			var choice6 = devideChoice[5];
			var choice7 = devideChoice[6];
			var choice8 = devideChoice[7];
			
			choice1menu = choice1.split("/")[0];
			choice2menu = choice2.split("/")[0];
			choice3menu = choice3.split("/")[0];
			choice4menu = choice4.split("/")[0];
			choice5menu = choice5.split("/")[0];
			choice6menu = choice6.split("/")[0];
			choice7menu = choice7.split("/")[0];
			choice8menu = choice8.split("/")[0];
			
			choice1qty = choice1.split("/")[1];
			choice2qty = choice2.split("/")[1];
			choice3qty = choice3.split("/")[1];
			choice4qty = choice4.split("/")[1];
			choice5qty = choice5.split("/")[1];
			choice6qty = choice6.split("/")[1];
			choice7qty = choice7.split("/")[1];
			choice8qty = choice8.split("/")[1];
			
			preMoney1 = choice1.split("/")[2];
			preMoney2 = choice2.split("/")[2];
			preMoney3 = choice3.split("/")[2];
			preMoney4 = choice4.split("/")[2];
			preMoney5 = choice5.split("/")[2];
			preMoney6 = choice6.split("/")[2];
			preMoney7 = choice7.split("/")[2];
			preMoney8 = choice8.split("/")[2];
			
			test2(1);
			}

		});
	$.ajax({
		//정확도 가져오기(accur)
			url : "DailyAccurService",
			data : "year=" + year +"&month=" + month+"&date="+date,
			success : function(result) {
				
				var AccuList = result.split(",");
				accu1 = AccuList[0];
				accu2 = AccuList[1];
				accu3 = AccuList[2];
				accu4 = AccuList[3];
				accu5 = AccuList[4];
				accu6 = AccuList[5];
				accu7 = AccuList[6];
				accu8 = AccuList[7];
				test2(1);
			}

		});
	
	
	}

	function test(number){
		var resultTag = document.getElementById("percentId");
		
		var QtyTag1 = document.getElementById("preQty1");
		var QtyTag2 = document.getElementById("preQty2");
		var QtyTag3 = document.getElementById("preQty3");
		
		var MenuTag1 = document.getElementById("preMenu1");
		var MenuTag2 = document.getElementById("preMenu2");
		var MenuTag3 = document.getElementById("preMenu3");
		
		var preMoney = document.getElementById("preMoney");
				
		var analMoney = document.getElementById("analMoney");
		
		
		
		
		
		
		if(number==1){
			var choice1menuS = choice1menu.split(",");
			var choice1qtyS = choice1qty.split(",");
			
			var choiceTemp = new Array();
			var div = new Array();
						
			QtyTag1.innerHTML = choice1qtyS[0];
			QtyTag2.innerHTML = choice1qtyS[1];
			QtyTag3.innerHTML = choice1qtyS[2];
			
			MenuTag1.innerHTML = choice1menuS[0];
			MenuTag2.innerHTML = choice1menuS[1];
			MenuTag3.innerHTML = choice1menuS[2];

			resultTag.innerHTML = accu1 + "%";
			preMoney.innerHTML = preMoney1;
			var typeTag = document.getElementById("typeShow");
			typeTag.innerHTML = "TYPE 1";
			
		}else if(number==2){
			var choice2menuS = choice2menu.split(",");
			var choice2qtyS = choice2qty.split(",");
			
			QtyTag1.innerHTML = choice2qtyS[0];
			QtyTag2.innerHTML = choice2qtyS[1];
			QtyTag3.innerHTML = choice2qtyS[2];
			
			MenuTag1.innerHTML = choice2menuS[0];
			MenuTag2.innerHTML = choice2menuS[1];
			MenuTag3.innerHTML = choice2menuS[2];
			
			//예측도 넣기
			resultTag.innerHTML = accu2 + "%";
			
			preMoney.innerHTML = preMoney2;
			
			var typeTag = document.getElementById("typeShow");
			typeTag.innerHTML = "TYPE 2";
			
		}else if(number==3){
			var choice3menuS = choice3menu.split(",");
			var choice3qtyS = choice3qty.split(",");
			
			QtyTag1.innerHTML = choice3qtyS[0];
			QtyTag2.innerHTML = choice3qtyS[1];
			QtyTag3.innerHTML = choice3qtyS[2];
			
			MenuTag1.innerHTML = choice3menuS[0];
			MenuTag2.innerHTML = choice3menuS[1];
			MenuTag3.innerHTML = choice3menuS[2];


			resultTag.innerHTML = accu3 + "%";

			preMoney.innerHTML = preMoney3;
			
			var typeTag = document.getElementById("typeShow");
			typeTag.innerHTML = "TYPE 3";
		}else if(number==4){
			var choice4menuS = choice4menu.split(",");
			var choice4qtyS = choice4qty.split(",");
			
			QtyTag1.innerHTML = choice4qtyS[0];
			QtyTag2.innerHTML = choice4qtyS[1];
			QtyTag3.innerHTML = choice4qtyS[2];
			
			MenuTag1.innerHTML = choice4menuS[0];
			MenuTag2.innerHTML = choice4menuS[1];
			MenuTag3.innerHTML = choice4menuS[2];
			
			resultTag.innerHTML = accu4 + "%";
			
			preMoney.innerHTML = preMoney4;
			
			var typeTag = document.getElementById("typeShow");
			typeTag.innerHTML = "TYPE 4";
		}else if(number==5){
			var choice5menuS = choice5menu.split(",");
			var choice5qtyS = choice5qty.split(",");
			
			QtyTag1.innerHTML = choice5qtyS[0];
			QtyTag2.innerHTML = choice5qtyS[1];
			QtyTag3.innerHTML = choice5qtyS[2];
			
			MenuTag1.innerHTML = choice5menuS[0];
			MenuTag2.innerHTML = choice5menuS[1];
			MenuTag3.innerHTML = choice5menuS[2];
			
			resultTag.innerHTML = accu5 + "%";
			
			preMoney.innerHTML = preMoney5;
			
			var typeTag = document.getElementById("typeShow");
			typeTag.innerHTML = "TYPE 5";
			
		}else if(number==6){
			var choice6menuS = choice6menu.split(",");
			var choice6qtyS = choice6qty.split(",");
			
			QtyTag1.innerHTML = choice6qtyS[0];
			QtyTag2.innerHTML = choice6qtyS[1];
			QtyTag3.innerHTML = choice6qtyS[2];
			
			MenuTag1.innerHTML = choice6menuS[0];
			MenuTag2.innerHTML = choice6menuS[1];
			MenuTag3.innerHTML = choice6menuS[2];
			
			resultTag.innerHTML = accu6 + "%";
			
			preMoney.innerHTML = preMoney6;
			
			var typeTag = document.getElementById("typeShow");
			typeTag.innerHTML = "TYPE 6";
		}else if(number==7){
			var choice7menuS = choice7menu.split(",");
			var choice7qtyS = choice7qty.split(",");
			
			QtyTag1.innerHTML = choice7qtyS[0];
			QtyTag2.innerHTML = choice7qtyS[1];
			QtyTag3.innerHTML = choice7qtyS[2];
			
			MenuTag1.innerHTML = choice7menuS[0];
			MenuTag2.innerHTML = choice7menuS[1];
			MenuTag3.innerHTML = choice7menuS[2];
			
			resultTag.innerHTML = accu7 + "%";
			
			preMoney.innerHTML = preMoney7;
			
			var typeTag = document.getElementById("typeShow");
			typeTag.innerHTML = "TYPE 7";
			
		}else if(number==8){
			var choice8menuS = choice8menu.split(",");
			var choice8qtyS = choice8qty.split(",");
			
			QtyTag1.innerHTML = choice8qtyS[0];
			QtyTag2.innerHTML = choice8qtyS[1];
			QtyTag3.innerHTML = choice8qtyS[2];
			
			MenuTag1.innerHTML = choice8menuS[0];
			MenuTag2.innerHTML = choice8menuS[1];
			MenuTag3.innerHTML = choice8menuS[2];
			
			resultTag.innerHTML = accu8 + "%";
			
			preMoney.innerHTML = preMoney8;
			
			var typeTag = document.getElementById("typeShow");
			typeTag.innerHTML = "TYPE 8";
		}
		Qtag1.innerHTML = qty1;
		Qtag2.innerHTML = qty2;
		Qtag3.innerHTML = qty3;
		
		Mtag1.innerHTML = item1;
		Mtag2.innerHTML = item2;
		Mtag3.innerHTML = item3;
	}
	function test2(number){
		var resultTag = document.getElementById("percentId");
		
		var QtyTag1 = document.getElementById("preQty1");
		var QtyTag2 = document.getElementById("preQty2");
		var QtyTag3 = document.getElementById("preQty3");
		
		var MenuTag1 = document.getElementById("preMenu1");
		var MenuTag2 = document.getElementById("preMenu2");
		var MenuTag3 = document.getElementById("preMenu3");
		
		var preMoney = document.getElementById("preMoney");
				
		var analMoney = document.getElementById("analMoney");
		
		
		if(number==1){
			var choice1menuS = choice1menu.split(",");
			var choice1qtyS = choice1qty.split(",");
						
			QtyTag1.innerHTML = choice1qtyS[0];
			QtyTag2.innerHTML = choice1qtyS[1];
			QtyTag3.innerHTML = choice1qtyS[2];
			
			MenuTag1.innerHTML = choice1menuS[0];
			MenuTag2.innerHTML = choice1menuS[1];
			MenuTag3.innerHTML = choice1menuS[2];

			resultTag.innerHTML = accu1 + "%";
			preMoney.innerHTML = preMoney1;
			var typeTag = document.getElementById("typeShow");
			typeTag.innerHTML = "TYPE 1";
			
		}
	}

</script>
	<%
		GregorianCalendar today = new GregorianCalendar();

		GregorianCalendar movedCal = new GregorianCalendar();
		int nowYear = today.get(today.YEAR);
		int nowMonth = today.get(today.MONTH);
		int nowDay = today.get(today.DAY_OF_MONTH);
		int lastDay = today.getActualMaximum(Calendar.DAY_OF_MONTH);

		if (request.getParameter("yearNext") != null) {
			nowYear = Integer.parseInt(request.getParameter("yearNext"));
			nowMonth = Integer.parseInt(request.getParameter("monthNext"));
			nowDay = Integer.parseInt(request.getParameter("startDayNext"));
			today = new GregorianCalendar(nowYear, nowMonth, nowDay);
			lastDay = today.getActualMaximum(Calendar.DAY_OF_MONTH);

			System.out.println(nowYear);
			System.out.println(nowMonth);
			System.out.println(nowDay);

		}

		String eng_month = "";
		if (nowMonth == 0) {
			eng_month = "January";
		} else if (nowMonth == 1) {
			eng_month = "Febrary";
		} else if (nowMonth == 2) {
			eng_month = "March";
		} else if (nowMonth == 3) {
			eng_month = "April";
		} else if (nowMonth == 4) {
			eng_month = "May";
		} else if (nowMonth == 5) {
			eng_month = "June";
		} else if (nowMonth == 6) {
			eng_month = "July";
		} else if (nowMonth == 7) {
			eng_month = "August";
		} else if (nowMonth == 8) {
			eng_month = "September";
		} else if (nowMonth == 9) {
			eng_month = "October";
		} else if (nowMonth == 10) {
			eng_month = "November";
		} else if (nowMonth == 11) {
			eng_month = "December";
		}
	%>
	<!-- jQuery UI CSS파일  -->

	<div class="container">

		<div class="calendar-container">

			<header>

				<div class="day"><%=nowYear%></div>
				<div class="month"><%=eng_month%></div>

			</header>

			<table class="calendar">
				<THEAD>
					<TR>
						<TD>Sun</TD>
						<TD>Mon</TD>
						<TD>Tue</TD>
						<TD>Wed</TD>
						<TD>Thu</TD>
						<TD>Fri</TD>
						<TD>Sat</TD>
					</TR>
				</THEAD>
				<TBODY>
					<TR>

						<%
							Calendar cal = Calendar.getInstance();
							int start = 6;
							if (request.getParameter("yearNext") != null) {
								cal = new GregorianCalendar(nowYear, nowMonth, 1);
								start = cal.get(java.util.Calendar.DAY_OF_WEEK);
							}
							System.out.println(cal.getTime());
							System.out.println("메인달력 시작하는 인덱스 :" + start);
							int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);

							int newLine = 0;
							Calendar todayCal = Calendar.getInstance();
							SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
							int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
							//시작하는 요일 설정
							for (int index = 1; index < start; index++) {
								out.println("<TD id='blank'>&nbsp;</TD>");
								newLine++;
							}

							for (int index = 1; index <= endDay; index++) {
								String color = "";
								//주말 색 변경
								if (newLine == 0) {
									color = "RED";
								} else if (newLine == 6) {
									color = "#529dbc";
								} else {
									color = "BLACK";
								} ;

								String sUseDate = Integer.toString(nowYear);
								sUseDate += Integer.toString(nowMonth + 1).length() == 1
										? "0" + Integer.toString(nowMonth + 1)
										: Integer.toString(nowMonth + 1);
								sUseDate += Integer.toString(index).length() == 1
										? "0" + Integer.toString(index)
										: Integer.toString(index);

								int iUseDate = Integer.parseInt(sUseDate);

								int month = nowMonth + 1;

								//달력 칸 나누기
								out.println("<TD>");
						%>
						<!-- 칸에 날짜넣기  -->

						<div id="dateArea"
							onclick='javascript:clickTrEvent(<%=nowYear%>,<%=month%>,<%=index%>)'>
							<font color='<%=color%>'> <%=index%>
							</font>
						</div>
						<%
							//기능 제거 
								out.println("</TD>");
								newLine++;
								//주별로 칸 내리기
								if (newLine == 7) {
									out.println("</TR>");
									if (index <= endDay) {
										out.println("<TR>");
									}
									newLine = 0;
								}
							}
							//마지막 공란 LOOP
							while (newLine > 0 && newLine < 7) {
								out.println("<TD>&nbsp;</TD>");
								newLine++;
							}
						%>
					</TR>
				</TBODY>
			</TABLE>

			<div class="ring-left"></div>
			<div class="ring-right"></div>

		</div>


		<div></div>
		<!--달력 넘기기  -->
		<!-- slide 함수에 2들어가면 해가 바뀌고 1이 넘어가면 월이 바뀐다  -->
		<%
			if (nowMonth > 0) {
		%>
		<a
			href='CalendarMain.jsp?yearNext=<%=nowYear%>&amp;monthNext=<%=nowMonth - 1%>&amp;startDayNext=<%=start%>'
			"
		target="_self" id="left"><img src="images/left.png"
			width="30" height="30"></a>

		<%
			} else if (nowMonth == 0) {
		%>
		<a
			href='CalendarMain.jsp?yearNext=<%=nowYear - 1%>&amp;monthNext=<%=11%>&amp;startDayNext=<%=start%>'
			"
		target="_self" id="left"><img src="images/left.png"
			width="30" height="30"> </a>
		<%
			}
		%>

		<%
			if (nowMonth < 11) {
		%>
		<a
			href='CalendarMain.jsp?yearNext=<%=nowYear%>
		&amp;monthNext=<%=nowMonth + 1%>&amp;startDayNext=<%=start%>'
			"
		target="_self" id="right"><img src="images/right.png"
			width="30" height="30"></a>
		<%
			} else if (nowMonth == 11) {
		%><a
			href='CalendarMain.jsp?yearNext=<%=nowYear + 1%>
		&amp;monthNext=<%=0%>&amp;startDayNext=<%=start%>'
			"
		target="_self" id="right"><img src="images/right.png"
			width="30" height="30"></a>
		<%
			}
		%>
		<!--달력 넘기기 끝  -->

	</div>
	<!-- end container -->
	<!-- 일 눌렀을때 오른쪽에 나오는 창  -->

	<div class="outLine">
		<img class="mySlides" src="img/nothing.png"> <img
			class="mySlides" src="img/dayNoData.png">
		<table class="detail" id="pictureShow">
			<tr>
				<td colspan="6" , style="width: 100;"><div id='preview'
						STYLE="BORDER-RIGHT: 1px; BORDER-TOP: 1px; Z-INDEX: 1; VISIBILITY: hidden; BORDER-LEFT: 1px; BORDER-BOTTOM: 1px; POSITION: absolute;"></div>
					<button onclick="test(1);" onMouseMove="setPreviewBox(event);"
						onMouseOver="showPreview('마우스오버시 레이어박스에 지금 내용이 나오게 됩니다1.'); return true;"
						onMouseOut="hidePreview(); return true;" onClick=""
						class="btn-group">TYPE 1</button>
					<button onclick="test(2);" onMouseMove="setPreviewBox(event);"
						onMouseOver="showPreview('마우스오버시 레이어박스에 지금 내용이 나오게 됩니다2.'); return true;"
						onMouseOut="hidePreview(); return true;" onClick=""
						class="btn-group">TYPE 2</button>
					<button onclick="test(3);" onMouseMove="setPreviewBox(event);"
						onMouseOver="showPreview('3333333.'); return true;"
						onMouseOut="hidePreview(); return true;" onClick=""
						class="btn-group">TYPE 3</button>
					<button onclick="test(4);" onMouseMove="setPreviewBox(event);"
						onMouseOver="showPreview('44444.'); return true;"
						onMouseOut="hidePreview(); return true;" onClick=""
						class="btn-group">TYPE 4</button>
					<button onclick="test(5);" onMouseMove="setPreviewBox(event);"
						onMouseOver="showPreview('55555.'); return true;"
						onMouseOut="hidePreview(); return true;" onClick=""
						class="btn-group">TYPE 5</button>
					<button onclick="test(6);" onMouseMove="setPreviewBox(event);"
						onMouseOver="showPreview('666666.'); return true;"
						onMouseOut="hidePreview(); return true;" onClick=""
						class="btn-group">TYPE 6</button>
					<button onclick="test(7);" onMouseMove="setPreviewBox(event);"
						onMouseOver="showPreview('7777771.'); return true;"
						onMouseOut="hidePreview(); return true;" onClick=""
						class="btn-group">TYPE 7</button>
					<button onclick="test(8);" onMouseMove="setPreviewBox(event);"
						onMouseOver="showPreview('88888.'); return true;"
						onMouseOut="hidePreview(); return true;" onClick=""
						class="btn-group">TYPE 8</button></td>
			</tr>
			<tr>
				<td colspan="3" id="dateShow">2017년 11월 30일</td>
				<td colspan="2">선택한 옵션</td>
				<td width="25%" id="typeShow">TYPE 1</td>
			<tr>
			<tr>
				<td class="rank">◎</td>
				<td id="preMenu1">Americano_ICE</td>
				<td id="preQty1">79</td>
				<td class="rank">◎</td>

				<td id="realMenu1">Americano_ICE</td>
				<td id="realQty1">79</td>
			</tr>
			<tr>
				<td class="rank">◎</td>
				<td id="preMenu2">Americono_HOT</td>
				<td id="preQty2">54</td>
				<td class="rank">◎</td>
				<td id="realMenu2">Americono_HOT</td>
				<td id="realQty2">43</td>
			</tr>
			<tr>
				<td class="rank">◎</td>
				<td id="preMenu3">CafeMocha</td>
				<td id="preQty3">45</td>
				<td class="rank">◎</td>
				<td id="realMenu3">CafeMocha</td>
				<td id="realQty3">39</td>
			</tr>
			<tr>
				<td td colspan="6" class="void"></td>

			</tr>
			<tr>
				<td td colspan="3" class="title">예상 매출액</td>
				<td td colspan="3" class="title">실제 매출액</td>
			</tr>
			<tr>
				<td td colspan="3" id="preMoney">2562500원</td>
				<td td colspan="3" id="analMoney">2315800원</td>
			</tr>
			<tr>
				<td td colspan="6" class="void"></td>

			</tr>
			<tr>
				<td colspan="6" class="percentClass" id="percentId">99%</td>

			</tr>


		</table>
	</div>








	<script type="text/javascript">
		// 당월 총 일수 구하기
		/** 년,월 받으면 일수계산 */
		function getTotalDate(year, month) {
			if (month == 4 || month == 6 || month == 9 || month == 11)
				return 30;
			else if (month == 2) //2월일때
			{
				if (year % 4 == 0) // 2월이면서 윤년일 때
					return 29;
				else
					// 2월이면서 윤년이 아닐 때
					return 28
			} else
				return 31;
		}

		//이번달 시작일의 요일 구하기
		function makeStartDate(month) {
			var temp_Month = now_Month; // 전역변수의 값을 변경하지 않도록
			var startDay = now_Day; //시작요일 저장 / 기본값 : 현재요일
			if (now_Month == month) //만약 시작일의 기준이 되는 달이 현재 달일 경우이다.
			{
				for (; temp_Month >= 0; temp_Month--) //시작값:현재 일자, 끝값 : 0 
				{
					startDay--; // -1씩 감소
					if (startDay < 0) //요일 0~6
					{
						startDay = 6;
					}
					//당월 일수만큼 반복 
					//1일일 경우 반복문 수행 x
				}
				return startDay;
			}
			alert("입력받은 월이 당월이 아닙니다.");
		}

		//이번달 마지막일 요일 구하기
		function makeLastDate(month) {
			var temp_Month = now_Month; // 전역변수의 값을 변경하지 않도록 다른변수에 값을 옮겨 넣는다.
			var lastDay = now_Day; //시작요일을 저장하는 변수이다. 먼저 기본값으로 현재 요일을 저장한다.
			if (now_Month == month) //만약 시작일의 기준이 되는 달이 현재 달일 경우이다.
			{
				//먼저 당월에 대한 총 일수를 구한다. 위에서 선언한 메소드를 가지고 구한다.
				var totalDate = getTotalDate(now_Year, now_Month);

				for (; temp_Month <= totalDate; temp_Month++) //시작값:현지 일자, 끝값 : 당월 마지막일
				{
					lastDay++; // +1씩 증가
					if (totalDate > 6) //요일은 0부터 6까지 있기 때문에 6을 초과하면 0으로 초기화 해준다.(한바퀴)
					{
						startDay = 0;
					}
				}
				return startDay;
			}
			alert("입력받은 월이 당월이 아닙니다.");
		}

		//달 넘기기
		var order = 0;
		function slide(num) {

			order += num;
			//전달로
			if (order == -2) {
				var tdTag = document.getElementById("blank");
				tdTag.innerHTML = 'a';

				nowMonth == 11;
				nowYear-= nowYear;

				<%-- <a
				href='CalendarForChange.jsp?yearNext=<%=nowYear%>&amp;monthNext=<%=nowMonth - 1%>&amp;startDayNext=<%=start%>'
				"
			target="_self" id="left"><img src="images/left.png"
				width="30" height="30"></a> --%>
				
				
				
				
			}/*  else if (order == imgs.length) {
				order = 0;
			}
			imgs[order].style.display = "inline";
 */
		}
	</script>
	<form name="calendarFrm" id="calendarFrm" action="" method="post">

	</form>
	<br><br>
<hr size="4px">
<br><br>

<!-- 파이그래프 -->
<div style="width: 40%">
		<canvas id="canvas" height="250px" width="350px"></canvas>
	</div>
	<br />
	<input type="button" id="btnPolar" value="view polar-area">
	<input type="button" id="btnPie" value="view pie">
	<input type="button" id="btnDoughnut" value="view doughnut">

	<script type="text/javascript">
		
		var chartData = [
				{
					value: 100,
					color:"#F7464A",
					highlight: "#FF5A5E",
					label: "Red"
				},
				{
					value: 99,
					color: "#46BFBD",
					highlight: "#5AD3D1",
					label: "Green"
				},
				{
					value: 50,
					color: "#FDB45C",
					highlight: "#FFC870",
					label: "Yellow"
				},
				{
					value: 40,
					color: "#949FB1",
					highlight: "#A8B3C5",
					label: "Grey"
				},
				{
					value: 30,
					color: "#4D5360",
					highlight: "#616774",
					label: "Dark Grey"
				}

			];

		var chart = null;
		var canvas = null;
		var ctx = null;
		var legendHolder = null;
		var helpers = Chart.helpers;
		$(function() {
			canvas = document.getElementById("canvas");
			legendHolder = document.createElement('div');
			ctx = canvas.getContext("2d");
			chart = new Chart(ctx).PolarArea(chartData, {
				scaleShowLabelBackdrop : true,
				scaleBackdropColor : "rgba(255,255,255,0.75)",
				scaleBeginAtZero : true,
				scaleBackdropPaddingY : 2,
				scaleBackdropPaddingX : 2,
				scaleShowLine : true,
				segmentShowStroke : true,
				segmentStrokeColor : "#fff",
				segmentStrokeWidth : 2,
				animationSteps : 100,
				animationEasing : "easeOutBounce",
				animateRotate : true,
				animateScale : false,
				responsive: true,
				onAnimationProgress: function() {
					console.log("onAnimationProgress");
				},
				onAnimationComplete: function() {
					console.log("onAnimationComplete");
				}
			});

			legendHolder.innerHTML = chart.generateLegend();
			helpers.each(legendHolder.firstChild.childNodes, function(legendNode, index){
				helpers.addEvent(legendNode, 'mouseover', function(){
					var activeSegment = chart.segments[index];
					activeSegment.save();
					activeSegment.fillColor = activeSegment.highlightColor;
					chart.showTooltip([activeSegment]);
					activeSegment.restore();
				});
			});
			helpers.addEvent(legendHolder.firstChild, 'mouseout', function(){
				chart.draw();
			});
			canvas.parentNode.appendChild(legendHolder.firstChild);
		});

		$("input#btnAdd").on("click", function() {
			chart.addData({
				value: randomScalingFactor(),
				color: "#B48EAD",
				highlight: "#C69CBE",
				label: "Purple"
			});
		});

		$("input#btnPolar").on("click", function() {
			chart.destroy();
			chart = new Chart(ctx).PolarArea(chartData, {
				segmentStrokeColor: "#000000",
				animation: true,
				responsive: true,
			});
		});
		
		$("input#btnPie").on("click", function() {
			chart.destroy();
			chart = new Chart(ctx).Pie(chartData, {
				animateScale: true,
				animation: true,
				responsive: true,
			});
		});

		$("input#btnDoughnut").on("click", function() {
			chart.destroy();
			chart = new Chart(ctx).Doughnut(chartData, {
				animateScale: true,
				animation: true,
				responsive: true,
			});
		});

		$("canvas").on("click", function(e) {
			var activePoints = chart.getSegmentsAtEvent(e);
			console.log(activePoints);
			for(var i in activePoints) {
				console.log(activePoints[i].value);
			}
		});

	</script>

	<!-- bar그래프 -->
<div style="width: 40%;">
		<canvas id="canvas" height="450" width="600"></canvas>
	</div>
	<script type="text/javascript">
				
		var barChart = null;
		var barChartData = {
			labels : ["January","February","March","April","May","June","July"],
			datasets : [
				{
					fillColor : "rgba(220,220,220,0.5)",
					strokeColor : "rgba(220,220,220,0.8)",
					highlightFill: "rgba(220,220,220,0.75)",
					highlightStroke: "rgba(220,220,220,1)",
					data : [1,2,3,4,5,6,7]
				},
				{
					fillColor : "rgba(151,187,205,0.5)",
					strokeColor : "rgba(151,187,205,0.8)",
					highlightFill : "rgba(151,187,205,0.75)",
					highlightStroke : "rgba(151,187,205,1)",
					data : [7,6,5,4,3,2,1]
				}
			]

		};

		$(function() {
			var ctx = document.getElementById("canvas").getContext("2d");
			barChart = new Chart(ctx).Bar(barChartData, {
				//Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
				scaleBeginAtZero : false,
				//Boolean - Whether grid lines are shown across the chart
				scaleShowGridLines : true,
				//String - Colour of the grid lines
				scaleGridLineColor : "rgba(0,0,0,0.05)",
				//Number - Width of the grid lines
				scaleGridLineWidth : 1,
				//Boolean - If there is a stroke on each bar
				barShowStroke : false,
				//Number - Pixel width of the bar stroke
				barStrokeWidth : 2,
				//Number - Spacing between each of the X value sets
				barValueSpacing : 5,
				//Number - Spacing between data sets within X values
				barDatasetSpacing : 1,
				onAnimationProgress: function() {
					console.log("onAnimationProgress");
				},
				onAnimationComplete: function() {
					console.log("onAnimationComplete");
				}
			});
		});

		$("input#btnAdd").on("click", function() {
			barChart.addData(
				[randomScalingFactor(),randomScalingFactor()], 
				months[(barChart.datasets[0].bars.length)%12]
			);
		});

		$("canvas").on("click", function(e) {
			var activeBars = barChart.getBarsAtEvent(e);
			console.log(activeBars);

			for(var i in activeBars) {
				console.log(activeBars[i].value);
			}
		});

	</script>

</body>
</html>

