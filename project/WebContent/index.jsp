<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<style type="text/css">
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


</style>

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
            <ul class="icons">
               <li><a href="#open" class="button special fit">Sign In / Up</a></li>
            </ul>
            </header>
            <!-- Banner -->
            <section id="banner">


            <div class="white_content" id="open">

               <div>
                  <div style="position: relative;">
                     <a href='#'
                        style="position: absolute; right: 10px; color: white; font-size: 25px; font-weight: bold;"
                        onclick="close()">X</a>
                  </div>
                  <iframe width="100%" height="1000px" src='Login_Signup.html'></iframe>
               </div>
            </div>

				<script type="text/javascript">
					function close() {
						document.querySelector("div.white_content").style.opacity = "0";
					}
				</script>
				<iframe name="mainFrame" id="mainFrame" frameborder="0" scrolling="no" width="100%" height="1816px" ></iframe>
				 </section>

         </div>
      </div>
      <!-- Sidebar -->
      <div id="sidebar">
         <div class="inner">
            <!-- Search -->
            <section id="search" class="alt">������ �ð� ���� ���� ���� ���ױⰣ</section>
            <!-- Menu -->
            <nav id="menu"> <header class="major">
            <h2>Menu</h2>
            </header>
            <ul>
               <li><a href="ServiceMain.html" target="mainFrame">���� �Ұ�(��Ʈ ���߿� ����)</a></li>
               <li><span class="opener">�� ����</span>
                  <ul>
                     <li><a href="#" target="mainFrame">ĳ�� ����</a></li>
                     <li><a href="#" target="mainFrame">�� ���� ����</a></li>
                  </ul></li>
               <li><span class="opener">���� �м�</span>
                  <ul>
                     <li><a href="#" target="mainFrame">������ ����</a></li>
                     <li><a href="CalendarMain.jsp" target="mainFrame">������ ����</a></li>
                  </ul></li>
               <li><a href="Board/index.jsp" target="mainFrame">�Խ���</a></li>
               <li><a href="Support/Support.jsp" target="mainFrame">�� ����</a></li>

            </ul>
            </nav>
            <!-- Section -->

            <!-- Section -->
            <section> <a href="#"><img src="images/Banner.jpg"
               alt="" id="ban"></a> <!-- ȸ���������� ��� -->
            <ul class="contact">
               <li class="fa-envelope-o"><a href="#">smhrd@smhrd.co.kr</a></li>
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