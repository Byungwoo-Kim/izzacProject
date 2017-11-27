<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	//������ ���� â ���� �ڵ带 �Լ��ȿ� ����־��
	function clickTrEvent(trObj) {
		alert(trObj.id);
	}
</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/CalendarStyle.css">
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
								out.println("<TD id='blank'>&nbsp;</TD>");
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
								out.println("<TD onclick='javascript:clickTrEvent(this)'>");
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
		<!--�޷� �ѱ��  -->
		<!-- slide �Լ��� 2���� �ذ� �ٲ�� 1�� �Ѿ�� ���� �ٲ��  -->
		<%
			if (nowMonth > 0) {
		%>
		<input id="left" type="button" value="��" onclick="slide(<%=nowYear%>)">
		<%-- 		<a
			href='CalendarForChange.jsp?yearNext=<%=nowYear%>&amp;monthNext=<%=nowMonth - 1%>&amp;startDayNext=<%=start%>'
			"
		target="_self" id="left"><img src="images/left.png"
			width="30" height="30"></a> --%>

		<%
			} else if (nowMonth == 0) {
		%>
		<a
			href='CalendarForChange.jsp?yearNext=<%=nowYear - 1%>&amp;monthNext=<%=11%>&amp;startDayNext=<%=start%>'
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
			href='CalendarForChange.jsp?yearNext=<%=nowYear%>
		&amp;monthNext=<%=nowMonth + 1%>&amp;startDayNext=<%=start%>'
			"
		target="_self" id="right"><img src="images/right.png"
			width="30" height="30"></a>
		<%
			} else if (nowMonth == 11) {
		%><a
			href='CalendarForChange.jsp?yearNext=<%=nowYear + 1%>
		&amp;monthNext=<%=0%>&amp;startDayNext=<%=start%>'
			"
		target="_self" id="right"><img src="images/right.png"
			width="30" height="30"></a>
		<%
			}
		%>
		<!--�޷� �ѱ�� ��  -->

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
			imgs[order].style.display = "block";
 */
		}
		function dailyInfo() {

		}
	</script>
	<form name="calendarFrm" id="calendarFrm" action="" method="post">

	</form>



</body>
</html>