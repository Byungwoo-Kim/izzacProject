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
alert('�α����� �ʿ��� �����Դϴ�.');
location.href="MainContents.jsp";
</script>
</c:if>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="assets/css/InfoEdit.css" />
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	//���� ����Ʈ�� ���� ����Ʈ �����ϱ�
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
	
	//��ȿ�˻�
	function check(){
		if(document.update.NewPw.value != "") {
			//��й�ȣ ���� üũ(4~8�� ���� ���)
	        if (document.update.NewPw.value.length<4 || document.update.NewPw.value.length>12) {
	            alert("��й�ȣ�� 4~12�ڱ��� �Է����ּ���.")
	            document.f.my_pwd.focus()
	            document.f.my_pwd.select()
	            return false;
	        }
			//��й�ȣ Ȯ�� üũ
			if(document.update.NewPw.value!=document.update.NewPwConfirm.value){
				alert("���ο� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.")
	            document.f.my_pwd.focus()
	            document.f.my_pwd.select()
	            return false;
			}
		}
		
		if(document.update.NewPhone.value != "") {
			//����ȣ üũ
			if (!isNumeric(document.update.NewPhone.value)) {
	            alert("�ڵ�����ȣ�� ���ڷ� �Է��ϼ���.");
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
				<td>��й�ȣ Ȯ��</td>
				<td><input type="password" id="ckPw"></td>
				<td><input type="button" onclick="CheckPw()" value="Ȯ��" ></td>
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
				<img alt="�̹��� ��������������" src="img/editinfoimage.jpg">
				<table title="�ʼ� ���� �Է�">
					<tr>
						<td>�̸���</td>
						<td>${sessionScope.email}</td>
					</tr>
					<tr>
						<td>�ű� ��й�ȣ</td>
						<td><input type="password" name="NewPw">&nbsp��й�ȣ
							������ ���Ͻø� �ű� ��й�ȣ�� �Է����ּ���</td>
					</tr>
					<tr>
						<td>�ű� ��й�ȣ Ȯ��</td>
						<td><input type="password" name="NewPwConfirm">&nbsp��й�ȣ��
							�� �� �� �Է����ּ���</td>
					</tr>
					<tr>
						<td>�ڵ��� ��ȣ</td>
						<td><input type="tel" name="NewPhone"
							value=${dto.getPhone() }>&nbsp-���� ���ڸ� �Է����ּ���</td>
					</tr>
					<tr>
						<td>����<input type="hidden" value="${dto.getCategory() }" name="getCategory" id="getCategory"></td>
						<td>
							<select name="category">
								<option value="��ľ�">��ľ�</option>
								<option value="ȭ�Ѿ�">ȭ�Ѿ�</option>
								<option value="������">������</option>
								<option value="��Ʈ">��Ʈ</option>
								<option value="pc��">pc��</option>
								<option value="�ַ���">�ַ���</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>���� <input type="hidden" value="${dto.getArea() }" name="getArea" id="getArea"></td>
						<td>
							<select name="test" title="��,��" id="wide_select" class="location" onChange="showSub(this.options[this.selectedIndex].value);" required="required">
								<option value="">���ø� �������ּ���</option>
								<option value="1">�����⡤��õ</option>
								<option value="2">������</option>
								<option value="3">��û��</option>
								<option value="4">����ϵ�</option>
								<option value="5">���󳲵�</option>
								<option value="6">���ϵ�</option>
								<option value="7">��󳲵�</option>
								<option value="8">���ֵ�</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;
							<!-- <select name="location" class="location" style="display: ;" id="city" >
								<option value="">���ø� �������ּ���</option>
							</select> -->
							<select name="location1" class="location" style="display: none;" id="city1" >
								<option value="">������ �������ּ���</option>
								<option value="��ȭ">��ȭ</option>
								<option value="����õ">����õ</option>
								<option value="��ɵ�">��ɵ�</option>
								<option value="����">����</option>
								<option value="����">����</option>
								<option value="����">����</option>
								<option value="��õ">��õ</option>
								<option value="��õ">��õ</option>
								<option value="����">����</option>
							</select>
							<select name="location2" class="location" style="display: none;" id="city2">
								<option value="">������ �������ּ���</option>
								<option value="����">����</option>
								<option value="�����">�����</option>
								<option value="����">����</option>
								<option value="����">����</option>
								<option value="����">����</option>
								<option value="����">����</option>
								<option value="����">����</option>
								<option value="����">����</option>
								<option value="ö��">ö��</option>
								<option value="��õ">��õ</option>
								<option value="�¹�">�¹�</option>
								<option value="ȫõ">ȫõ</option>
							</select>
							<select name="location3" class="location" style="display: none;" id="city3">
								<option value="">������ �������ּ���</option>
								<option value="�ݻ�">�ݻ�</option>
								<option value="����">����</option>
								<option value="����">����</option>
								<option value="����">����</option>
								<option value="�ο�">�ο�</option>
								<option value="����">����</option>
								<option value="��õ">��õ</option>
								<option value="õ��">õ��</option>
								<option value="û��">û��</option>
								<option value="��ǳ��">��ǳ��</option>
								<option value="����">����</option>
								<option value="ȫ��">ȫ��</option>
							</select>
							<select name="location4" class="location" style="display: none;" id="city4" >
								<option value="">������ �������ּ���</option>
								<option value="��â">��â</option>
								<option value="����">����</option>
								<option value="����">����</option>
								<option value="�ξ�">�ξ�</option>
								<option value="��â">��â</option>
								<option value="�ӽ�">�ӽ�</option>
								<option value="���">���</option>
								<option value="����">����</option>
								<option value="����">����</option>
							</select>
							<select name="location5" class="location" style="display: none;" id="city5" >
								<option value="">������ �������ּ���</option>
								<option value="����">����</option>
								<option value="����">����</option>
								<option value="����">����</option>
								<option value="����">����</option>
								<option value="����">����</option>
								<option value="����">����</option>
								<option value="��õ">��õ</option>
								<option value="����">����</option>
								<option value="����">����</option>
								<option value="�ϵ�">�ϵ�</option>
								<option value="����">����</option>
								<option value="����">����</option>
								<option value="����">�س�</option>
								<option value="��굵">��굵</option>
							</select>
							<select name="location6" class="location" style="display: none;" id="city6" >
								<option value="">������ �������ּ���</option>
								<option value="����">����</option>
								<option value="����">����</option>
								<option value="�뱸">�뱸</option>
								<option value="����">����</option>
								<option value="��ȭ">��ȭ</option>
								<option value="����">����</option>
								<option value="�ȵ�">�ȵ�</option>
								<option value="����">����</option>
								<option value="����">����</option>
								<option value="��õ">��õ</option>
								<option value="�︪��">�︪��</option>
								<option value="����">����</option>
								<option value="�Ǽ�">�Ǽ�</option>
								<option value="û��">û��</option>
								<option value="����">����</option>
							</select>
							<select name="location7" class="location" style="display: none;" id="city7" >
								<option value="">������ �������ּ���</option>
								<option value="����">����</option>
								<option value="��â">��â</option>
								<option value="����">����</option>
								<option value="����">����</option>
								<option value="�о�">�о�</option>
								<option value="�λ�">�λ�</option>
								<option value="��û">��û</option>
								<option value="���">���</option>
								<option value="���">���</option>
								<option value="�Ƿ�">�Ƿ�</option>
								<option value="����">����</option>
								<option value="â��">â��</option>
								<option value="�뿵">�뿵</option>
								<option value="�Ծ�">�Ծ�</option>
								<option value="��õ">��õ</option>
							</select>
							<select name="location8" class="location" style="display: none;" id="city8">
								<option value="">������ �������ּ���</option>
								<option value="���">���</option>
								<option value="������">������</option>
								<option value="����">����</option>
								<option value="����">����</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>���</td>
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
				<input type="submit" value="����" id="updateSub" onclick="check()">
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
				alert("��й�ȣ�� �Է����ּ���!");
			} else {
				$.ajax({
					url : "CheckPw.do?pw=" + pw,
					success : function(data) {
						if (data == "success") {
							chPwF.style.display = "none";
							modi.style.display = "block";
							test();
						} else if(data == "fail") {
							alert("��й�ȣ�� Ȯ�����ּ���!");
						}
					}
				});
			}
		}
   </script>
</body>
</html>