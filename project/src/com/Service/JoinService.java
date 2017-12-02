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
		try {
			request.setCharacterEncoding("euc-kr");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		String email = request.getParameter("email");
		String phoneNum = request.getParameter("phoneNum");
		String pw = request.getParameter("pw");
		String category = request.getParameter("category");
		String location = request.getParameter("location");
		
		System.out.println(email + "/" + pw + "/" + phoneNum + "/" + category + "/" + location);
		
		MemberDAO dao = new MemberDAO();
		
		try {
			boolean isAdd = dao.addMember(new MemberDTO(email, pw, phoneNum, category, location));
			response.setContentType("text/html;charset=euc-kr");
			PrintWriter out = response.getWriter();
			
			if(isAdd) {
				HttpSession session = request.getSession();
				session.setAttribute("email", email);
			}
		} catch (Exception e) {
			System.out.println("Join -> " + e.getMessage());
			e.printStackTrace();
		}
	}
	
}
