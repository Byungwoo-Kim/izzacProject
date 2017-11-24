<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
body {
	background: #ccc;
	font: 87.5%/1.5em 'Lato', sans-serif;
	margin: 0;
}

#left {
	position: absolute;
	top: 50%;
	left: 0px;
	border: 0px;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	background-color: rgba(0, 0, 0, 0.1);
}

#right {
	position: absolute;
	top: 50%;
	right: 0px;
	border: 0px;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	background-color: rgba(0, 0, 0, 0.1);
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

td {
	padding: 0;
}

.container {
	left: 50%;
	position: fixed;
	top: 50%;
	transform: translate(-50%, -50%);
}

.calendar-container {
	position: relative;
	width: 450px;
}

.calendar-container header {
	border-radius: 1em 1em 0 0;
	background: #e66b6b;
	color: #fff;
	padding: 3em 2em;
}

.day {
	font-size: 8em;
	font-weight: 900;
	line-height: 1em;
}

.month {
	font-size: 4em;
	line-height: 1em;
	text-transform: lowercase;
}

.calendar {
	background: #fff;
	border-radius: 0 0 1em 1em;
	-webkit-box-shadow: 0 2px 1px rgba(0, 0, 0, .2), 0 3px 1px #fff;
	box-shadow: 0 2px 1px rgba(0, 0, 0, .2), 0 3px 1px #fff;
	color: #555;
	display: inline-block;
	padding: 2em;
}

.calendar thead {
	color: #e66b6b;
	font-weight: 700;
	text-transform: uppercase;
}

.calendar td {
	padding: .5em 1em;
	text-align: center;
}

.calendar tbody td:hover {
	background: #cacaca;
	color: #fff;
}

.current-day {
	color: #e66b6b;
}

.prev-month, .next-month {
	color: #cacaca;
}

.ring-left, .ring-right {
	position: absolute;
	top: 230px;
}

.ring-left {
	left: 2em;
}

.ring-right {
	right: 2em;
}

.ring-left:before, .ring-left:after, .ring-right:before, .ring-right:after
	{
	background: #fff;
	border-radius: 4px;
	-webkit-box-shadow: 0 3px 1px rgba(0, 0, 0, .3), 0 -1px 1px
		rgba(0, 0, 0, .2);
	box-shadow: 0 3px 1px rgba(0, 0, 0, .3), 0 -1px 1px rgba(0, 0, 0, .2);
	content: "";
	display: inline-block;
	margin: 8px;
	height: 32px;
	width: 8px;
}
</style>
</head>
<body>

	<%
		GregorianCalendar today = new GregorianCalendar();
		int nowYear = today.get(today.YEAR);
		int nowMonth = today.get(today.MONTH);
		int nowDay = today.get(today.DAY_OF_MONTH);
		int lastDay = today.getActualMaximum(Calendar.DAY_OF_MONTH);
		String eng_month = "";
		nowYear = Integer.parseInt(request.getParameter("yearNext"));
		nowMonth = Integer.parseInt(request.getParameter("monthNext"));
		
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

							int start = Integer.parseInt(request.getParameter("startDayNext"));
							Calendar cal2 =  new GregorianCalendar(nowYear, nowMonth, 1);
							int endDay = cal2.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
							if(endDay==30){
								if(start==6){
									start=1;
								}else if(start==7){
									start=2;
								}else{
									start+=2;
								}
							}else if(endDay==31){
								if(start==5){
									start=1;
								}else if(start==6){
									start=2;
								}else if(start==7){
									start=3;
								}else{
									start+=3;
								}
							}else if(endDay==29){
								if(start==7){
									start=1;
								}else{
									start+=1;
								}
							}
							
							int newLine = 0;
							Calendar todayCal = Calendar.getInstance();
							SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
							int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
							//시작하는 요일 설정
							for (int index = 1; index < start; index++) {
								out.println("<TD >&nbsp;</TD>");
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

								//달력 칸 나누기
								out.println("<TD>");
						%>
						<!-- 칸에 날짜넣기  -->
						<font color='<%=color%>'> <%=index%>
						</font>

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
		<!-- end calendar-container -->
		<!--달력 넘기기  -->
		<%
			if (nowMonth > 0) {
		%>

		<a
			href='CalendarForChange.jsp?yearNext=<%=nowYear%>&amp;monthNext=<%=nowMonth - 1%>&amp;startDayNext=<%=start%>'
			"
		target="_self" id="left"><img src="images/left.png" width="30" height="30"></a>
		<%
			} else if (nowMonth == 0) {
		%>
		<a
			href='CalendarForChange.jsp?yearNext=<%=nowYear - 1%>&amp;monthNext=<%=11%>&amp;startDayNext=<%=start%>'
			"
		target="_self" id="left"><img src="images/left.png" width="30" height="30"> </a>
		<%
			}
		%>

		<%
			if (nowMonth < 11) {
		%>
		<a
			href='CalendarForChange.jsp?yearNext=<%=nowYear%>
		&amp;monthNext=<%=nowMonth + 1%>&amp;startDayNext=<%=start%>'
			"
		target="_self" id="right"><img src="images/right.png" width="30" height="30"></a>
		<%
			} else if (nowMonth == 11) {
		%><a
			href='CalendarForChange.jsp?yearNext=<%=nowYear + 1%>
		&amp;monthNext=<%=0%>&amp;startDayNext=<%=start%>'
			"
		target="_self" id="right"><img src="images/right.png" width="30" height="30"></a>
		<%
			}
		%>
		<!--달력 넘기기 끝  -->
	<!-- end container -->


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
			//년도 넘어가기
			if (order == -1) {
				order = imgs.length - 1;
			} else if (order == imgs.length) {
				order = 0;
			}
			imgs[order].style.display = "block";

			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		}

	</script>
	<form name="calendarFrm" id="calendarFrm" action="" method="post">

	</form>
	



</body>
</html>