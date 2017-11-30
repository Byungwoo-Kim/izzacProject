package com.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.MemberDAO;

/**
 * Servlet implementation class EmailCheck
 */
@WebServlet("/EmailCheck")
public class EmailCheck extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		
		System.out.println("check : " + email);
		
		PrintWriter out = response.getWriter();
		
		MemberDAO dao = new MemberDAO();
		
		try {
			boolean isCheck = dao.emailCheck(email);
			
			if (isCheck) {
				out.print("success");
			} else {
				out.print("fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
