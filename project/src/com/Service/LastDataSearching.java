package com.Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.DataDAO;
import com.DTO.AnalDTO;

@WebServlet("/LastDataSearching")
public class LastDataSearching extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String email = (String) session.getAttribute("email");
		System.out.println("email : " + email);
		
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();

		DataDAO dao = new DataDAO();

		ArrayList<AnalDTO> list = new ArrayList<>();
		try {

			list = dao.SelectAnal(email);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String lastDate = "";
		System.out.println(list);
		for (int i = 0; i < list.size(); i++) {
			lastDate = list.get(i).getaDate();
		}
		System.out.println("마막지으로 저장된 날짜 : " + lastDate);
		out.print(lastDate);
	}

}
