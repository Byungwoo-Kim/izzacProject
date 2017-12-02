<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
*{
font-family:�������������, serif;
}

th, td {
   padding: 5px;
}

#top-left-div {
   padding-top: 50px;
   padding-left: 40px;
   background-image: url(mainImage/left_long.png);
   background-repeat: no-repeat;
   width: 340px;
   height: 750px;
   border-radius: 0px 15px 0px 15px;
   line-height: 50px;
}

#top-center-div {
padding: 0;   width: 385px;
   height: 360px;margin-top: 35px;
}

#top-right-div {
   width: 340px;
   height: 340px;
}

#bottom-left-div {
   width: 450px;
   height: 280px;
   border:5px solid gray;
}

#bottom-right-div {
   width: 340px;
   height: 340px;
   padding-top: 30px;
    box-sizing: border-box;
}

#middle-center-div {
   background-color: #e9ebec;
  width: 390px;
    height: 378px;
   border-radius: 0px 15px 0px 15px;
   border: 3px solid #e9ebec;
   margin-top: 10px;
}

#middle-right-div {
   padding: 30px;
   width: 340px;
    height: 400px;
}
#yel {
   color: #FFC331;
   font-weight: bold;
}
.title {
   font-weight: bold;
   font-size: 35px;
   color: #424242;
   margin-top: 20px;
}
#team{
font-size: 25px;
}
h1{   
color: #ed9357;
}
.contents{
font-size: 25px;
color: #FFC331;
}
h3{
font-size: 15px;
color:#757575
}
#board{
color:#212121;
font-family:"@12�Ե���Ʈ�帲Light",serif;
font-size: 38px;
font-weight: bold;
}
li{
font-size: 20px;
font-family: �������������, serif;
}
</style>
</head>
<body>


   <table class="mainTable" style="table-layout:fixed; word-break:break-all;" width="1200" height = "400" cellpadding="5" cellspacing="2" align="center" >
   
      <tr>
         <td rowspan="2">
            <div id="top-left-div">
            </div>
         </td>
         <td id="top-center"><div id="top-center-div">
          <a href="#" onclick="isFree()"><img src="images/bigban1.jpg" alt="�̹��� ����" width="400" height="380"></a>
            </div></td>
         <td id=top-right"><div id="top-right-div">
               <iframe width="400" height="400" src='crawlingMain.jsp' name="test"
                  scrolling="no" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0></iframe>
            </div></td>
      </tr>
      <tr>
         <td><div id="middle-center-div">
               <span id="board">�Խ���</span><br>
               <ul type="circle">
               <li>�� ���� �𸣴°� �Ƴ� �ϰ� �𸣴� ����</li>
               <li>���� �װ� �������� ���� �ְ�;�</li>
               <li>�� ����� �� �ʹ�� ������</li>
               <li>�ʴ� ���� ���ڱ���</li>
               <li>�߾� ������ ��ſ��� ��⸦</li>
               <li>���ݾ� �����</li>
               <li>���� ������ �� ������?</li>
               <li>���� ȸ���� ���?</li>
               <li>��� ����...1������!</li>
               </ul>
            </div></td>
         <td><div id="middle-right-div">
               <h4 class="title"><u>�����ڷ�</u></h4>
               <h2 class="contents">����Ʈ�̵�����簳�߿� 2�� <br>������Ʈ���� ����� �������� �Ի�</h2>
               <h3>Parasol(www.parasol.co.kr, ��ǥ�̻� ���� ȫ����)�� 4��, ���� ���� CGI����
                  ���ǽǿ��� ���� '�� 2�� ������Ʈ'...</h3>
               <h5>2017-12-04</h5>
            </div></td>
      </tr>
      <tr>
         <td><div id="bottom-left-div">
               <h1>���� �Ұ�</h1><br><span id="team">ȫ���� : ����(kutar37@tistory.com)<br>�躴�� : �ܸӸ���+������(http://blog.naver.com/kbw0104)<br>������
						: �ڵ�����(�縷�� ���ƽý�)<br>���ټ� : ���� ��������(�������)</span>
            </div></td>
         <td colspan="2"><div id="bottom-right-div">
               <video src="dasol.mp4" autoplay="autoplay"
						width="900" height="280"></video>
            </div></td>
      </tr>
   </table>
   
   <script type="text/javascript">
   		function isFree() {
			var isChecked = confirm("���� ü������ �����ðڽ��ϱ�?");
			
			if(isChecked) {
				$.ajax({
					url : "FreeCheck.do",
					success : function(data) {
						if (data == "success") {
							alert("30���� ���������� ����Ǿ����ϴ�!");
						} else if(data == "fail") {
							alert("�̹� �����̽��ϴ�!");
						}
					}
				});
			} else {
				alert("����ϼ̽��ϴ�.");
			}
		}
   </script>
</body>
</html>