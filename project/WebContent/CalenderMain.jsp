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

							int start = cal.get(java.util.Calendar.DAY_OF_WEEK) - 1;
							int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
							int newLine = 0;
							Calendar todayCal = Calendar.getInstance();
							SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
							int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
							//�����ϴ� ���� ����
							for (int index = 1; index < start; index++) {
								out.println("<TD >&nbsp;</TD>");
								newLine++;
							}

							for (int index = 1; index <= endDay; index++) {
								String color = "";
								//�ָ� �� ����
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

								//�޷� ĭ ������
								out.println("<TD>");
						%>
						<!-- ĭ�� ��¥�ֱ�  -->
						<font color='<%=color%>'> <%=index%>
						</font>

						<%
							//��� ���� 
								out.println("</TD>");
								newLine++;
								//�ֺ��� ĭ ������
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

			<div class="ring-left"></div>
			<div class="ring-right"></div>

		</div>
		<!-- end calendar-container -->
		<input id="left" type="button" value="��" onclick="slide(-1)">
		<input id="right" type="button" value="��" onclick="slide(1)">

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

		//�� �ѱ��
		var order = 0;
		function slide(num) {

			order += num;
			//���޷�
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
























	<a
		href='CalendarExam2.jsp?year=<%=nowYear - 1%>&amp;month=<%=nowMonth%>'
		"
		target="_self"> <b>&lt;&lt;</b> <!-- ������ -->
	</a>
	<%
		if (nowMonth > 0) {
	%>
	<a
		href="<c:url value='/CalendarExam2.jsp' />?year=<%=nowYear%>&amp;month=<%=nowMonth - 1%>"
		target="_self"> <b>&lt;</b> <!-- ������ -->
	</a>
	<%
		} else {
	%>
	<b>&lt;</b>
	<%
		}
	%>
	&nbsp;&nbsp;
	<%=nowYear%>��
	<%=nowMonth + 1%>�� &nbsp;&nbsp;
	<%
		if (nowMonth < 11) {
	%>
	<a
		href="<c:url value='CalendarExam2.jsp' />?year=<%=nowYear%>&amp;month=<%=nowMonth + 1%>"
		target="_self"> <!-- ������ --> <b>&gt;</b>
	</a>
	<%
		} else {
	%>
	<b>&gt;</b>
	<%
		}
	%>
	<a
		href="<c:url value='/CalendarExam2.jsp' />?year=<%=nowYear + 1%>&amp;month=<%=nowMonth%>"
		target="_self"> <!-- ������ --> <b>&gt;&gt;</b>
	</a><


	<a id="Previous" href="#">&lt;&lt;</a>
	<span id="CurrentMonth">January</span>
	<a id="Next" href="#">&gt;&gt;</a>
	<script type="text/javascript">
		var currentMonth = 0;
		$(function() {
			var months = [ "January", "February", "March", "April", "May",
					"June", "July", "August", "September", "October",
					"November", "December" ];

			$("#Next").click(function() {
				if (currentMonth < 11) {
					currentMonth++;
					$("#CurrentMonth").text(months[currentMonth]);
				}
			});

			$("#Previous").click(function() {
				if (currentMonth > 0) {
					currentMonth--;
					$("#CurrentMonth").text(months[currentMonth]);
				}
			});
		});
	</script>



</body>
</html>