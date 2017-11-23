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
	<!-- jQuery UI CSS����  -->

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
		// ��� �� �ϼ� ���ϱ�
		/** ��,�� ������ �ϼ���� */
		function getTotalDate(year, month) {
			if (month == 4 || month == 6 || month == 9 || month == 11)
				return 30;
			else if (month == 2) //2���϶�
			{
				if (year % 4 == 0) // 2���̸鼭 ������ ��
					return 29;
				else
					// 2���̸鼭 ������ �ƴ� ��
					return 28
			} else
				return 31;
		}

		//�̹��� �������� ���� ���ϱ�
		function makeStartDate(month) {
			var temp_Month = now_Month; // ���������� ���� �������� �ʵ���
			var startDay = now_Day; //���ۿ��� ���� / �⺻�� : �������
			if (now_Month == month) //���� �������� ������ �Ǵ� ���� ���� ���� ����̴�.
			{
				for (; temp_Month >= 0; temp_Month--) //���۰�:���� ����, ���� : 0 
				{
					startDay--; // -1�� ����
					if (startDay < 0) //���� 0~6
					{
						startDay = 6;
					}
					//��� �ϼ���ŭ �ݺ� 
					//1���� ��� �ݺ��� ���� x
				}
				return startDay;
			}
			alert("�Է¹��� ���� ����� �ƴմϴ�.");
		}

		//�̹��� �������� ���� ���ϱ�
		function makeLastDate(month) {
			var temp_Month = now_Month; // ���������� ���� �������� �ʵ��� �ٸ������� ���� �Ű� �ִ´�.
			var lastDay = now_Day; //���ۿ����� �����ϴ� �����̴�. ���� �⺻������ ���� ������ �����Ѵ�.
			if (now_Month == month) //���� �������� ������ �Ǵ� ���� ���� ���� ����̴�.
			{
				//���� ����� ���� �� �ϼ��� ���Ѵ�. ������ ������ �޼ҵ带 ������ ���Ѵ�.
				var totalDate = getTotalDate(now_Year, now_Month);

				for (; temp_Month <= totalDate; temp_Month++) //���۰�:���� ����, ���� : ��� ��������
				{
					lastDay++; // +1�� ����
					if (totalDate > 6) //������ 0���� 6���� �ֱ� ������ 6�� �ʰ��ϸ� 0���� �ʱ�ȭ ���ش�.(�ѹ���)
					{
						startDay = 0;
					}
				}
				return startDay;
			}
			alert("�Է¹��� ���� ����� �ƴմϴ�.");
		}
		function parsingDay(day) {
			if (day == 0)
				return "��";
			else if (day == 1)
				return "��";
			else if (day == 2)
				return "ȭ";
			else if (day == 3)
				return "��";
			else if (day == 4)
				return "��";
			else if (day == 5)
				return "��";
			else if (day == 6)
				return "��";
			else
				alert("��ȿ���� ���� ���ϰ� �Դϴ�.");
		}
	</script>
	<form name="calendarFrm" id="calendarFrm" action="" method="post">
		<DIV id="content" style="width: 712px;">


			<!--��¥ �׺���̼�  -->
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
									target="_self"> <b>&lt;&lt;</b> <!-- ������ -->
								</a> <%
 	if (nowMonth > 0) {
 %> <a
									href="<c:url value='/CalendarExam2.jsp' />?year=<%=nowYear%>&amp;month=<%=nowMonth - 1%>"
									target="_self"> <b>&lt;</b> <!-- ������ -->
								</a> <%
 	} else {
 %> <b>&lt;</b> <%
 	}
 %> &nbsp;&nbsp; <%=nowYear%>�� <%=nowMonth + 1%>�� &nbsp;&nbsp; <%
 	if (nowMonth < 11) {
 %> <a
									href="<c:url value='/CalendarExam2.jsp' />?year=<%=nowYear%>&amp;month=<%=nowMonth + 1%>"
									target="_self"> <!-- ������ --> <b>&gt;</b>
								</a> <%
 	} else {
 %> <b>&gt;</b> <%
 	}
 %> <a
									href="<c:url value='/CalendarExam2.jsp' />?year=<%=nowYear + 1%>&amp;month=<%=nowMonth%>"
									target="_self"> <!-- ������ --> <b>&gt;&gt;</b>
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
								<font color="red">��</font>
							</DIV>
						</TD>
						<TD width='100px'>
							<DIV align="center">��</DIV>
						</TD>
						<TD width='100px'>
							<DIV align="center">ȭ</DIV>
						</TD>
						<TD width='100px'>
							<DIV align="center">��</DIV>
						</TD>
						<TD width='100px'>
							<DIV align="center">��</DIV>
						</TD>
						<TD width='100px'>
							<DIV align="center">��</DIV>
						</TD>
						<TD width='100px'>
							<DIV align="center">
								<font color="#529dbc">��</font>
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
							//ó�� ����� ǥ��
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

								//��� ���� 
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
							//������ ���� LOOP
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