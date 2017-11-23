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

				<thead>

					<tr>

						<td>Mon</td>
						<td>Tue</td>
						<td>Wed</td>
						<td>Thu</td>
						<td>Fri</td>
						<td>Sat</td>
						<td>Sun</td>

					</tr>

				</thead>

				<tbody>

					<tr>
						<td class="prev-month">29</td>
						<td class="prev-month">30</td>
						<td class="prev-month">31</td>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
					</tr>

					<tr>
						<td>5</td>
						<td>6</td>
						<td>7</td>
						<td>8</td>
						<td>9</td>
						<td>10</td>
						<td>11</td>
					</tr>

					<tr>
						<td>12</td>
						<td>13</td>
						<td>14</td>
						<td>15</td>
						<td>16</td>
						<td>17</td>
						<td class="current-day">18</td>
					</tr>

					<tr>
						<td>19</td>
						<td>20</td>
						<td>21</td>
						<td>22</td>
						<td>23</td>
						<td>24</td>
						<td>25</td>
					</tr>

					<tr>
						<td>26</td>
						<td>27</td>
						<td>28</td>
						<td>29</td>
						<td>30</td>
						<td>31</td>
						<td class="next-month">1</td>
					</tr>


				</tbody>

			</table>

			<div class="ring-left"></div>
			<div class="ring-right"></div>

		</div>
		<!-- end calendar-container -->

	</div>
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
		function parsingDay(day) {
			if (day == 0)
				return "일";
			else if (day == 1)
				return "월";
			else if (day == 2)
				return "화";
			else if (day == 3)
				return "수";
			else if (day == 4)
				return "목";
			else if (day == 5)
				return "금";
			else if (day == 6)
				return "토";
			else
				alert("유효하지 않은 요일값 입니다.");
		}
	</script>
	<form name="calendarFrm" id="calendarFrm" action="" method="post">
		<DIV id="content" style="width: 712px;">


			<!--날짜 네비게이션  -->
			<table width="100%" border="0" cellspacing="1" cellpadding="1"
				id="KOO" bgcolor="#F3F9D7" style="border: 1px solid #CED99C">

				<tr>
					<td height="60"><br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">


							<tr>
								<td align="center"><a
									href="<c:url value='/CalendarExam2.jsp' />?year=<%=nowYear - 1%>&amp;month=<%=nowMonth%>"
									target="_self"> <b>&lt;&lt;</b> <!-- 이전해 -->
								</a> <%
 	if (nowMonth > 0) {
 %> <a
									href="<c:url value='/CalendarExam2.jsp' />?year=<%=nowYear%>&amp;month=<%=nowMonth - 1%>"
									target="_self"> <b>&lt;</b> <!-- 이전달 -->
								</a> <%
 	} else {
 %> <b>&lt;</b> <%
 	}
 %> &nbsp;&nbsp; <%=nowYear%>년 <%=nowMonth + 1%>월 &nbsp;&nbsp; <%
 	if (nowMonth < 11) {
 %> <a
									href="<c:url value='/CalendarExam2.jsp' />?year=<%=nowYear%>&amp;month=<%=nowMonth + 1%>"
									target="_self"> <!-- 다음달 --> <b>&gt;</b>
								</a> <%
 	} else {
 %> <b>&gt;</b> <%
 	}
 %> <a
									href="<c:url value='/CalendarExam2.jsp' />?year=<%=nowYear + 1%>&amp;month=<%=nowMonth%>"
									target="_self"> <!-- 다음해 --> <b>&gt;&gt;</b>
								</a></td>
							</tr>
						</table></td>
				</tr>
			</table>
			<br>
			<table border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">
				<THEAD>
					<TR bgcolor="#CECECE">
						<TD width='100px'>
							<DIV align="center">
								<font color="red">일</font>
							</DIV>
						</TD>
						<TD width='100px'>
							<DIV align="center">월</DIV>
						</TD>
						<TD width='100px'>
							<DIV align="center">화</DIV>
						</TD>
						<TD width='100px'>
							<DIV align="center">수</DIV>
						</TD>
						<TD width='100px'>
							<DIV align="center">목</DIV>
						</TD>
						<TD width='100px'>
							<DIV align="center">금</DIV>
						</TD>
						<TD width='100px'>
							<DIV align="center">
								<font color="#529dbc">토</font>
							</DIV>
						</TD>
					</TR>
				</THEAD>
				<TBODY>
					<TR>
						<%
							Calendar cal = Calendar.getInstance();

							int start = cal.get(java.util.Calendar.DAY_OF_WEEK) - 1;
							int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
							int newLine = 0;
							Calendar todayCal = Calendar.getInstance();
							SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
							int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
							//처음 빈공란 표시
							for (int index = 1; index < start; index++) {
								out.println("<TD >&nbsp;</TD>");
								newLine++;
							}

							for (int index = 1; index <= endDay; index++) {
								String color = "";

								if (newLine == 0) {
									color = "RED";
								} else if (newLine == 6) {
									color = "#529dbc";
								} else {
									color = "BLACK";
								}
								;

								String sUseDate = Integer.toString(nowYear);
								sUseDate += Integer.toString(nowMonth + 1).length() == 1 ? "0" + Integer.toString(nowMonth + 1)
										: Integer.toString(nowMonth + 1);
								sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index)
										: Integer.toString(index);

								int iUseDate = Integer.parseInt(sUseDate);

								String backColor = "#EFEFEF";
								if (iUseDate == intToday) {
									backColor = "#c9c9c9";
								}
								out.println("<TD valign='top' align='left' height='92px' bgcolor='" + backColor + "' nowrap>");
						%>
						<font color='<%=color%>'> <%=index%>
						</font>

						<%
							out.println("<BR>");
								out.println(iUseDate);
								out.println("<BR>");

								//기능 제거 
								out.println("</TD>");
								newLine++;

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
		</DIV>
	</form>


</body>
</html>