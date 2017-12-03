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
import com.DTO.PreDTO;

@WebServlet("/DailyAccurService")
public class DailyAccurService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
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

		ArrayList<PreDTO> list = new ArrayList<>();
		try {
			list = dao.SelectPre(email);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String Accuracy = "";
		String PreData = "";
		for (int i = 0; i < list.size(); i++) {
			if ((list.get(i).getpDate()).equals(selectedDate)) {

				Accuracy = list.get(i).getPreAccu();
			}
		}
		System.out.println(Accuracy);
		out.print(Accuracy);

	}
}
