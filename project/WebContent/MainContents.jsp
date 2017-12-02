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
font-family:"@12롯데마트드림Light",serif;
font-size: 38px;
font-weight: bold;
}
li{
font-size: 20px;
font-family: 나눔스퀘어라운드, serif;
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
          <a href="#" onclick="isFree()"><img src="images/bigban1.jpg" alt="이미지 오류" width="400" height="380"></a>
            </div></td>
         <td id=top-right"><div id="top-right-div">
               <iframe width="400" height="400" src='crawlingMain.jsp' name="test"
                  scrolling="no" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0></iframe>
            </div></td>
      </tr>
      <tr>
         <td><div id="middle-center-div">
               <span id="board">게시판</span><br>
               <ul type="circle">
               <li>니 맘을 모르는게 아냐 니가 모르는 거지</li>
               <li>나는 네게 걱정없는 맘을 주고싶어</li>
               <li>난 문어야 널 너문어무 조아해</li>
               <li>너는 정말 예쁘구나</li>
               <li>추억 열차가 당신에게 닿기를</li>
               <li>있잖아 배고파</li>
               <li>오늘 저녁은 뭘 먹을까?</li>
               <li>다음 회식은 어디서?</li>
               <li>모두 힘내...1등하자!</li>
               </ul>
            </div></td>
         <td><div id="middle-right-div">
               <h4 class="title"><u>보도자료</u></h4>
               <h2 class="contents">스마트미디어인재개발원 2차 <br>프로젝트에서 우수한 성적으로 입상</h2>
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
   
   <script type="text/javascript">
   		function isFree() {
			var isChecked = confirm("무료 체험판을 받으시겠습니까?");
			
			if(isChecked) {
				$.ajax({
					url : "FreeCheck.do",
					success : function(data) {
						if (data == "success") {
							alert("30일이 성공적으로 연장되었습니다!");
						} else if(data == "fail") {
							alert("이미 받으셨습니다!");
						}
					}
				});
			} else {
				alert("취소하셨습니다.");
			}
		}
   </script>
</body>
</html>