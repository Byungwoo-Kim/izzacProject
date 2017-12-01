package com.Service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.MemberDAO;

public class FreeCheckService implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email"); 
		
		try {
			MemberDAO dao = new MemberDAO();
			boolean isDay = dao.FreeDaySelect(email);
			
			PrintWriter out = response.getWriter();
			
			if(isDay) {
				out.print("success");
			} else{
				out.print("fail");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
