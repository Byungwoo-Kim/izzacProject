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

@WebServlet("/DailyResultService")
public class DailyResultService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");

		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String date = request.getParameter("date");
		String selectedDate = year + "-" + month + "-" + date;
		System.out.println(selectedDate);
		PrintWriter out = response.getWriter();

		DataDAO dao = new DataDAO();

		ArrayList<AnalDTO> list = new ArrayList<>();
		String emailExample = "test@test";
		try {
			System.out.println("여기까진 됐고,");
			list = dao.SelectAnal(emailExample);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("선택한 날짜 : " + selectedDate);
		System.out.println("데이터 날짜 : " + list.get(0).getaDate());
		String AnalData = "";
		for (int i = 0; i < list.size(); i++) {
			if ((list.get(i).getaDate()).equals(selectedDate)) {
				System.out.println("1단계");
				AnalData = list.get(i).getAnalData();

			}
		}
		System.out.println(AnalData);
		out.print(AnalData);

	}

}
