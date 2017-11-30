<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
*{
font-family:나눔스퀘어라운드, serif;
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
   padding: 30px;
   width: 385px;
   height: 360px;
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
}

#middle-center-div {
   background-color: #61564B;
   width: 390px;
   height: 360px;
   border-radius: 0px 15px 0px 15px;
   border: 3px solid;
   border-bottom-color: #61564B;
   border-top-color: #61564B;
   border-left-color: #61564B;
   border-right-color: #61564B;
}

#middle-right-div {
   padding: 30px;
   width: 340px;
   height: 340px;
}

#yel {
   color: #FFC331;
   font-weight: bold;
}

.title {
   font-weight: bold;
   font-size: medium;
}
#team{
font-size: 25px;
}
#board{   
color: #FFC331;
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
               <h4 class="title">프로그램 소개</h4>
               <h3>부우우우우~!뷰유융~시인~
                 </h3>
            </div></td>
         <td id=top-right"><div id="top-right-div">
               <iframe width="400" height="400" src='crawlingMain.jsp' name="test"
                  scrolling="no" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0></iframe>
            </div></td>
      </tr>
      <tr>
         <td><div id="middle-center-div">
               <h1 id="board">게시판</h1>
               게시글 제목들...가능하다면 클릭시...해당게시물로........이걸..해내는..여러분이...4차산업혁명의...선도..인력
            </div></td>
         <td><div id="middle-right-div">
               <h4 class="title">보도자료</h4>
               <h2 class="contents">스마트미디어인재개발원 2차 프로젝트에서 우수한 성적으로 입상</h2>
               <h3>Parasol(www.parasol.co.kr, 대표이사 사장 홍성은)은 4일, 광주 남구 CGI센터
                  강의실에서 열린 '제 2차 프로젝트'...</h3>
               <h5>2017-12-04</h5>
            </div></td>
      </tr>
      <tr>
         <td><div id="bottom-left-div">
               <h1>팀원 소개</h1><br><span id="team">홍성은 : 리더(kutar37@tistory.com)<br>김병우 : 잔머리꾼+똥쟁이(http://blog.naver.com/kbw0104)<br>강새힘
						: 코딩여왕(사막의 오아시스)<br>윤다솔 : 갑과 을에서을(비쥬얼센터)</span>
            </div></td>
         <td colspan="2"><div id="bottom-right-div">
               <video src="dasol.mp4" autoplay="autoplay"
						width="900" height="280"></video>
            </div></td>
      </tr>
   </table>
</body>
</html>