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

@WebServlet("/DailyRealSaleServiceForBar")
public class DailyRealSaleServiceForBar extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("barchart 서블릿 진입");
		
		
		 
		HttpSession session = request.getSession();

		String email = (String) session.getAttribute("email");

		String year = request.getParameter("year");
		int month = Integer.parseInt(request.getParameter("month"));
		String date = request.getParameter("date");
		if ((date.length()) == 1) {
			date = "0" + date;

		}
		String selectedDate = year + "-" + month + "-" + date;
		System.out.println("BarChart WholeSale selectedDate : " + selectedDate);
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

		String analMoney1 = "";
		String analMoney2 = "";
		String analMoney3 = "";
		String analMoney4 = "";
		String analMoney5 = "";
		String analMoney6 = "";
		String analMoney7 = "";

		for (int i = 0; i < list.size(); i++) {
			if ((list.get(i).getaDate()).equals(selectedDate)) {

				analMoney7 = list.get(i).getAnalMoney();
				if (list.get(i - 1) != null) {
					analMoney6 = list.get(i - 1).getAnalMoney();
					if (list.get(i - 2) != null) {
						analMoney5 = list.get(i - 2).getAnalMoney();
						if (list.get(i - 3) != null) {
							analMoney4 = list.get(i - 3).getAnalMoney();
							if (list.get(i - 4) != null) {
								analMoney3 = list.get(i - 4).getAnalMoney();
								if (list.get(i - 5) != null) {
									analMoney2 = list.get(i - 5).getAnalMoney();
									if (list.get(i - 6) != null) {
										analMoney1 = list.get(i - 6).getAnalMoney();
									} else {
										analMoney1 = "0";
									}
								} else {
									analMoney2 = "0";
								}
							} else {
								analMoney3 = "0";
							}
						} else {
							analMoney4 = "0";
						}
					} else {
						analMoney5 = "0";
					}
				} else {
					analMoney6 = "0";

				}

				System.out.println("RealSale analMoney : " + analMoney7);
				break;
			}
		}
		String weeklyMoney = analMoney1 + "^" + analMoney2 + "^" +analMoney3 + "^" +analMoney4 + "^" +analMoney5 + "^" +analMoney6 + "^" +analMoney7;
		System.out.println("bar차트용 1주일 돈 : " + weeklyMoney);
		
		out.print(weeklyMoney);

	}
}
