<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.outLine {
	margin-left: 550px;
	height: 600px;
	width: 610px;
	background-color: #eff1f2;
	border-radius: 3em;
}

.detail, .detail tr, .detail td {
	text-align: center;
	width: 600px;
	font-size: large;
}

.detail td {
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
<meta charset="EUC-KR">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="assets/css/CalendarStyle.css?ver=3">
</head>
<body>
	<script type="text/javascript">
	//������ ���� â ���� �ڵ带 �Լ��ȿ� ����־��
	function clickTrEvent(year, month, date) {
		
	alert(year + "��" + month + "��" + date + "��");
	$.ajax({
		//���� ���� �Ǹŷ� �˻�
			url : "DailyResultService",
			data : "year=" + year +"&month=" + month+"&date="+date,
			success : function(result) {
				
				alert(result);
				var menuAndQty = result.split("/");
				var itemlist = menuAndQty[0].split(",");
				var qtyList = menuAndQty[1].split(",");
				
				var item1 = itemlist[0];
				var item2 = itemlist[1];
				var item3 = itemlist[2];
				
				var qty1 = qtyList[0];
				var qty2 = qtyList[1];
				var qty3 = qtyList[2];
				alert(item1);
				alert(item2);
				alert(item3);
				alert(qty1);
				alert(qty2);
				alert(qty3);
				
				var Qtag1 = document.getElementById("realQty1");
				var Qtag2 = document.getElementById("realQty2");
				var Qtag3 = document.getElementById("realQty3");
				
				var Mtag1 = document.getElementById("realMenu1");
				var Mtag2 = document.getElementById("realMenu2");
				var Mtag3 = document.getElementById("realMenu3");
				
				

				
				Qtag1.innerHTML = qty1;
				Qtag2.innerHTML = qty2;
				Qtag3.innerHTML = qty3;
				
				Mtag1.innerHTML = item1;
				Mtag2.innerHTML = item2;
				Mtag3.innerHTML = item3;
				
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}

		});
	$.ajax({
		//���� ���� �Ǹŷ� �˻�
			url : "DailyAnalService",
			data : "year=" + year +"&month=" + month+"&date="+date,
			success : function(result) {
				
				alert("?");
				alert(result);
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}

		});
	
	
	}

</script>
	<%
		GregorianCalendar today = new GregorianCalendar();
		int nowYear = today.get(today.YEAR);
		int nowMonth = today.get(today.MONTH) + 1;
		int nowDay = today.get(today.DAY_OF_MONTH);
		int lastDay = today.getActualMaximum(Calendar.DAY_OF_MONTH);
		String eng_month = "";
		if (nowMonth == 1) {
			eng_month = "January";
		} else if (nowMonth == 2) {
			eng_month = "Febrary";
		} else if (nowMonth == 3) {
			eng_month = "March";
		} else if (nowMonth == 4) {
			eng_month = "April";
		} else if (nowMonth == 5) {
			eng_month = "May";
		} else if (nowMonth == 6) {
			eng_month = "June";
		} else if (nowMonth == 7) {
			eng_month = "July";
		} else if (nowMonth == 8) {
			eng_month = "August";
		} else if (nowMonth == 9) {
			eng_month = "September";
		} else if (nowMonth == 10) {
			eng_month = "October";
		} else if (nowMonth == 11) {
			eng_month = "November";
		} else if (nowMonth == 12) {
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
								out.println("<TD>");
						%>
						<!-- ĭ�� ��¥�ֱ�  -->
						<div
							onclick='javascript:clickTrEvent(<%=nowYear%>,<%=nowMonth%>,<%=index%>)'>
							<font color='<%=color%>'> <%=index%>
							</font>
						</div>
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


		<div></div>
		<!--�޷� �ѱ��  -->
		<!-- slide �Լ��� 2���� �ذ� �ٲ�� 1�� �Ѿ�� ���� �ٲ��  -->
		<%
			if (nowMonth > 0) {
		%>
		<%-- <input id="left" type="button" value="��" onclick="slide(<%=nowYear%>)"> --%>
		<a
			href='CalendarForChange.jsp?yearNext=<%=nowYear%>&amp;monthNext=<%=nowMonth - 1%>&amp;startDayNext=<%=start%>'
			"
		target="_self" id="left"><img src="images/left.png"
			width="30" height="30"></a>

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
	<!-- �� �������� �����ʿ� ������ â  -->

	<div class="outLine">
		<table class="detail">
			<tr>
				<td colspan="3" class="title">���� �Ǹŷ�</td>
				<td colspan="3" class="title">���� �Ǹŷ�</td>
			</tr>
			<tr>
				<td class="rank">1.</td>
				<td id="preMenu1">Iced Americano</td>
				<td id="preQty1">87</td>
				<td class="rank">1.</td>
				<td id="realMenu1">Iced Americano</td>
				<td id = "realQty1">79</td>
			</tr>
			<tr>
				<td class="rank">2.</td>
				<td id="preMenu2">Iced Vanilla Latte</td>
				<td id="preQty2">54</td>
				<td class="rank">2.</td>
				<td id="realMenu2">Hot Chocolate</td>
				<td id = "realQty2">43</td>
			</tr>
			<tr>
				<td class="rank">3.</td>
				<td id="preMenu3">Espresso</td>
				<td id="preQty3">45</td>
				<td class="rank">3.</td>
				<td id="realMenu3">Iced Vanilla Latte</td>
				<td id = "realQty3">39</td>
			</tr>
			<tr>
				<td td colspan="6" class="void"></td>

			</tr>
			<tr>
				<td td colspan="3" class="title">���� �����</td>
				<td td colspan="3" class="title">���� �����</td>
			</tr>
			<tr>
				<td td colspan="3">2562500��</td>
				<td td colspan="3">2315800��</td>
			</tr>
			<tr>
				<td td colspan="6" class="void"></td>

			</tr>
			<tr>
				<td colspan="6" class="title"><h1 id="result">99%</h1></td>

			</tr>


		</table>
	</div>








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
	</script>
	<form name="calendarFrm" id="calendarFrm" action="" method="post">

	</form>




</body>
</html>