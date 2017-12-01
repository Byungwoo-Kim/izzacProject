package com.Service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.MemberDAO;

public class UpdateService implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		
		String newPw = request.getParameter("NewPw");
		String newPhone = request.getParameter("NewPhone");
		String category = request.getParameter("category");
		
		System.out.println(category);
		
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
		int environ = Integer.parseInt(request.getParameter("environ"));
		
		MemberDAO dao = new MemberDAO();
		
		try {
			response.setContentType("text/html;charset=euc-kr");
			PrintWriter out = response.getWriter();
			
			int cnt;
			if(!newPw.equals("")) {
				cnt = dao.MemberUpdate(email, newPw, newPhone, category, location, environ);
			} else {
				cnt = dao.MemberUpdate(email, newPhone, category, location, environ);
			}
			
			if(cnt > 0) {
				out.println("<script>alert('수정완료!');</script>");
				response.sendRedirect("MainContents.jsp");
			} else {
				out.println("<script>alert('수정실패 ㅜㅜ');history.go(-1);</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
