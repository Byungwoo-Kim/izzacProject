package com.Service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.MemberDAO;

public class CheckPwService implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email"); 
		String pw = request.getParameter("pw");
		
		System.out.println("email : " + email + " / pw : " + pw);
		
		try {
			MemberDAO dao = new MemberDAO();
			
			response.setContentType("text/html;charset=euc-kr");
			PrintWriter out = response.getWriter();
			
			boolean isPwCk = dao.CheckPw(email, pw);
			
			if(isPwCk) {
				out.print("success");
			} else {
				out.print("fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
