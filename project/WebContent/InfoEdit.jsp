<%@page import="com.DTO.MemberDTO"%>
<%@page import="com.DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	select.location {
		display: inline;
		width: 49%;
	}
	
	input#updateSub{
		margin-left: 45%;
		width: 10%;
	}
</style>

<c:if test="${empty sessionScope.email}">
<script type="text/javascript">
alert('로그인이 필요한 서비스입니다.');
location.href="MainContents.jsp";
</script>
</c:if>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="assets/css/InfoEdit.css" />
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	//상위 셀렉트로 하위 셀렉트 제어하기
	function showSub(obj) {

		f = document.forms.update;

		if (obj == 1) {
			f.city.style.display = "none";
			f.city1.style.display = "";
			f.city2.style.display = "none";
			f.city3.style.display = "none";
			f.city4.style.display = "none";
			f.city5.style.display = "none";
			f.city6.style.display = "none";
			f.city7.style.display = "none";
			f.city8.style.display = "none";
		} else if (obj == 2) {
			f.city.style.display = "none";
			f.city1.style.display = "none";
			f.city2.style.display = "";
			f.city3.style.display = "none";
			f.city4.style.display = "none";
			f.city5.style.display = "none";
			f.city6.style.display = "none";
			f.city7.style.display = "none";
			f.city8.style.display = "none";
		} else if (obj == 3) {
			f.city.style.display = "none";
			f.city1.style.display = "none";
			f.city2.style.display = "none";
			f.city3.style.display = "";
			f.city4.style.display = "none";
			f.city5.style.display = "none";
			f.city6.style.display = "none";
			f.city7.style.display = "none";
			f.city8.style.display = "none";
		} else if (obj == 4) {
			f.city.style.display = "none";
			f.city1.style.display = "none";
			f.city2.style.display = "none";
			f.city3.style.display = "none";
			f.city4.style.display = "";
			f.city5.style.display = "none";
			f.city6.style.display = "none";
			f.city7.style.display = "none";
			f.city8.style.display = "none";
		} else if (obj == 5) {
			f.city.style.display = "none";
			f.city1.style.display = "none";
			f.city2.style.display = "none";
			f.city3.style.display = "none";
			f.city4.style.display = "none";
			f.city5.style.display = "";
			f.city6.style.display = "none";
			f.city7.style.display = "none";
			f.city8.style.display = "none";
		} else if (obj == 6) {
			f.city.style.display = "none";
			f.city1.style.display = "none";
			f.city2.style.display = "none";
			f.city3.style.display = "none";
			f.city4.style.display = "none";
			f.city5.style.display = "none";
			f.city6.style.display = "";
			f.city7.style.display = "none";
			f.city8.style.display = "none";
		} else if (obj == 7) {
			f.city.style.display = "none";
			f.city1.style.display = "none";
			f.city2.style.display = "none";
			f.city3.style.display = "none";
			f.city4.style.display = "none";
			f.city5.style.display = "none";
			f.city6.style.display = "none";
			f.city7.style.display = "";
			f.city8.style.display = "none";
		} else if (obj == 8) {
			f.city.style.display = "none";
			f.city1.style.display = "none";
			f.city2.style.display = "none";
			f.city3.style.display = "none";
			f.city4.style.display = "none";
			f.city5.style.display = "none";
			f.city6.style.display = "none";
			f.city7.style.display = "none";
			f.city8.style.display = "";
		}
		

		/* var region = document.getElementById("wide_select");
		var regionName = region.options[region.selectedIndex].text;
		
		psnSelect(regionName); */
	}
	
	//유효검사
	function check(){
		if(document.update.NewPw.value != "") {
			//비밀번호 길이 체크(4~8자 까지 허용)
	        if (document.update.NewPw.value.length<4 || document.update.NewPw.value.length>12) {
	            alert("비밀번호를 4~12자까지 입력해주세요.")
	            document.f.my_pwd.focus()
	            document.f.my_pwd.select()
	            return false;
	        }
			//비밀번호 확인 체크
			if(document.update.NewPw.value!=document.update.NewPwConfirm.value){
				alert("새로운 비밀번호가 일치하지 않습니다.")
	            document.f.my_pwd.focus()
	            document.f.my_pwd.select()
	            return false;
			}
		}
		
		if(document.update.NewPhone.value != "") {
			//폰번호 체크
			if (!isNumeric(document.update.NewPhone.value)) {
	            alert("핸드폰번호는 숫자로 입력하세요.");
	            document.f.phoneNum.value = ""
	            document.f.phoneNum.focus()
	            return false;
			}
		}
	}
	
