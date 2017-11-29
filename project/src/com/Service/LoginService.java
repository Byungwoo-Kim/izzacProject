package com.Service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.MemberDAO;

public class LoginService implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		
		System.out.println("login : " + email +" / " + pw);
		
		MemberDAO dao = new MemberDAO();
		
		try {
			boolean isLogin = dao.login(email, pw);
			response.setContentType("text/html;charset=euc-kr");
			PrintWriter out = response.getWriter();
			
			if(isLogin) {
				HttpSession session = request.getSession();
				session.setAttribute("email", email);
				
				out.println("<script>opener.window.location.reload();window.close();</script>");
				//response.sendRedirect("index.jsp");
			} else {
				out.println("<script>alert('이메일 혹은 비밀번호가 맞지 않습니다!');history.go(-1);</script>");
			}
		} catch (Exception e) {
			System.out.println("Login -> " + e.getMessage());
			e.printStackTrace();
		}
	}

}
