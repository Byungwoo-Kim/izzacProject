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
		
		MemberDAO dao = new MemberDAO();
		
		try {
			boolean isAdd = dao.addMember(new MemberDTO(email, pw, phoneNum, category));
			response.setContentType("text/html;charset=euc-kr");
			PrintWriter out = response.getWriter();
			
			if(isAdd) {
				HttpSession session = request.getSession();
				session.setAttribute("email", email);
				
				out.println("<script>alert('���������� ��� �Ǿ����ϴ�. �α��� �ϼ���!!');opener.window.location.reload();window.close();</script>");
			} else {
				out.println("<script>alert('���� ���̵� ���� �մϴ�!!');history.go(-1);</script>");
			}
		} catch (Exception e) {
			System.out.println("Join -> " + e.getMessage());
			e.printStackTrace();
		}
	}
	
}
