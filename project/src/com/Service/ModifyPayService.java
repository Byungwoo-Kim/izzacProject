package com.Service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.MemberDAO;

public class ModifyPayService implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email"); 
		int payDate = Integer.parseInt(request.getParameter("payDate"));
		
		try {
			MemberDAO dao = new MemberDAO();
			
			response.setContentType("text/html;charset=euc-kr");
			PrintWriter out = response.getWriter();
			
			int cnt = dao.MemberPayDateUpdate(email, payDate);
			
			if(cnt > 0) {
				out.println("<script>alert('결제완료!');opener.window.location.reload();window.close();</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
