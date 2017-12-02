package com.Service;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.SupportDAO;
import com.DTO.SupportDTO;

public class SupportService implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("euc-kr");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String email = request.getParameter("sendEmail");
		String phoneNum = request.getParameter("phoneNum");
		String title = request.getParameter("supportTitle");
		String context = request.getParameter("supportMessage");
		
		System.out.println("문의사항: "+email+" / " +phoneNum+" / " +title+" / " +context);
		
		SupportDAO dao = new SupportDAO();
		
		try {
			boolean isAdd = dao.addSupport(new SupportDTO(email, phoneNum, title, context));
			response.setContentType("text/html;charset=euc-kr");
			PrintWriter out = response.getWriter();
			
			if(isAdd) {
				out.print("<script>alert('문의가 접수되었습니다.');</script>");
				
			}
			
		} catch (Exception e) {
			System.out.println("고객센터 -> "+e.getMessage());
			e.printStackTrace();
		}
		
	}

}