</script>
</head>
<body>
	<form action="#" id="chPwForm">
		<table>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" id="ckPw"></td>
				<td><input type="button" onclick="CheckPw()" value="확인" ></td>
			</tr>
		</table>
	</form>
	
	<form action="Update.do" id="Modify" style="display: none;" name="update" method="post">
	<%
		String sessionEmail = (String)session.getAttribute("email");
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.ForMemberUpdate(sessionEmail);
		
		request.setAttribute("dto", dto);
	%>
		<div id="container">
			<div id="editinfo">
				<img alt="이미지 오류류류류뿌잉" src="img/editinfoimage.jpg">
				<table title="필수 정보 입력">
					<tr>
						<td>이메일</td>
						<td>${sessionScope.email}</td>
					</tr>
					<tr>
						<td>신규 비밀번호</td>
						<td><input type="password" name="NewPw">&nbsp비밀번호
							변경을 원하시면 신규 비밀번호를 입력해주세요</td>
					</tr>
					<tr>
						<td>신규 비밀번호 확인</td>
						<td><input type="password" name="NewPwConfirm">&nbsp비밀번호를
							한 번 더 입력해주세요</td>
					</tr>
					<tr>
						<td>핸드폰 번호</td>
						<td><input type="tel" name="NewPhone"
							value=${dto.getPhone() }>&nbsp-없이 숫자만 입력해주세요</td>
					</tr>
					<tr>
						<td>업종<input type="hidden" value="${dto.getCategory() }" name="getCategory" id="getCategory"></td>
						<td>
							<select name="category">
								<option value="요식업">요식업</option>
								<option value="화훼업">화훼업</option>
								<option value="편의점">편의점</option>
								<option value="마트">마트</option>
								<option value="pc방">pc방</option>
								<option value="주류업">주류업</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>지역 <input type="hidden" value="${dto.getArea() }" name="getArea" id="getArea"></td>
						<td>
							<select name="test" title="시,도" id="wide_select" class="location" onChange="showSub(this.options[this.selectedIndex].value);" required="required">
								<option value="">도시를 선택해주세요</option>
								<option value="1">서울·경기·인천</option>
								<option value="2">강원도</option>
								<option value="3">충청도</option>
								<option value="4">전라북도</option>
								<option value="5">전라남도</option>
								<option value="6">경상북도</option>
								<option value="7">경상남도</option>
								<option value="8">제주도</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;
							<!-- <select name="location" class="location" style="display: ;" id="city" >
								<option value="">도시를 선택해주세요</option>
							</select> -->
							<select name="location1" class="location" style="display: none;" id="city1" >
								<option value="">지역을 선택해주세요</option>
								<option value="강화">강화</option>
								<option value="동두천">동두천</option>
								<option value="백령도">백령도</option>
								<option value="서울">서울</option>
								<option value="수원">수원</option>
								<option value="양평">양평</option>
								<option value="이천">이천</option>
								<option value="인천">인천</option>
								<option value="파주">파주</option>
							</select>
							<select name="location2" class="location" style="display: none;" id="city2">
								<option value="">지역을 선택해주세요</option>
								<option value="강릉">강릉</option>
								<option value="대관령">대관령</option>
								<option value="동해">동해</option>
								<option value="속초">속초</option>
								<option value="영월">영월</option>
								<option value="원주">원주</option>
								<option value="인제">인제</option>
								<option value="정선">정선</option>
								<option value="철원">철원</option>
								<option value="춘천">춘천</option>
								<option value="태백">태백</option>
								<option value="홍천">홍천</option>
							</select>
							<select name="location3" class="location" style="display: none;" id="city3">
								<option value="">지역을 선택해주세요</option>
								<option value="금산">금산</option>
								<option value="대전">대전</option>
								<option value="보은">보은</option>
								<option value="보령">보령</option>
								<option value="부여">부여</option>
								<option value="서산">서산</option>
								<option value="제천">제천</option>
								<option value="천안">천안</option>
								<option value="청주">청주</option>
								<option value="추풍령">추풍령</option>
								<option value="충주">충주</option>
								<option value="홍성">홍성</option>
							</select>
							<select name="location4" class="location" style="display: none;" id="city4" >
								<option value="">지역을 선택해주세요</option>
								<option value="고창">고창</option>
								<option value="군산">군산</option>
								<option value="남원">남원</option>
								<option value="부안">부안</option>
								<option value="순창">순창</option>
								<option value="임실">임실</option>
								<option value="장수">장수</option>
								<option value="전주">전주</option>
								<option value="정읍">정읍</option>
							</select>
							<select name="location5" class="location" style="display: none;" id="city5" >
								<option value="">지역을 선택해주세요</option>
								<option value="강진">강진</option>
								<option value="고흥">고흥</option>
								<option value="광양">광양</option>
								<option value="광주">광주</option>
								<option value="목포">목포</option>
								<option value="보성">보성</option>
								<option value="순천">순천</option>
								<option value="여수">여수</option>
								<option value="영광">영광</option>
								<option value="완도">완도</option>
								<option value="장흥">장흥</option>
								<option value="진도">진도</option>
								<option value="진도">해남</option>
								<option value="흑산도">흑산도</option>
							</select>
							<select name="location6" class="location" style="display: none;" id="city6" >
								<option value="">지역을 선택해주세요</option>
								<option value="경주">경주</option>
								<option value="구미">구미</option>
								<option value="대구">대구</option>
								<option value="문경">문경</option>
								<option value="봉화">봉화</option>
								<option value="상주">상주</option>
								<option value="안동">안동</option>
								<option value="영덕">영덕</option>
								<option value="영주">영주</option>
								<option value="영천">영천</option>
								<option value="울릉도">울릉도</option>
								<option value="울진">울진</option>
								<option value="의성">의성</option>
								<option value="청송">청송</option>
								<option value="포항">포항</option>
							</select>
							<select name="location7" class="location" style="display: none;" id="city7" >
								<option value="">지역을 선택해주세요</option>
								<option value="거제">거제</option>
								<option value="거창">거창</option>
								<option value="김해">김해</option>
								<option value="남해">남해</option>
								<option value="밀양">밀양</option>
								<option value="부산">부산</option>
								<option value="산청">산청</option>
								<option value="양산">양산</option>
								<option value="울산">울산</option>
								<option value="의령">의령</option>
								<option value="진주">진주</option>
								<option value="창원">창원</option>
								<option value="통영">통영</option>
								<option value="함양">함양</option>
								<option value="합천">합천</option>
							</select>
							<select name="location8" class="location" style="display: none;" id="city8">
								<option value="">지역을 선택해주세요</option>
								<option value="고산">고산</option>
								<option value="서귀포">서귀포</option>
								<option value="성산">성산</option>
								<option value="제주">제주</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>방법</td>
						<td>
							<input type="hidden" value="${dto.getEnviron() }" id="getEnviron">
							<input type="radio" name="environ" value="0" id="environ1">
							<label for="environ1">TYPE 1</label>
							<input type="radio" name="environ" value="1" id="environ2">
							<label for="environ2">TYPE 2</label>
							<input type="radio" name="environ" value="2" id="environ3">
							<label for="environ3">TYPE 3</label>
							<input type="radio" name="environ" value="3" id="environ4">
							<label for="environ4">TYPE 4</label>
							<input type="radio" name="environ" value="4" id="environ5">
							<label for="environ5">TYPE 5</label>
							<input type="radio" name="environ" value="5" id="environ6">
							<label for="environ6">TYPE 6</label>
							<input type="radio" name="environ" value="6" id="environ7">
							<label for="environ7">TYPE 7</label>
							<input type="radio" name="environ" value="7" id="environ8">
							<label for="environ8">TYPE 8</label>
						</td>
					</tr>
				</table>
				<input type="submit" value="수정" id="updateSub" onclick="check()">
			</div>
		</div>
	</form>
	
	<script type="text/javascript">
		function test() {
			var environ = document.getElementsByName("environ");
			var getArea = document.getElementById("getArea").value;
			var getCategory = document.getElementById("getCategory").value;
			
			for(var i = 1 ; i <= 8; i++) {
				var getArea = document.getElementById("getArea").value;
				var location = document.getElementsByName("location"+i);
				
				for(var j = 0; j < location[0].length; j++) {
					if(getArea == location[0][j].value) {
						document.update.test.options[i].selected = "selected";
						location[0].style.display = "";
						location[0].options[j].selected = "selected";
					}
				}
			}
						
			var getEnviron = document.update.getEnviron.value;
			
			for(var i = 0; i < environ.length; i++) {
				if(getEnviron == environ[i].value)	{
					environ[i].checked = true;
				}
			}
			
			var category = document.update.category;

			for(var i = 0; i < category.length; i++) {
				if(getCategory == category[i].value) {
					category.options[i].selected = "selected";
				}
			}
			
		}
	
   		function CheckPw() {
			var pw = document.getElementById("ckPw").value;
			var chPwF = document.getElementById("chPwForm");
			var modi = document.getElementById("Modify");
			
			if(pw == "") {
				alert("비밀번호를 입력해주세요!");
			} else {
				$.ajax({
					url : "CheckPw.do?pw=" + pw,
					success : function(data) {
						if (data == "success") {
							chPwF.style.display = "none";
							modi.style.display = "block";
							test();
						} else if(data == "fail") {
							alert("비밀번호를 확인해주세요!");
						}
					}
				});
			}
		}
   </script>
</body>
</html>