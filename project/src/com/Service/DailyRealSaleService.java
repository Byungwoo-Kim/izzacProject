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
import com.DTO.PreDTO;

@WebServlet("/DailyRealSaleService")
public class DailyRealSaleService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		System.out.println("«œ∑Á √—∏≈√‚ º≠∫Ì∏¥");

		String email = (String) session.getAttribute("email");

		String year = request.getParameter("year");
		int month = Integer.parseInt(request.getParameter("month"));
		String date = request.getParameter("date");
		if ((date.length()) == 1) {
			date = "0" + date;

		}
		String selectedDate = year + "-" + (month + 1) + "-" + date;
		System.out.println(selectedDate);
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

		String analMoney = "";
		for (int i = 0; i < list.size(); i++) {
			if ((list.get(i).getaDate()).equals(selectedDate)) {

				analMoney = list.get(i).getAnalMoney();
			}
		}
		System.out.println(analMoney);
		out.print(analMoney);

	}

}
