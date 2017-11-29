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
            <section id="search" class="alt">누구님 시계 날씨 위젯 남은 정액기간</section>
            <!-- Menu -->
            <nav id="menu"> <header class="major">
            <h2>Menu</h2>
            </header>
            <ul>
               <li><a href="ServiceMain.html" target="mainFrame">서비스 소개(폰트 나중에 수정)</a></li>
               <li><span class="opener">내 정보</span>
                  <ul>
                     <li><a href="#" target="mainFrame">캐쉬 충전</a></li>
                     <li><a href="#" target="mainFrame">내 정보 수정</a></li>
                  </ul></li>
               <li><span class="opener">매출 분석</span>
                  <ul>
                     <li><a href="#" target="mainFrame">오늘의 매출</a></li>
                     <li><a href="CalendarMain.jsp" target="mainFrame">과거의 매출</a></li>
                  </ul></li>
               <li><a href="Board/index.jsp" target="mainFrame">게시판</a></li>
               <li><a href="Support/Support.jsp" target="mainFrame">고객 센터</a></li>

            </ul>
            </nav>
            <!-- Section -->

            <!-- Section -->
            <section> <a href="#"><img src="images/Banner.jpg"
               alt="" id="ban"></a> <!-- 회원가입으로 고고 -->
            <ul class="contact">
               <li class="fa-envelope-o"><a href="#">smhrd@smhrd.co.kr</a></li>
               <li class="fa-phone">070-1234-4567</li>
               <li class="fa-home">광주 남구 송암로 60 광주CGI센터<br> 진흥원동 2층
                  스마트미디어학회
               </li>
            </ul>
            </section>
            <!-- Footer -->
            <footer id="footer">
            <p class="copyright">&copy; i짝 프로젝트 홍성은 김병우 강새힘 윤다솔<br>
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