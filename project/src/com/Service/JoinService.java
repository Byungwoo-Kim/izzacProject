package com.Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.MemberDAO;
import com.DTO.MemberDTO;

public class JoinService implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		int phoneNum = Integer.parseInt(request.getParameter("phoneNum"));
		String pw = request.getParameter("pw");
		String category = request.getParameter("category");
		String location = "";
		if(!(request.getParameter("location1").equals(""))) {
			location=request.getParameter("location1");
		}else if(!(request.getParameter("location2").equals(""))) {
			location=request.getParameter("location2");
		}else if(!(request.getParameter("location3").equals(""))) {
			location=request.getParameter("location3");
		}else if(!(request.getParameter("location4").equals(""))) {
			location=request.getParameter("location4");
		}else if(!(request.getParameter("location5").equals(""))) {
			location=request.getParameter("location5");
		}else if(!(request.getParameter("location6").equals(""))) {
			location=request.getParameter("location6");
		}else if(!(request.getParameter("location7").equals(""))) {
			location=request.getParameter("location7");
		}else if(!(request.getParameter("location8").equals(""))) {
			location=request.getParameter("location8");
		}
		
		System.out.println(location);
		
		MemberDAO dao = new MemberDAO();
		
		try {
			boolean isAdd = dao.addMember(new MemberDTO(email, pw, phoneNum, category, location));
			response.setContentType("text/html;charset=euc-kr");
			PrintWriter out = response.getWriter();
			
			if(isAdd) {
				HttpSession session = request.getSession();
				session.setAttribute("email", email);
				
				out.println("<script>alert('가입완료! 로그인 되었습니다!');opener.window.location.reload();window.close();</script>");
			} else {
				out.println("<script>alert('같은 아이디가 존재 합니다!!');history.go('dasol.html#signup');</script>");
			}
		} catch (Exception e) {
			System.out.println("Join -> " + e.getMessage());
			e.printStackTrace();
		}
	}
	
}
