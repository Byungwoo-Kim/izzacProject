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

		ArrayList<PreDTO> list = new ArrayList<>();
		String emailExample = "test@test";
		System.out.println(emailExample);
		try {
			list = dao.SelectPre(emailExample);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(list.get(0).getPreData0());
		String all = "";
		for (int i = 0; i < list.size(); i++) {
			if ((list.get(i).getpDate()).equals(selectedDate)) {
				System.out.println("1´Ü°è");
				String choice1 = list.get(i).getPreData0();
				System.out.println(choice1);
				String choice2 = list.get(i).getPreData1();
				String choice3 = list.get(i).getPreData2();
				String choice4 = list.get(i).getPreData3();
				String choice5 = list.get(i).getPreData4();
				String choice6 = list.get(i).getPreData5();
				String choice7 = list.get(i).getPreData6();
				String choice8 = list.get(i).getPreData7();
				all += choice1 + ",";
				all += choice2 + ",";
				all += choice3 + ",";
				all += choice4 + ",";
				all += choice5 + ",";
				all += choice6 + ",";
				all += choice7 + ",";
				all += choice8 + ",";

			}
		}
		System.out.println(all);
		out.print(all);

	}

}
