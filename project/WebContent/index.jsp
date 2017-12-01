<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css?ver=4" />
<!-- <style type="text/css">
.white_content:target {
   opacity: 1;
   pointer-events: auto;
   z-index: 100000;
}

.white_content>div {
   position: absolute;
   top: 25%;
   left: 25%;
   width: 50%;
   /*  height: 50%; */
   padding: 16px;
   /*  overflow: auto */;
}


</style> -->

<title>Insert title here</title>
</head>
<body>
   <!-- Wrapper -->
   <div id="wrapper">
      <!-- Main -->
      <div id="main">
         <div class="inner">

            <!-- Header -->
            <header id="header"> <a href="index.jsp" class="logo"><strong>Project</strong>
               by BBcompany</a>
            <c:choose>
            	<c:when test="${empty email}">
		            <ul class="icons">
		               <li><a href="#" class="button special fit" onclick="window.open('dasol.html','login/join','resizable=no width=780,height=680,left=500, top=250 menubar=1 status=0')">LOGIN</a></li>
		            </ul>
	            </c:when>
	            <c:otherwise>
		            <ul class="icons">
		               <li><a href="Logout.jsp" class="button special fit">Logout</a></li>
		            </ul>
	            </c:otherwise>
           	</c:choose>
            </header>
            <!-- Banner -->
            <section id="banner">
				<iframe name="mainFrame" id="mainFrame" frameborder="0" scrolling="no" width="100%" height="1816px" src = "MainContents.jsp" ></iframe>
				 </section>

         </div>
      </div>
      <!-- Sidebar -->
      <div id="sidebar">
         <div class="inner">
            <!-- Search -->
     <section id="search" class="alt">
           
<iframe src="profile.jsp" scrolling="no" height="100%" width="100%">���׻���</iframe>

         </section>
            <!-- Menu -->
            <nav id="menu"> <header class="major">
            <h2>MENU</h2>
            </header>
            <ul>
               <li><a href="ServiceMain.html" target="mainFrame">���� �Ұ�</a></li>
               <li><span class="opener">�� ����</span>
                  <ul>
                     <li><a href="#" onclick="window.open('payment/payment.html','window','width=1900,height=1000,left=0,top=0')">���񽺰��� / ����</a></li>
                     <li><a href="InfoEdit.jsp" target="mainFrame">�� ���� ����</a></li>
                  </ul></li>
               <li><span class="opener">���� �м�</span>
                  <ul>
                     <li><a href="#" target="mainFrame">������ ����</a></li>
                     <li><a href="CalendarMain.jsp" target="mainFrame">������ ����</a></li>
                  </ul></li>
               <li><a href="Board/index.jsp" target="mainFrame">�Խ���</a></li>
               <li><a href="Support/Support.jsp" target="mainFrame">���� ����</a></li>

            </ul>
            </nav>
            <!-- Section -->

            <!-- Section -->
            <ul class="contact">
               <li class="fa-envelope-o">smhrd@smhrd.co.kr</li>
               <li class="fa-phone">070-1234-4567</li>
               <li class="fa-home">���� ���� �۾Ϸ� 60 ����CGI����<br> ������� 2��
                  ����Ʈ�̵����ȸ
               </li>
            </ul>
            </section>
            <!-- Footer -->
            <footer id="footer">
            <p class="copyright">&copy; i¦ ������Ʈ ȫ���� �躴�� ������ ���ټ�<br>
            kutar37@tistory.com<br>
            http://blog.naver.com/kbw0104</p>
            </footer>
         </div>
      </div>
   </div>
   <!-- Scripts -->
   <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/skel.min.js"></script>
   <script src="assets/js/util.js"></script>
   <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
   <script src="assets/js/main.js"></script>
   
</body>
</html>