package com.Service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.MemberDAO;
import com.DTO.MemberDTO;

public class JoinService implements Command{

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
				out.println("<script>alert('정상적으로 등록 되었습니다. 로그인 하세요!!');opener.window.location.reload();window.close();</script>");
			} else {
				out.println("<script>alert('같은 아이디가 존재 합니다!!');history.go(-1);</script>");
			}
		} catch (Exception e) {
			System.out.println("Join -> " + e.getMessage());
			e.printStackTrace();
		}
	}
	
}
